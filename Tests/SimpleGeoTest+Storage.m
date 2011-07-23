//
//  SimpleGeoTest+Storage.m
//  SimpleGeo.framework
//
//  Copyright (c) 2011, SimpleGeo Inc.
//  All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "SimpleGeoTest.h"
#import "SimpleGeo+Storage.h"
#import "NSArray+SGCollection.h"

#define SGTestRecordID @"Simple Test Record"
#define SGTestLayer @"com.simplegeo.testing.ios"
#define SGTestPropStringKey @"stringKey"
#define SGTestPropStringValue @"stringValue"
#define SGTestPropNumberKey @"numKey"
#define SGTestPropNumberValue [NSNumber numberWithDouble:1.2345]
#define SGTestPropBooleanKey @"boolKey"
#define SGTestPropBooleanValue [NSNumber numberWithBool:YES]
#define SGTestNumRecords 4
#define SGTestLayersCursor @"ImVkdS5jb2x1bWJpYS5jaWVzaW4uZ3B3My5wZGVucy4yMDEwYSI="

#pragma mark Storage Test Data

@interface SimpleGeoTest (StorageData)
@end
@implementation SimpleGeoTest (StorageData)

- (SGStoredRecord *)recordSimple
{
    return [SGStoredRecord recordWithID:SGTestRecordID
                                  point:[self point]
                                  layer:SGTestLayer];
}

- (SGStoredRecord *)recordSimpleMoved
{
    return [SGStoredRecord recordWithID:SGTestRecordID
                                  point:[self outlierPoint]
                                  layer:SGTestLayer];
}

- (SGStoredRecord *)recordWithCreationDate
{
    SGStoredRecord *record = [SGStoredRecord recordWithID:@"Test Record With Creation Date"
                                                    point:[self point]
                                                    layer:SGTestLayer];
    [record setCreated:[NSDate dateWithTimeIntervalSince1970:12345]];
    return record;
}

- (SGStoredRecord *)recordWithProperties
{
    SGStoredRecord *record = [SGStoredRecord recordWithID:@"Test Record With Properties"
                                                    point:[self point]
                                                    layer:SGTestLayer];
    [record setProperties:[NSDictionary dictionaryWithObjectsAndKeys:
                           SGTestPropStringValue, SGTestPropStringKey,
                           SGTestPropNumberValue, SGTestPropNumberKey,
                           SGTestPropBooleanValue, SGTestPropBooleanKey,
                           nil]];
    return record;
}

- (SGStoredRecord *)recordWithFakeProperties
{
    SGStoredRecord *record = [SGStoredRecord recordWithID:@"Test Record With Fake Properties"
                                                    point:[self point]
                                                    layer:SGTestLayer];
    [record setProperties:[NSDictionary dictionaryWithObjectsAndKeys:
                           @"fake", SGTestPropStringKey,
                           [NSNumber numberWithInt:69], SGTestPropNumberKey,
                           [NSNumber numberWithBool:NO], SGTestPropBooleanKey,
                           nil]];
    return record;
}

@end

#pragma mark Storage Add/Update Tests

@interface StorageAddTests : SimpleGeoTest
@end
@implementation StorageAddTests

- (void)testAddLayer
{
    [self prepare];
    [[self client] addOrUpdateLayer:SGTestLayer
                              title:@"Temporary iOS Test Layer"
                        description:@"SimpleGeo iOS client test layer"
                       callbackURLs:nil
                           callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testAddedLayerUpdate
{
    [self prepare];
    [[self client] addOrUpdateLayer:SGTestLayer
                              title:@"Temporary iOS Test Layer"
                        description:@"updated!"
                       callbackURLs:nil
                           callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testAddRecord
{
    [self prepare];
    [[self client] addOrUpdateRecord:[self recordSimple]
                            callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testAddUpdateRecords
{
    [self prepare];
    NSArray *records = [NSArray arrayWithObjects:
                        [self recordSimpleMoved],
                        [self recordWithCreationDate],
                        [self recordWithProperties],
                        [self recordWithFakeProperties],
                        nil];
    [[self client] addOrUpdateRecords:records
                              inLayer:SGTestLayer
                             callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

#pragma mark Storage Requests Tests

@interface StorageGetTests : SimpleGeoTest
@end
@implementation StorageGetTests

- (void)testGetRecordAndConvert
{
    [self prepare];
    [[self client] getRecord:[self recordSimple].identifier
                     inLayer:SGTestLayer
                    callback:[SGCallback callbackWithSuccessBlock:
                              ^(NSDictionary *response) {
                                  SGStoredRecord *record = [SGStoredRecord recordWithGeoJSON:response];
                                  NSLog(@"SGStoredRecord: %@", record);
                                  GHAssertEqualObjects(response, [record asGeoJSON],
                                                       @"Record's GeoJSON should match response geoJSON");
                                  [self successBlock](response);
                              } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsForPointAndConvertRecordCollection
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count], SGTestNumRecords,
                                                          @"Should return all records");
                                           [self checkSGCollectionConversion:response type:SGCollectionTypeRecords];
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsForAddress
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithAddress:SGTestAddress layer:SGTestLayer];
    [[self client] getRecordsForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsForEnvelope
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithEnvelope:[self envelope] layer:SGTestLayer];
    [[self client] getRecordsForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsWithLimit
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setLimit:SGTestLimit];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertLessThanOrEqual((int)[[response objectForKey:@"features"] count],
                                                                   SGTestLimit, @"Should return no more records than the limit");
                                           [self checkSGCollectionConversion:response type:SGCollectionTypeRecords];
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsWithRadius
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setRadius:SGTestRadius];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count],
                                                          SGTestNumRecords-1, @"Should omit outlier record");
                                           [self checkSGCollectionConversion:response type:SGCollectionTypeRecords];
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsInDateRange
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setDateRangeFrom:[[self recordWithCreationDate].created dateByAddingTimeInterval:-1]
                         to:[[self recordWithCreationDate].created dateByAddingTimeInterval:1]];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count],
                                                          1, @"Should return single matching record");
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsMatchingKey
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setProperty:SGTestPropNumberKey
                ofType:SGStoredPropertyTypeNumber];
    [query setSortType:SGSortOrderPropertyDescending];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count],
                                                          2, @"Should return two matching records");
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsMatchingStringProperty
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setProperty:SGTestPropStringKey
                ofType:SGStoredPropertyTypeString
                equals:SGTestPropStringValue];
    [query setSortType:SGSortOrderCreatedDescending];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count],
                                                          1, @"Should return one matching record");
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsMatchingBooleanProperty
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setProperty:SGTestPropBooleanKey
                ofType:SGStoredPropertyTypeBoolean
                equals:SGTestPropBooleanValue];
    [query setSortType:SGSortOrderDistance];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count],
                                                          1, @"Should return one matching record");
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsMatchingNumberPropertyRange
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setProperty:SGTestPropNumberKey ofType:SGStoredPropertyTypeNumber];
    [query setPropertyStartValue:[NSNumber numberWithDouble:1.0]];
    [query setPropertyEndValue:[NSNumber numberWithDouble:2.0]];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertEquals((int)[[response objectForKey:@"features"] count],
                                                          1, @"Should return one matching record");
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordHistoryAndConvertGeometryCollection
{
    [self prepare];
    [[self client] getHistoryForRecord:SGTestRecordID
                               inLayer:SGTestLayer
                                 limit:[NSNumber numberWithInt:1]
                                cursor:nil
                              callback:[SGCallback callbackWithSuccessBlock:
                                        ^(NSDictionary *response) {
                                            NSObject *cursor = [response objectForKey:@"next_cursor"];
                                            if ([cursor isKindOfClass:[NSString class]]) [self setRecordHistoryCursor:(NSString *)cursor];
                                            GHAssertGreaterThan((int)[[response objectForKey:@"geometries"] count], 0,
                                                                @"Should return at least one geometry");
                                            GHAssertLessThanOrEqual((int)[[response objectForKey:@"geometries"] count],
                                                                   SGTestLimit, @"Should return no more history records than the limit");
                                            [self checkSGCollectionConversion:response type:SGCollectionTypePoints];
                                            [self successBlock](response);
                                        } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordHistoryWithCursor
{
    [self prepare];
    [[self client] getHistoryForRecord:SGTestRecordID
                               inLayer:SGTestLayer
                                 limit:nil
                                cursor:self.recordHistoryCursor
                              callback:[SGCallback callbackWithSuccessBlock:
                                        ^(NSDictionary *response) {
                                            GHAssertGreaterThan((int)[[response objectForKey:@"geometries"] count], 0,
                                                                @"Should return at least one geometry");
                                            [self successBlock](response);
                                        } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

#pragma mark Layers Request Tests

- (void)testGetLayer
{
    [self prepare];
    [[self client] getLayer:SGTestLayer callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetLayers
{
    [self prepare];
    [[self client] getLayersWithCallback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetLayersWithCursor
{
    [self prepare];
    [[self client] getLayersWithCursor:SGTestLayersCursor callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

#pragma mark Storage Delete Tests

@interface StorageRemoveTests : SimpleGeoTest
@end
@implementation StorageRemoveTests

- (void)test_DeleteRecord
{
    [self prepare];
    [[self client] deleteRecord:SGTestRecordID
                        inLayer:SGTestLayer
                       callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)test__DeleteLayer
{
    [self prepare];
    [[self client] deleteLayer:@"com.simplegeo.testing.ios"
                      callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

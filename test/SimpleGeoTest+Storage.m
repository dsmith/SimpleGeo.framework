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
#import "NSArray+GeoJSON.h"

@interface StorageReadTests : SimpleGeoTest
@end

@implementation StorageReadTests

#pragma mark Records Requests Tests

- (void)testGetRecordAndConvert
{
    [self prepare];
    [[self client] getRecord:SGTestStorageGETRecordID
                     inLayer:SGTestStorageGETLayer
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

- (void)testGetRecordsForPoint
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestStorageGETLayer];
    [[self client] getRecordsForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsForAddress
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithAddress:SGTestAddress layer:SGTestStorageGETLayer];
    [[self client] getRecordsForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsForEnvelope
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithEnvelope:[self envelope] layer:SGTestStorageGETLayer];
    [[self client] getRecordsForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsWithLimitsAndConvertRecordCollection
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestStorageGETLayer];
    [query setRadius:SGTestRadius];
    [query setLimit:SGTestLimit];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           GHAssertLessThanOrEqual((int)[[response objectForKey:@"features"] count],
                                                                   query.limit, @"Should return no more records than the limit");
                                           [self checkGeoJSONCollectionConversion:response type:GeoJSONCollectionTypeFeature];
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsInDateRangeAndSort
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestStorageGETLayer];
    [query setStartDate:[NSDate dateWithTimeIntervalSinceNow:SGTestStorageGETStart]];
    [query setStartDate:[NSDate dateWithTimeIntervalSinceNow:SGTestStorageGETEnd]];
    [query setSortType:SGSortOrderCreatedDescending];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           // TODO check dates
                                           // TODO check sorting
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsMatchingStringProperty
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestStorageGETLayer];
    [query setProperty:SGTestStorageGETPropStringKey
                ofType:SGStoredPropertyTypeString
                equals:SGTestStorageGETPropStringValue];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           // TODO check property
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordsMatchingBooleanProperty
{
    // TODO
    GHAssertNotNil(nil, @"bool prop");
}

- (void)testGetRecordsMatchingNumberPropertyRange
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestStorageGETLayer];
    [query setProperty:SGTestStorageGETPropNumberKey ofType:SGStoredPropertyTypeNumber];
    [query setPropertyStartValue:[NSNumber numberWithInt:SGTestStorageGETPropNumberStartValue]];
    [query setPropertyEndValue:[NSNumber numberWithInt:SGTestStorageGETPropNumberEndValue]];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           // TODO check property range
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordHistoryAndConvertGeometryCollection
{
    [self prepare];
    [[self client] getHistoryForRecord:SGTestStorageGETRecordID
                               inLayer:SGTestStorageGETLayer
                                 limit:[NSNumber numberWithInt:SGTestLimit]
                                cursor:nil
                              callback:[SGCallback callbackWithSuccessBlock:
                                        ^(NSDictionary *response) {
                                            GHAssertLessThanOrEqual((int)[[response objectForKey:@"geometries"] count],
                                                                   SGTestLimit, @"Should return no more history records than the limit");
                                            [self checkGeoJSONCollectionConversion:response type:GeoJSONCollectionTypeGeometry];
                                            [self successBlock](response);
                                        } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordHistoryWithCursor
{
    // TODO
    GHAssertNotNil(nil, @"history pagination");
}

#pragma mark Layers Request Tests

- (void)testGetLayer
{
    [self prepare];
    [[self client] getLayer:SGTestStorageGETLayer callback:SGTestCallback];
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
    [[self client] getLayersWithCursor:SGTestStorageGETLayersCursor callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

@interface StorageWriteTests : SimpleGeoTest
@end

@implementation StorageWriteTests

#pragma mark Layers Manipulation Tests

- (void)testAddLayer
{
    [self prepare];
    [[self client] addOrUpdateLayer:SGTestStoragePOSTLayer
                              title:@"Temporary iOS Test Layer"
                        description:@"SimpleGeo iOS client test layer"
                       callbackURLs:nil
                           callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testUpdateLayer
{
    [self prepare];
    [[self client] addOrUpdateLayer:SGTestStoragePOSTLayer
                              title:@"Temporary iOS Test Layer"
                        description:@"updated!"
                       callbackURLs:nil
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

#pragma mark Records Manipulation Tests

- (void)testAddRecord
{
    [self prepare];
    SGStoredRecord *record = [SGStoredRecord recordWithFeature:[self feature]
                                                         layer:SGTestStoragePOSTLayer];
    [record setIdentifier:SGTestPOSTFeatureID];
    [[self client] addOrUpdateRecord:record
                            callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testAddUpdateRecords
{
    [self prepare];
    SGStoredRecord *record = [SGStoredRecord recordWithID:SGTestPOSTFeatureID
                                                    point:[self point]
                                                    layer:SGTestStoragePOSTLayer];
    [[self client] addOrUpdateRecord:record
                            callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)test_DeleteRecord
{
    [self prepare];
    [[self client] deleteRecord:SGTestPOSTFeatureID
                        inLayer:SGTestStoragePOSTLayer
                       callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

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

@implementation SimpleGeoTest (Storage)

#pragma mark Records Requests Tests

- (void)testGetRecordAndConversion
{
    [self prepare];
    [[self client] getRecord:SGTestRecordID
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

- (void)testGetRecordsForPoint
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [[self client] getRecordsForQuery:query callback:SGTestCallback];
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

- (void)testGetRecordsWithLimitsAndRecordCollectionConversion
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setRadius:15.0];
    [query setLimit:10];
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

- (void)testGetRecordsInDateRangeAndSortingScheme
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setStartDate:[NSDate dateWithTimeIntervalSinceNow:-20000]];
    [query setStartDate:[NSDate date]];
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
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setProperty:SGTestPropertyString
                ofType:SGStoredPropertyTypeString
                equals:SGTestPropertyStringValue];
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
    // property = value
}

- (void)testGetRecordsMatchingNumberPropertyRange
{
    [self prepare];
    SGStorageQuery *query = [SGStorageQuery queryWithPoint:[self point] layer:SGTestLayer];
    [query setProperty:SGTestPropertyNumber ofType:SGStoredPropertyTypeNumber];
    [query setPropertyStartValue:[NSNumber numberWithInt:SGTestPropertyNumberStart]];
    [query setPropertyEndValue:[NSNumber numberWithInt:SGTestPropertyNumberEnd]];
    [[self client] getRecordsForQuery:query
                             callback:[SGCallback callbackWithSuccessBlock:
                                       ^(NSDictionary *response) {
                                           // TODO check property range
                                           [self successBlock](response);
                                       } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetRecordHistory
{
    [self prepare];
    [[self client] getHistoryForRecord:SGTestRecordID
                               inLayer:SGTestLayer
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
    // history pagination
}

#pragma mark Records Manipulation Tests

// add
// add many
// update
// update many
// delete

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
    [[self client] getLayersWithCursor:SGTestLayerCursor callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

#pragma mark Layers Manipulation Tests

// add layer
// update layer
// delete layer

@end

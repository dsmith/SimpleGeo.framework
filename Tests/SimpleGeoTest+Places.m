//
//  SimpleGeoTest+Places.m
//  SimpleGeo.framework
//
//  Copyright (c) 2010, SimpleGeo Inc.
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

/*#import "SimpleGeoTest.h"
#import "SimpleGeo+Places.h"

#pragma mark Places Test Data

@interface SimpleGeoTest (StorageData)

- (SGPlace *)placeSimple;
- (SGPlace *)placeTaggedOutlier;
- (SGPlace *)placeClassified;
- (SGPlace *)placePrivate;

@end

@implementation SimpleGeoTest (StorageData)

- (SGPlace *)placeSimple
{
    return [SGPlace placeWithName:@"Simple Place"
                            point:[self point]];
}

- (SGPlace *)placeTaggedOutlier
{
    SGPlace *place = [SGPlace placeWithName:@"Tagged Place"
                                      point:[self outlierPoint]];
    [place setTags:[NSMutableArray arrayWithObjects:@"tag1", @"tag2", nil]];
    return place;
}

- (SGPlace *)placeClassified
{
    SGPlace *place = [SGPlace placeWithName:@"Classified Place"
                                      point:[self point]];
    NSDictionary *classifier1 = [NSDictionary classifierWithType:SGFeatureTypePublicPlace
                                                        category:SGPlacesCategoryArtsCenter
                                                     subcategory:SGPlacesCategoryArtMuseum];
    NSDictionary *classifier2 = [NSDictionary classifierWithType:SGFeatureTypePublicPlace
                                                        category:SGPlacesCategoryPark
                                                     subcategory:SGPlacesCategoryStadium];
    [place setClassifiers:[NSMutableArray arrayWithObjects:classifier1, classifier2, nil]];
    return place;
}

- (SGPlace *)placePrivate
{
    return [SGPlace placeWithName:@"Private Place"
                            point:[self point]];
}

@end

#pragma mark Places Add/Update Tests

@interface PlacesAddTests : SimpleGeoTest
@end
@implementation PlacesAddTests

- (void)testAddPlace
{
    [self prepare];
    [[self client] addPlace:[self placeSimple]
                   callback:[SGCallback callbackWithSuccessBlock:
                             ^(NSDictionary *response) {
                                 [self setAddedPlaceIDs:[NSMutableArray arrayWithObject:[response objectForKey:@"id"]]];
                                 [self successBlock](response);
                             } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testAddPlaceWithTags
{
    [self prepare];
    [[self client] addPlace:[self placeTaggedOutlier]
                   callback:[SGCallback callbackWithSuccessBlock:
                             ^(NSDictionary *response) {
                                 [addedPlaceIDs addObject:[response objectForKey:@"id"]];
                                 [self successBlock](response);
                             } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testAddPlaceWithClassifiers
{
    [self prepare];
    [[self client] addPlace:[self placeClassified]
                   callback:[SGCallback callbackWithSuccessBlock:
                             ^(NSDictionary *response) {
                                 [addedPlaceIDs addObject:[response objectForKey:@"id"]];
                                 [self successBlock](response);
                             } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testUpdatePlaceWithPrivacy
{
    [self prepare];
    [[self client] updatePlace:[self.addedPlaceIDs objectAtIndex:0]
                     withPlace:[self placePrivate]
                      callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

#pragma mark Places Requests Tests

@interface PlacesGetTests : SimpleGeoTest
@end
@implementation PlacesGetTests

- (void)testGetPlacesForPoint
{
    [self prepare];
    SGPlacesQuery *query = [SGPlacesQuery queryWithPoint:[self point]];
    [[self client] getPlacesForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPlacesForAddress
{
    [self prepare];
    SGPlacesQuery *query = [SGPlacesQuery queryWithAddress:SGTestAddress];
    [[self client] getPlacesForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPlacesForEnvelope
{
    [self prepare];
    SGPlacesQuery *query = [SGPlacesQuery queryWithEnvelope:[self envelope]];
    [[self client] getPlacesForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPlacesWithLimitsAndConvertFeatureCollection
{
    [self prepare];
    SGPlacesQuery *query = [SGPlacesQuery queryWithPoint:[self point]];
    [query setRadius:SGTestRadius];
    [query setLimit:SGTestLimit];
    [[self client] getPlacesForQuery:query
                            callback:[SGCallback callbackWithSuccessBlock:
                                   ^(NSDictionary *response) {
                                       GHAssertLessThanOrEqual((int)[[response objectForKey:@"features"] count],
                                                               query.limit, @"Should return no more records than the limit");
                                       [self checkSGCollectionConversion:response type:SGCollectionTypePlaces];
                                       [self successBlock](response);
                                   } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPlacesWithFilters
{
    [self prepare];
    SGPlacesQuery *query = [SGPlacesQuery queryWithAddress:SGTestAddress];
    [query setCategories:SGTestPlacesCategories];
    [query setSearchString:SGTestPlacesSearchString];
    [[self client] getPlacesForQuery:query callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

#pragma mark Places Delete Tests

@interface PlacesRemoveTests : SimpleGeoTest
@end
@implementation PlacesRemoveTests

- (void)test_DeletePlace
{
    [self prepare];
    [[self client] deletePlace:[self.addedPlaceIDs objectAtIndex:0]
                      callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)test_DeleteUpdatedPlace
{
    [self prepare];
    [[self client] deletePlace:[self.addedPlaceIDs objectAtIndex:1]
                      callback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end*/

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

#import "SimpleGeoTest.h"
#import "SimpleGeo+Places.h"

@implementation SimpleGeoTest (Places)

- (void)testGetPlacesForPoint
{
    [self prepare];
    SGPlacesQuery *testQuery = [SGPlacesQuery queryWithPoint:[self point]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getPlacesForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPlacesForAddress
{
    [self prepare];
    SGPlacesQuery *testQuery = [SGPlacesQuery queryWithAddress:SGTestAddress];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getPlacesForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPlacesWithComplexQuery
{
    [self prepare];
    SGPlacesQuery *testQuery = [SGPlacesQuery queryWithPoint:[self point]];
    [testQuery setRadius:5.0];
    [testQuery setLimit:3];
    [testQuery setCategories:[NSArray arrayWithObjects:SGPlacesCategoryRestaurant, SGFeatureTypeFoodAndDrink, nil]];
    [testQuery setSearchString:@"Sparky"];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getPlacesForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

#pragma mark SimpleGeoPlaceDelegate Methods

- (void)didLoadPlaces:(SGFeatureCollection *)places
           forSGQuery:(SGPlacesQuery *)query
{
    GHTestLog(@"Did load places for query: %@", [query asDictionary]);
    GHTestLog(@"With results: %@", [places asDictionary]);
    
    SEL testName = NSSelectorFromString([[query userInfo] objectForKey:@"testName"]);
    [self notify:kGHUnitWaitStatusSuccess forSelector:testName];
    
    int numParts = [places.features count];
    if (query.limit) GHAssertEquals(numParts, query.limit, @"Limit used. Response should be limited to n features.");
    else GHAssertGreaterThan(numParts, 0, @"Valid query. Response should contain at lease one feature.");
}

@end

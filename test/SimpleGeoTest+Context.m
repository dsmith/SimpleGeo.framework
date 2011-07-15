//
//  SimpleGeoTest+Context.m
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
#import "SimpleGeo+Context.h"

@implementation SimpleGeoTest (Context)

- (void)testGetContextForPoint
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextForAddress
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithAddress:SGTestAddress];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextForEnvelope
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithEnvelope:[self envelope]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextWithFilters
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setFilters:[NSArray arrayWithObjects:SGContextFilterIntersections, SGContextFilterAddress, nil]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextWithFeatureCategories
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setFeatureCategories:[NSArray arrayWithObjects:SGFeatureCategoryPostalCode, SGFeatureCategoryNational, nil]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextWithFeatureSubcategories
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setFeatureSubcategories:[NSArray arrayWithObjects:SGFeatureSubcategoryCity, SGFeatureSubcategoryState, nil]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextWithDemographicsTables
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setAcsTableIDs:[NSArray arrayWithObjects:@"B01001", @"B01002", nil]];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

#pragma mark SimpleGeoContextDelegate Methods

- (void)didLoadContext:(NSDictionary *)context
            forSGQuery:(SGContextQuery *)query
{
    GHTestLog(@"Did load context for query: %@", [query asDictionary]);
    GHTestLog(@"With results: %@", context);
    
    /* Check parts count */
    int numParts = [context count];
    if (query.envelope) GHAssertEquals(numParts, 3, @"Envelope query. Context dictionary should contain three parts (query, timestamp, features).");
    else if (query.filters) GHAssertEquals(numParts, [query.filters count], @"n filters used. Context dictionary should contain n parts.");
    else GHAssertGreaterThan(numParts, 3, @"No filter used. Context dictionary should contain many parts.");
    
    /* Check features */
    int numFeatures = [[context objectForKey:SGContextFilterFeatures] count];
    if (!query.filters) GHAssertGreaterThan(numFeatures, 0, @"Should return at least one feature.");
    
    /* Check demographics */
    int numDemographicsParts = [[context objectForKey:SGContextFilterDemographics] count];
    int numACSTables = [query.acsTableIDs count];
    if (!query.envelope && !query.filters) GHAssertEquals(numDemographicsParts, numACSTables+1, @"Demographics requested. Context dictionary should contain correct number of demographics metrics.");
    
    SEL testName = NSSelectorFromString([[query userInfo] objectForKey:@"testName"]);
    [self notify:kGHUnitWaitStatusSuccess forSelector:testName];
}

@end

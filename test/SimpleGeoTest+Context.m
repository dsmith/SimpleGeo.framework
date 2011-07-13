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
    SGContextQuery *testQuery = [SGContextQuery queryWithAddress:[self address]];
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

- (void)testGetContextWithFilter
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setFilter:SGContextFilterIntersections];
    [testQuery setUserInfo:[NSDictionary dictionaryWithObject:NSStringFromSelector(_cmd) forKey:@"testName"]];
    [[self client] getContextForQuery:testQuery];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetContextWithFeaturesCategory
{
    [self prepare];
    SGContextQuery *testQuery = [SGContextQuery queryWithPoint:[self point]];
    [testQuery setFeatureCategory:SGFeatureCategoryPostalCode];
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
    
    SEL testName = NSSelectorFromString([[query userInfo] objectForKey:@"testName"]);
    [self notify:kGHUnitWaitStatusSuccess forSelector:testName];
    
    if ([query filter]) GHAssertEquals([context count], 1, @"Filter used. Context dictionary should contain a single entry.");
    else GHAssertGreaterThan([context count], 1, @"No filter used. Context dictionary should contain multiple entries.");
}

@end

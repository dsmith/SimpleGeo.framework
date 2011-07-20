//
//  SimpleGeoTest+Feature.m
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
#import "SimpleGeo+Feature.h"

@interface FeaturesTests : SimpleGeoTest
@end

@implementation FeaturesTests

#pragma mark Feature Request & Conversion Tests

- (void)testGetPointFeatureAndConvert
{
    [self prepare];
    [[self client] getFeatureWithHandle:SGTestFeatureHandlePoint
                                   zoom:nil
                               callback:[SGCallback callbackWithSuccessBlock:
                                         ^(NSDictionary *response) {
                                             SGFeature *feature = [SGFeature featureWithGeoJSON:response];
                                             NSLog(@"SGFeature: %@", feature);
                                             GHAssertEqualObjects(response, [feature asGeoJSON],
                                                                  @"Feature's GeoJSON should match response geoJSON");
                                             [self successBlock](response);
                                         } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetPolygonFeatureWithZoomAndConvert
{
    [self prepare];
    [[self client] getFeatureWithHandle:SGTestFeatureHandlePolygon
                                   zoom:[NSNumber numberWithInt:5]
                               callback:[SGCallback callbackWithSuccessBlock:
                                         ^(NSDictionary *response) {
                                             SGFeature *feature = [SGFeature featureWithGeoJSON:response];
                                             NSLog(@"SGFeature: %@", feature);
                                             GHAssertEqualObjects(response, [feature asGeoJSON],
                                                                  @"Feature's GeoJSON should match response geoJSON");
                                             [self successBlock](response);
                                         } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetMultiPolygonFeatureAndConvert
{
    [self prepare];
    [[self client] getFeatureWithHandle:SGTestFeatureHandleMultiPolygon
                                   zoom:nil
                               callback:[SGCallback callbackWithSuccessBlock:
                                         ^(NSDictionary *response) {
                                             SGFeature *feature = [SGFeature featureWithGeoJSON:response];
                                             NSLog(@"SGFeature: %@", feature);
                                             GHAssertEqualObjects(response, [feature asGeoJSON],
                                                                  @"Feature's GeoJSON should match response geoJSON");
                                             [self successBlock](response);
                                         } failureBlock:[self failureBlock]]];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

- (void)testGetCategories
{
    [self prepare];
    [[self client] getCategoriesWithCallback:SGTestCallback];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:SGTestTimeout];
}

@end

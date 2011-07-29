//
//  SimpleGeoTest.m
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
#import "NSArray+SGCollection.h"

@interface SimpleGeoTest ()
- (void)removeAPISpecificKeys:(NSMutableDictionary *)geoObject;
@end

@implementation SimpleGeoTest

@synthesize addedPlaceIDs, recordHistoryCursor;

- (id)init
{
    self = [super init];
    if (self) {
        addedPlaceIDs = [[NSMutableArray array] retain];
    }
    return self;
}

- (BOOL)shouldRunOnMainThread
{
    return NO;
}

#pragma mark Test Objects

- (SimpleGeo *)client
{
    return [SimpleGeo clientWithConsumerKey:SGTestKey
                             consumerSecret:SGTestSecret];
}

- (SGPoint *)point
{
    return [SGPoint pointWithLat:SGTestLatitude
                             lon:SGTestLongitude];
}

- (SGPoint *)outlierPoint
{
    return [SGPoint pointWithLat:SGTestLatitude+SGTestRadius/50.0f
                             lon:SGTestLongitude];
}

- (SGEnvelope *)envelope
{
    return [SGEnvelope envelopeWithNorth:SGTestEnvelopeNorth
                                    west:SGTestEnvelopeWest
                                   south:SGTestEnvelopeSouth
                                    east:SGTestEnvelopeEast];
}

#pragma mark Basic Callbacks

- (SGCallback *)blockCallbacks
{
    return [SGCallback callbackWithSuccessBlock:[self successBlock]
                                   failureBlock:[self failureBlock]];
}

- (SGCallback *)delegateCallbacks
{
    return [SGCallback callbackWithDelegate:self
                              successMethod:@selector(requestDidSucceed:)
                              failureMethod:@selector(requestDidFail:)];
}

#pragma mark Basic Handler Blocks

- (SGSuccessBlock)successBlock
{
    return [[^(NSDictionary *response) {
        GHTestLog(@"%@", response);
        [self notify:kGHUnitWaitStatusSuccess];
    } copy] autorelease];
}

- (SGFailureBlock)failureBlock
{
    return [[^(NSError *error) {
        GHTestLog(@"%@", error.description);
        [self notify:kGHUnitWaitStatusFailure];
    } copy] autorelease];
}

#pragma mark Basic Handler Delegate Methods

- (void)requestDidSucceed:(NSDictionary *)response
{
    GHTestLog(@"%@", response);
    [self notify:kGHUnitWaitStatusSuccess];
}

- (void)requestDidFail:(NSError *)error
{
    GHTestLog(@"%@", error.description);
    [self notify:kGHUnitWaitStatusFailure];
}

#pragma mark Basic Check Methods

- (void)checkSGFeatureConversion:(NSDictionary *)response
                          object:(SGGeoObject *)object
{
    NSMutableDictionary *alteredResponse = [[NSMutableDictionary dictionaryWithDictionary:response] retain];;
    [self removeAPISpecificKeys:alteredResponse];
    GHAssertEqualObjects(alteredResponse, [object asGeoJSON],
                         @"Feature's GeoJSON should match response geoJSON");
    [alteredResponse release];
}

- (void)checkSGCollectionConversion:(NSDictionary *)response
                               type:(SGCollectionType)type
{
    NSArray *features = [NSArray arrayWithSGCollection:response type:type];
    GeoJSONCollectionType collectionType = GeoJSONCollectionTypeFeatures;
    if (type == SGCollectionTypePoints) collectionType = GeoJSONCollectionTypeGeometries;
    
    NSMutableDictionary *alteredResponse = [NSMutableDictionary dictionaryWithDictionary:response];
    NSArray *objects = [alteredResponse objectForKey:@"features"];
    for (NSMutableDictionary *object in objects) {
        [self removeAPISpecificKeys:object];
    }
    
    NSMutableDictionary *cleanResponse = [NSMutableDictionary dictionary];
    NSDictionary *featureCollection = [features asGeoJSONCollection:collectionType];
    [cleanResponse setValue:[alteredResponse objectForKey:@"type"] forKey:@"type"];
    [cleanResponse setValue:[alteredResponse objectForKey:@"features"] forKey:@"features"];
    [cleanResponse setValue:[alteredResponse objectForKey:@"geometries"] forKey:@"geometries"];
    GHAssertEqualObjects(cleanResponse, featureCollection, @"Feature's GeoJSON should match response geoJSON");
}

- (void)removeAPISpecificKeys:(NSMutableDictionary *)object
{
    [object removeObjectForKey:@"distance"];
    [object removeObjectForKey:@"selfLink"];
    [object removeObjectForKey:@"layerLink"];
    
    NSMutableDictionary *propsDict = [NSMutableDictionary dictionaryWithDictionary:[object objectForKey:@"properties"]];
    [propsDict removeObjectForKey:@"distance"];
    [propsDict removeObjectForKey:@"href"];
    [object setObject:propsDict forKey:@"properties"];
}

@end

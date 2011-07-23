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

@implementation SimpleGeoTest

@synthesize addedPlaceIDs, recordHistoryCursor;

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

- (SGCallback *)blockCallback
{
    return [SGCallback callbackWithBlock:[self mainBlock]];
}

- (SGCallback *)blockCallbacks
{
    return [SGCallback callbackWithSuccessBlock:[self successBlock]
                                   failureBlock:[self failureBlock]];
}

- (SGCallback *)delegateCallback
{
    return [SGCallback callbackWithDelegate:self
                                     method:@selector(requestDidFinish:failed:)];
}

- (SGCallback *)delegateCallbacks
{
    return [SGCallback callbackWithDelegate:self
                              successMethod:@selector(requestDidSucceed:)
                              failureMethod:@selector(requestDidFail:)];
}

#pragma mark Basic Handler Blocks

- (SGResponseBlock)mainBlock
{    
    return [[^(NSDictionary *response, NSError *error) {
        if (error) [self failureBlock](error);
        else [self successBlock](response);
    } copy] autorelease];
}

- (SGSuccessBlock)successBlock
{
    return [[^(NSDictionary *response) {
        SGLog(@"%@", response);
        [self notify:kGHUnitWaitStatusSuccess];
    } copy] autorelease];
}

- (SGFailureBlock)failureBlock
{
    return [[^(NSError *error) {
        SGLog(@"%@", error.description);
        [self notify:kGHUnitWaitStatusFailure];
    } copy] autorelease];
}

#pragma mark Basic Handler Delegate Methods

- (void)requestDidFinish:(NSDictionary *)response
                  failed:(NSError *)error
{
    if (error) [self requestDidFail:error];
    else [self requestDidSucceed:response];
}

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

- (void)checkSGCollectionConversion:(NSDictionary *)response
                               type:(SGCollectionType)type
{
    NSArray *features = [NSArray arrayWithSGCollection:response type:type];
    NSDictionary *featureCollection = [features asSGCollection:type];
    NSMutableDictionary *cleanResponse = [NSMutableDictionary dictionary];
    [cleanResponse setValue:[response objectForKey:@"type"] forKey:@"type"];
    [cleanResponse setValue:[response objectForKey:@"features"] forKey:@"features"];
    [cleanResponse setValue:[response objectForKey:@"geometries"] forKey:@"geometries"];
    GHAssertEqualObjects(cleanResponse, featureCollection, @"Feature's GeoJSON should match response geoJSON");
}

@end

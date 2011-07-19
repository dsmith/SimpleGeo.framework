//
//  SimpleGeo+Places.m
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

#import "SimpleGeo+Places.h"
#import "SimpleGeo+Internal.h"
#import "SGPlacesQuery.h"
#import "SGFeature.h"

@interface SimpleGeo (Private)
- (NSDictionary *)markFeature:(SGFeature *)feature asPrivate:(BOOL)isPrivate;
@end

@implementation SimpleGeo (Places)

#pragma mark Places Request Methods

- (void)getPlacesForQuery:(SGPlacesQuery *)query
                 callback:(SGCallback *)callback
{  
    NSDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:query.address forKey:@"address"];
    [parameters setValue:query.searchString forKey:@"q"];
    [parameters setValue:query.categories forKey:@"category"];
    [parameters setValue:[NSString stringWithFormat:@"%f", query.radius] forKey:@"radius"];
    [parameters setValue:[NSString stringWithFormat:@"%d", query.limit] forKey:@"num"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/places/%@",
                     SG_URL_PREFIX, SG_API_VERSION, [self baseEndpointForQuery:query]];
                  
    [self sendHTTPRequest:@"GET"
                  toURL:url
             withParams:parameters
               callback:callback];
}

#pragma mark Places Manipulation Methods

- (void)addPlace:(SGFeature *)feature
       isPrivate:(BOOL)isPrivate
        callback:(SGCallback *)callback
{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/places",
                     SG_URL_PREFIX, SG_API_VERSION];
    
    NSDictionary *featureDict = [self markFeature:feature asPrivate:isPrivate];
    
    [self sendHTTPRequest:@"POST"
                    toURL:url
               withParams:featureDict
                 callback:callback];
}

- (void)updatePlace:(SGFeature *)place
          isPrivate:(BOOL)isPrivate
           callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/features/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION, place.handle];
    
    NSDictionary *featureDict = [self markFeature:place asPrivate:isPrivate];
    
    [self sendHTTPRequest:@"POST"
                    toURL:url
               withParams:featureDict
                 callback:callback];
}

- (void)deletePlace:(NSString *)handle
           callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/features/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION, handle];
    
    [self sendHTTPRequest:@"DELETE"
                    toURL:url
               withParams:nil
                 callback:callback];
}

#pragma Helper Methods

- (NSDictionary *)markFeature:(SGFeature *)feature
                    asPrivate:(BOOL)isPrivate
{
    NSMutableDictionary *properties = [NSMutableDictionary dictionaryWithDictionary:[feature properties]];
    if (isPrivate) [properties setValue:@"true" forKey:@"private"];
    else [properties setValue:@"false" forKey:@"private"];
    NSMutableDictionary *featureDict = [NSMutableDictionary dictionaryWithDictionary:[feature asGeoJSON]];
    [featureDict setValue:properties forKey:@"properties"];
    return featureDict;
}

@end

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

#import <YAJL/YAJL.h>
#import "SimpleGeo+Places.h"
#import "SimpleGeo+Internal.h"
#import "SGFeatureCollection+Private.h"
#import "SGPlacesQuery.h"

@implementation SimpleGeo (Places)

#pragma mark Place Manipulation Methods

- (void)addPlace:(SGFeature *)feature
         private:(BOOL)private
{
    NSURL *endpointURL = [self endpointForString:[NSString stringWithFormat:@"/%@/places",
                                                  SIMPLEGEO_API_VERSION]];

    ASIHTTPRequest *request = [self requestWithURL:endpointURL];

    NSDictionary *featureDict = [self markFeature:feature
                                          private:private];

    [request appendPostData:[[featureDict yajl_JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                          @"didAddPlace:", @"targetSelector",
                          feature, @"feature",
                          [NSNumber numberWithBool:private], @"private",
                          nil]];
    [request startAsynchronous];
}

- (void)updatePlace:(NSString *)handle
               with:(SGFeature *)feature
            private:(BOOL)private
{
    NSURL *endpointURL = [self endpointForString:[NSString stringWithFormat:@"/%@/features/%@.json",
                                                  SIMPLEGEO_API_VERSION, handle]];
    
    ASIHTTPRequest *request = [self requestWithURL:endpointURL];
    
    NSDictionary *featureDict = [self markFeature:feature
                                          private:private];
    
    [request appendPostData:[[featureDict yajl_JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                          @"didUpdatePlace:", @"targetSelector",
                          handle, @"handle",
                          feature, @"feature",
                          [NSNumber numberWithBool:private], @"private",
                          nil]];
    [request startAsynchronous];
}

- (void)deletePlace:(NSString *)handle
{
    NSURL *endpointURL = [self endpointForString:[NSString stringWithFormat:@"/%@/features/%@.json",
                                                  SIMPLEGEO_API_VERSION, handle]];

    ASIHTTPRequest *request = [self requestWithURL:endpointURL];
    [request setRequestMethod:@"DELETE"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                          @"didDeletePlace:", @"targetSelector",
                          handle, @"handle",
                          nil]];
    [request startAsynchronous];
}

#pragma mark Standard Request Method

- (void)getPlacesForQuery:(SGPlacesQuery *)query
{
    NSMutableArray *queryParams = [NSMutableArray array];
    
    NSMutableString *endpoint;
    if (query.point) {
        endpoint = [NSMutableString stringWithFormat:@"/%@/places/%f,%f.json",
                    SIMPLEGEO_API_VERSION, query.point.latitude, query.point.longitude];
        
    } else {
        endpoint = [NSMutableString stringWithFormat:@"/%@/places/address.json",
                    SIMPLEGEO_API_VERSION];
        [queryParams addObject:[NSString stringWithFormat:@"%@=%@",@"address",
                                [self URLEncodedString:query.address]]];
    }
    
    if (query.searchString && ![query.searchString isEqual:@""]) {
        [queryParams addObject:[NSString stringWithFormat:@"%@=%@", @"q",
                                [self URLEncodedString:query.searchString]]];
    }
    
    if (query.categories && [query.categories count] > 0) {
        for (NSObject* category in query.categories) {
            if ([category isKindOfClass:[NSString class]] && ![category isEqual:@""]) {
                [queryParams addObject:[NSString stringWithFormat:@"%@=%@", @"category",
                                        [self URLEncodedString:(NSString *)category]]];
            }
        }
    }
    
    if (query.radius > 0.0) {
        [queryParams addObject:[NSString stringWithFormat:@"%@=%f", @"radius", query.radius]];
    }
    
	if (query.limit > 0) {
        [queryParams addObject:[NSString stringWithFormat:@"%@=%d", @"num", query.limit]];
	}
    
    if ([queryParams count] > 0) {
        [endpoint appendFormat:@"?%@", [queryParams componentsJoinedByString:@"&"]];
    }
    
    if (!query.target || !query.action) {
        [query setTarget:self];
        [query setAction:@selector(didReceivePlaces:)];
    }
    
    NSURL *endpointURL = [self endpointForString:endpoint];
    ASIHTTPRequest *request = [self requestWithURL:endpointURL];
    [request setUserInfo:[NSDictionary dictionaryWithObject:query forKey:@"query"]];
    [request startAsynchronous];
}

#pragma mark Dispatcher Methods

- (void)didReceivePlaces:(NSDictionary *)request
{    
    if ([delegate respondsToSelector:@selector(didLoadPlaces:forSGQuery:)]) {
        [delegate didLoadPlaces:[SGFeatureCollection featureCollectionWithDictionary:[request objectForKey:@"response"]]
                     forSGQuery:[request objectForKey:@"query"]];
        
    /* TODO: remove (deprecated) */
    } else if ([delegate respondsToSelector:@selector(didLoadPlaces:forQuery:)]) {
        [delegate didLoadPlaces:[SGFeatureCollection featureCollectionWithDictionary:[request objectForKey:@"response"]]
                       forQuery:[[request objectForKey:@"query"] asDictionary]];
        
    } else {
        NSLog(@"Delegate does not implement didLoadPlaces:forSGQuery:");
    }
}

- (void)didAddPlace:(ASIHTTPRequest *)request
{
    if ([delegate respondsToSelector:@selector(didAddPlace:handle:URL:token:)]) {
        NSDictionary *jsonResponse = [[request responseData] yajl_JSON];
        NSURL *placeURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@",
                                                SIMPLEGEO_HOSTNAME,
                                                [jsonResponse objectForKey:@"uri"]]];
        
        [delegate didAddPlace:[[request userInfo] objectForKey:@"feature"]
                       handle:[jsonResponse objectForKey:@"id"]
                          URL:placeURL
                        token:[jsonResponse objectForKey:@"token"]];
    } else {
        NSLog(@"Delegate does not implement didAddPlace:handle:URL:token:");
    }
}

- (void)didUpdatePlace:(ASIHTTPRequest *)request
{
    if ([delegate respondsToSelector:@selector(didUpdatePlace:handle:token:)]) {
        NSDictionary *jsonResponse = [[request responseData] yajl_JSON];
        
        [delegate didUpdatePlace:[[request userInfo] objectForKey:@"feature"]
                          handle:[[request userInfo] objectForKey:@"handle"]
                           token:[jsonResponse objectForKey:@"token"]];
    } else {
        NSLog(@"Delegate does not implement didUpdatePlace:handle:token:");
    }
}

- (void)didDeletePlace:(ASIHTTPRequest *)request
{
    if ([delegate respondsToSelector:@selector(didDeletePlace:token:)]) {
        NSDictionary *jsonResponse = [[request responseData] yajl_JSON];
        
        [delegate didDeletePlace:[[request userInfo] objectForKey:@"handle"]
                           token:[jsonResponse objectForKey:@"token"]];
    } else {
        NSLog(@"Delegate does not implement didDeletePlace:token:");
    }
}

#pragma mark Deprecated Convenience Methods

- (void)getPlacesNear:(SGPoint *)point
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point 
                count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address 
                       count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
               within:(double)radius
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setRadius:radius];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                      within:(double)radius
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setRadius:radius];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
               within:(double)radius
                count:(int)limit;
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setRadius:radius];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                      within:(double)radius
                       count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setRadius:radius];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
                count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                       count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
               within:(double)radius
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setRadius:radius];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                      within:(double)radius
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setRadius:radius];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
               within:(double)radius
                count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setRadius:radius];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                      within:(double)radius
                       count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setRadius:radius];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
           inCategory:(NSString *)category
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                  inCategory:(NSString *)category
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
           inCategory:(NSString *)category
                count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                  inCategory:(NSString *)category
                       count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
           inCategory:(NSString *)category
               within:(double)radius
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [placesQuery setRadius:radius];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                  inCategory:(NSString *)category
                      within:(double)radius
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [placesQuery setRadius:radius];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNear:(SGPoint *)point
             matching:(NSString *)query
           inCategory:(NSString *)category
               within:(double)radius
                count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithPoint:point];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [placesQuery setRadius:radius];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

- (void)getPlacesNearAddress:(NSString *)address
                    matching:(NSString *)query
                  inCategory:(NSString *)category
                      within:(double)radius
                       count:(int)limit
{
    SGPlacesQuery *placesQuery = [SGPlacesQuery queryWithAddress:address];
    [placesQuery setSearchString:query];
    [placesQuery setCategories:[NSArray arrayWithObject:category]];
    [placesQuery setRadius:radius];
    [placesQuery setLimit:limit];
    [self getPlacesForQuery:placesQuery];
}

@end

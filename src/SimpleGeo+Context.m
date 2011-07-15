//
//  SimpleGeo+Context.m
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
#import "SimpleGeo+Context.h"
#import "SimpleGeo+Internal.h"
#import "SGContextQuery.h"

@implementation SimpleGeo (Context)

#pragma mark Request Methods

- (void)getContextForQuery:(SGContextQuery *)query
{
    if (!query.target || !query.action) {
        [query setTarget:self];
        [query setAction:@selector(didReceiveContext:)];
    }
    
    NSMutableString *endpoint = [NSMutableString stringWithFormat:@"/%@/context/", SIMPLEGEO_API_VERSION];
    if (query.point) [endpoint appendFormat:@"%f,%f.json", query.point.latitude, query.point.longitude];
    else if (query.envelope) [endpoint appendFormat:@"%f,%f,%f,%f.json", query.envelope.north, query.envelope.west, query.envelope.south, query.envelope.east];
    else [endpoint appendFormat:@"address.json"];
    
    NSDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:query.address forKey:@"address"];
    [parameters setValue:query.filters forKey:@"filter"];
    [parameters setValue:query.featureCategories forKey:@"features__category"];
    [parameters setValue:query.featureSubcategories forKey:@"features__subcategory"];
    [parameters setValue:query.acsTableIDs forKey:@"demographics.acs__table"];
    NSString *paramPairs = [self normalizeRequestParameters:parameters];
    
    if (paramPairs) [endpoint appendFormat:@"?%@", paramPairs];
    NSURL *endpointURL = [self endpointForString:endpoint];
    
    ASIHTTPRequest *request = [self requestWithURL:endpointURL];
    [request setUserInfo:[NSDictionary dictionaryWithObject:query forKey:@"query"]];
    [request startAsynchronous];
}

#pragma mark Dispatcher Methods

- (void)didReceiveContext:(NSDictionary *)request
{
    if ([delegate respondsToSelector:@selector(didLoadContext:forSGQuery:)]) {
        [delegate didLoadContext:[request objectForKey:@"response"]
                      forSGQuery:[request objectForKey:@"query"]];
    
    /* TODO: remove (deprecated) */
    } else if ([delegate respondsToSelector:@selector(didLoadContext:forQuery:)]) {
        [delegate didLoadContext:[request objectForKey:@"response"]
                        forQuery:[[request objectForKey:@"query"] asDictionary]];
        
    } else {
        NSLog(@"Delegate does not implement didLoadContext:forSGQuery:");
    }
}

#pragma mark Deprecated Request Methods

- (void)getContextForPoint:(SGPoint *)point
{
    [self getContextForQuery:[SGContextQuery queryWithPoint:point]];
}

- (void)getContextForAddress:(NSString *)address
{
    [self getContextForQuery:[SGContextQuery queryWithAddress:address]];
}

@end

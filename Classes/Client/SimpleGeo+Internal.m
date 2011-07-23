//
//  SimpleGeo+Internal.m
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

#import "ASIHTTPRequest+OAuth.h"
#import "SimpleGeo+Internal.h"
#import <YAJL/YAJL.h>

@implementation SimpleGeo (Internal)

#pragma mark Master Request Method

- (void)sendHTTPRequest:(NSString *)type
                  toURL:(NSString *)url
             withParams:(NSDictionary *)params 
               callback:(SGCallback *)callback
{
    ASIHTTPRequest* request = nil;
    if([type isEqualToString:@"POST"] || [type isEqualToString:@"PUT"]) {
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        [request appendPostData:[[params yajl_JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        NSString *queryParameters = @"";
        if(params && [params count])
            queryParameters = [NSString stringWithFormat:@"?%@",
                               [self normalizeRequestParameters:params]];
        url = [url stringByAppendingString:queryParameters];
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    }
    
    request.requestMethod = type;
    if(consumerKey && consumerSecret) {
        [request signRequestWithClientIdentifier:consumerKey
                                          secret:consumerSecret
                                 tokenIdentifier:nil
                                          secret:nil
                                     usingMethod:ASIOAuthHMAC_SHA1SignatureMethod];
    }
    
    NSLog(@"Sending %@ to %@", type, url);
    
    request.userInfo = [NSDictionary dictionaryWithObject:callback forKey:@"callback"];    
    [request setDelegate:self];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request addRequestHeader:@"User-Agent" value:userAgent];
    [request startAsynchronous];
}

#pragma mark ASIHTTPRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{    
    if(200 <= [request responseStatusCode] && [request responseStatusCode] < 300)
        [self handleSuccess:request];
    else
        [self handleFailure:request];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self handleFailure:request];
}

#pragma mark Dispatcher Methods

- (void)handleSuccess:(ASIHTTPRequest *)request
{
    NSLog(@"Request succeeded");
    
    NSDictionary* userInfo = [request userInfo];
    if(userInfo) {
        SGCallback *callback = [userInfo objectForKey:@"callback"];
        NSDictionary *response = [self jsonObjectForResponseData:[request responseData]];
        if(callback && callback.delegate && [callback.delegate respondsToSelector:callback.successMethod])
            [callback.delegate performSelector:callback.successMethod 
                                    withObject:response];    
        #if NS_BLOCKS_AVAILABLE
        if(callback.successBlock)
            callback.successBlock(response);
        #endif
    }
}

- (void)handleFailure:(ASIHTTPRequest *)request
{
    NSLog(@"Request failed");
    
    NSDictionary* userInfo = [request userInfo];
    if(userInfo) {
        SGCallback *callback = [userInfo objectForKey:@"callback"];
        if(callback) {
            NSDictionary *userInfo = (NSDictionary*)[self jsonObjectForResponseData:[request responseData]];
            if(!userInfo || ![userInfo isKindOfClass:[NSDictionary class]])
                userInfo = [NSDictionary dictionary];
            
            NSError* error = [NSError errorWithDomain:[request.url description]
                                                 code:[request responseStatusCode]
                                             userInfo:userInfo];
            if(callback && callback.delegate && [callback.delegate respondsToSelector:callback.failureMethod])
                [callback.delegate performSelector:callback.failureMethod withObject:error];  
            NSLog(@"request failed - %@", [error localizedDescription]);
            
            #if NS_BLOCKS_AVAILABLE
            if(callback.failureBlock)
                callback.failureBlock(error);
            #endif
        }
    }
}

#pragma Helper Methods for Requests

- (NSString *)baseEndpointForQuery:(SGQuery *)query
{
    if (query.point) return [NSString stringWithFormat:@"%f,%f.json",
                             query.point.latitude,
                             query.point.longitude];
    else if (query.envelope) return [NSString stringWithFormat:@"%f,%f,%f,%f.json",
                                     query.envelope.north,
                                     query.envelope.west,
                                     query.envelope.south,
                                     query.envelope.east];
    else return [NSString stringWithFormat:@"address.json"];
}

- (NSURL *)encodeURLString:(NSString *)string
{
    NSString *result = (NSString *) [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                              (CFStringRef)string,
                                                                                              NULL,
                                                                                              CFSTR("!*'();:@&=+$,/?#[]"),
                                                                                              kCFStringEncodingUTF8)) autorelease];
    return [NSURL URLWithString:result];
}

- (NSString *)normalizeRequestParameters:(NSDictionary *)parameters
{
    NSLog(@"%@",parameters);
    NSMutableArray *paramPairs = [NSMutableArray array];
    NSArray *paramNames = [parameters allKeys];
    for (NSString *paramName in paramNames) {
        NSObject *paramObject = [parameters objectForKey:paramName];
        NSArray *paramValues;
        if (paramObject && ([paramObject isKindOfClass:[NSString class]] || [paramObject isKindOfClass:[NSNumber class]])) {
            paramValues = [NSArray arrayWithObject:paramObject];
        } else if (paramObject && [paramObject isKindOfClass:[NSArray class]]) {
            paramValues = (NSArray *)paramObject;
        }
        for (NSObject *paramValue in paramValues) {
            [paramPairs addObject:[NSString stringWithFormat:@"%@=%@", paramName, paramValue]];
        }
    }
    if ([paramPairs count] > 0) return [paramPairs componentsJoinedByString:@"&"];
    return nil;
}

- (NSDictionary *)jsonObjectForResponseData:(NSData *)data
{
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSDictionary *jsonObject = nil;
    if(jsonString)
        jsonObject = [jsonString yajl_JSON];
    [jsonString release];
    return jsonObject;
}

@end

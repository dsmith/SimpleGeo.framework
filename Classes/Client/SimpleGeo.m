//
//  SimpleGeo.m
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

#import "SimpleGeo.h"
#import "SimpleGeo+Internal.h"

NSString * const SG_API_VERSION = @"1.0";
NSString * const SG_URL_PREFIX = @"https://api.simplegeo.com";

@implementation SimpleGeo

@synthesize consumerKey, consumerSecret;

#pragma mark -
#pragma mark Instantiation

+ (SimpleGeo *)clientWithConsumerKey:(NSString *)key
                      consumerSecret:(NSString *)secret
{
    return [[[SimpleGeo alloc] initWithConsumerKey:key
                                    consumerSecret:secret] autorelease];
}

- (id)initWithConsumerKey:(NSString *)key
           consumerSecret:(NSString *)secret
{
    self = [super init];
    if (self) {
        consumerKey = [key retain];
        consumerSecret = [secret retain];
        NSDictionary *infoDictionary = [[NSBundle bundleForClass:[self class]] infoDictionary];
        NSString *deviceName, *OSName;
        #if TARGET_OS_IPHONE
        deviceName = [[UIDevice currentDevice] model];
        OSName = [[UIDevice currentDevice] systemVersion];
        #else
        deviceName = @"Macintosh";
        OSName = @"Mac OS X";
        #endif
        userAgent = [[NSString stringWithFormat:@"%@ %@; SimpleGeo/Obj-C %@; %@ %@",
                      deviceName, OSName, @"2.0", [infoDictionary objectForKey:@"CFBundleName"],
                      [infoDictionary objectForKey:@"CFBundleVersion"]] retain];
    }
    return self;
}

- (void)setRequestTimeout:(NSTimeInterval)requestTimeout
{
    [ASIHTTPRequest setDefaultTimeOutSeconds:requestTimeout];
}

- (NSTimeInterval)requestTimeout
{
    return [ASIHTTPRequest defaultTimeOutSeconds];
}

#pragma mark -
#pragma mark Request

- (void)sendHTTPRequest:(NSString *)type
                  toURL:(NSString *)url
             withParams:(NSDictionary *)params 
               callback:(SGCallback *)callback
{
    ASIHTTPRequest* request = nil;
    if([type isEqualToString:@"POST"] || [type isEqualToString:@"PUT"]) {
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        [request appendPostData:[params JSONData]];
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
    
    SGLog(@"Sending %@ to %@", type, url);
    
    request.userInfo = [NSDictionary dictionaryWithObject:callback forKey:@"callback"];    
    [request setDelegate:self];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request addRequestHeader:@"User-Agent" value:userAgent];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{    
    if(200 <= [request responseStatusCode] && [request responseStatusCode] < 300)
        [self handleResponse:request failed:NO];
    else
        [self handleResponse:request failed:YES];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self handleResponse:request failed:YES];
}

#pragma mark -
#pragma mark Dispatcher

- (void)handleResponse:(ASIHTTPRequest *)response
                failed:(BOOL)failed
{
    NSDictionary* userInfo = [response userInfo];
    if(userInfo) {
        SGCallback *callback = [userInfo objectForKey:@"callback"];
        NSDictionary *responseData = [[response responseData] objectFromJSONData];
        NSError *error = nil;
        if (failed) {            
            error = [NSError errorWithDomain:[response.url description]
                                        code:[response responseStatusCode]
                                    userInfo:nil];
            SGLog(@"request failed - %@", [error localizedDescription]);
            if(callback && callback.delegate && [callback.delegate respondsToSelector:callback.failureMethod]) {
                [callback.delegate performSelector:callback.failureMethod withObject:error];
            }
            #if NS_BLOCKS_AVAILABLE
            if(callback.failureBlock) {
                callback.failureBlock(error);
            }
            #endif
        } else {
            SGLog(@"Request succeeded");
            if(callback && callback.delegate && [callback.delegate respondsToSelector:callback.successMethod]) {
                [callback.delegate performSelector:callback.successMethod withObject:responseData];
            }
            #if NS_BLOCKS_AVAILABLE
            if(callback.successBlock) {
                callback.successBlock(responseData);
            }
            #endif
        }
    }
}

#pragma mark -
#pragma mark Helpers

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

- (NSURL *)encodeURLString:(NSString *)urlString
{
    NSString *result = (NSString *) [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                               (CFStringRef)urlString,
                                                                                               NULL,
                                                                                               CFSTR("!*'();:@&=+$,/?#[]"),
                                                                                               kCFStringEncodingUTF8)) autorelease];
    return [NSURL URLWithString:result];
}

- (NSString *)normalizeRequestParameters:(NSDictionary *)parameters
{
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

#pragma mark -
#pragma mark Memory

- (void)dealloc
{
    [consumerKey release];
    [consumerSecret release];
    [userAgent release];
    [super dealloc];
}

@end

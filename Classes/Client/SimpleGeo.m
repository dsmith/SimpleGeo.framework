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

#import <YAJL/YAJL.h>
#import "SimpleGeo.h"
#import "SimpleGeo+Internal.h"

NSString * const SG_API_VERSION = @"1.0";
NSString * const SG_URL_PREFIX = @"http://production-api-8fba84e3.ck.simplegeo.com";

@implementation SimpleGeo

@synthesize consumerKey, consumerSecret;

#pragma mark Instantiation Methods

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
        NSString *deviceName;
        NSString *OSName;
        #if TARGET_OS_IPHONE
        deviceName = [[UIDevice currentDevice] model];
        OSName = [[device systemName] systemVersion];
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

- (void)dealloc
{
    [consumerKey release];
    [consumerSecret release];
    [userAgent release];
    [super dealloc];
}

@end

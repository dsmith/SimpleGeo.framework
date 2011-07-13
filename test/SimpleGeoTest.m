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
#import "SGPolygon.h"

NSString * const TEST_URL_PREFIX = @"http://localhost:4567/";

@implementation SimpleGeoTest

- (BOOL)shouldRunOnMainThread
{
    return NO;
}

#pragma mark Utility Methods

- (SimpleGeo *)client
{
    return [SimpleGeo clientWithDelegate:self
                             consumerKey:@""
                          consumerSecret:@""];
}

- (SGPoint *)point
{
    return [SGPoint pointWithLatitude:37.772487 longitude:-122.40572];
}

- (NSString *)address
{
    return @"42 Decatur Street, San Francisco, CA 94103";
}

- (SGEnvelope *)envelope
{
    return [SGEnvelope envelopeWithNorth:37.75 south:37.50 west:-122.25 east:-122.50];
}

#pragma mark Client Tests

- (void)testCreateClientWithDefaultURL
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", SIMPLEGEO_HOSTNAME]];
    GHTestLog(@"SimpleGeo URL: %@", url);
    SimpleGeo *client = [SimpleGeo clientWithDelegate:self
                                          consumerKey:@"" 
                                       consumerSecret:@"" 
                                               useSSL:NO];

    GHAssertEqualObjects([client url], url, @"URLs don't match.");
}

- (void)testCreateClientWithURL
{
    NSURL *url = [NSURL URLWithString:TEST_URL_PREFIX];
    GHTestLog(@"SimpleGeo URL: %@", url);
    SimpleGeo *client = [SimpleGeo clientWithDelegate:self
                                              consumerKey:@""
                                           consumerSecret:@""
                                                      URL:url];

    GHAssertEqualObjects([client url], url, @"URLs don't match.");
}

- (void)testCreateClientUsingSSL
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@", SIMPLEGEO_HOSTNAME]];

    SimpleGeo *client = [SimpleGeo clientWithDelegate:self
                                          consumerKey:@"" 
                                       consumerSecret:@"" 
                                               useSSL:YES];

    GHAssertTrue([client isSSLEnabled], @"SSL should be enabled");
    GHAssertEqualObjects([client url], url, @"URLs don't match.");
}

#pragma mark SimpleGeoDelegate Methods

- (void)requestDidFinish:(ASIHTTPRequest *)request
{
    GHTestLog(@"Request did finish");
}

- (void)requestDidFail:(ASIHTTPRequest *)request
{
    GHTestLog(@"Request did fail");
}

@end

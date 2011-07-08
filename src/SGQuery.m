//
//  SGQuery.m
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

#import "SGQuery.h"
#import "SGPoint.h"
#import "SGEnvelope.h"

@implementation SGQuery

@synthesize query;

#pragma mark Instantiation Methods

+ (id)queryWithPoint:(SGPoint *)point
{
    return [[[self alloc] initWithPoint:point] autorelease];
}

+ (id)queryWithAddress:(NSString *)address
{
    return [[[self alloc] initWithAddress:address] autorelease];
}

- (id)init
{
    return [self initWithPoint:[SGPoint pointWithLatitude:0
                                                longitude:0]];
}

- (id)initWithPoint:(SGPoint *)point
{
    self = [super init];
    if (self) {
        query = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[point retain],
                 @"point",
                 nil];
    }
    return self;
}

- (id)initWithAddress:(NSString *)address
{
    self = [super init];
    if (self) {
        query = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[address retain],
                 @"address",
                 nil];
    }
    return self;
}

- (void)dealloc {
    [query release];
    [super dealloc];
}

#pragma mark Key Methods

- (SGPoint *)point
{
    return [self.query objectForKey:@"point"];
}

- (NSString *)address
{
    return [self.query objectForKey:@"address"];
}

- (NSDictionary *)userInfo
{
    return [self.query objectForKey:@"userInfo"];
}

- (void)setUserInfo:(NSDictionary*)userInfo
{
    [self.query setObject:[userInfo retain] forKey:@"userInfo"];
}

#pragma mark Conversion Methods

- (NSDictionary *)asDictionary
{
    return [NSDictionary dictionaryWithDictionary:query];
}

@end

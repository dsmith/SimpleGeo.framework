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

@synthesize point, address, userInfo, target, action;

#pragma mark Instantiation Methods

+ (id)queryWithPoint:(SGPoint *)point
{
    return [[[self alloc] initWithPoint:point] autorelease];
}

+ (id)queryWithAddress:(NSString *)address
{
    return [[[self alloc] initWithAddress:address] autorelease];
}

+ (id)queryWithDictionary:(NSDictionary *)dictionary
{
    return [[[self alloc] initWithDictionary:dictionary] autorelease];
}

- (id)init
{
    return [self initWithPoint:[SGPoint pointWithLatitude:0
                                                longitude:0]];
}

- (id)initWithPoint:(SGPoint *)aPoint
{
    self = [super init];
    if (self) {
        point = [aPoint retain];
    }
    return self;
}

- (id)initWithAddress:(NSString *)anAddress
{
    self = [super init];
    if (self) {
        address = [anAddress retain];
    }
    return self;
}

- (void)dealloc {
    [point release];
    [address release];
    [userInfo release];
    [target release];
    [super dealloc];
}

#pragma mark Conversion Methods

- (NSDictionary *)asDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if (point) [dictionary setObject:point forKey:@"point"];
    if (address) [dictionary setObject:address forKey:@"address"];
    if (userInfo) [dictionary setObject:userInfo forKey:@"userInfo"];
    if (target) [dictionary setObject:target forKey:@"target"];
    if (action) [dictionary setObject:NSStringFromSelector(action) forKey:@"action"];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end

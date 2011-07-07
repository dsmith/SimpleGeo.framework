//
//  SGQuery.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery.h"
#import "SGPoint.h"

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

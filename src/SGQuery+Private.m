//
//  SGQuery+Private.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery+Private.h"

@implementation SGQuery (Private)

+ (id)queryWithDictionary:(NSDictionary *)dictionary
{
    return [[[self alloc] initWithDictionary:dictionary] autorelease];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        query = [dictionary retain];
    }
    return self;
}

- (void)setQuery:(NSDictionary *)newQuery
{
    [self.query release];
    self.query = [NSMutableDictionary dictionaryWithDictionary:newQuery];
}

- (NSObject *)target
{
    return [self.query objectForKey:@"target"];
}

- (void)setTarget:(NSObject *)target
{
    [self.query setObject:target forKey:@"target"];
}

- (SEL)action
{
    return NSSelectorFromString([self.query objectForKey:@"action"]);
}

- (void)setAction:(SEL)action
{
    [self.query setObject:NSStringFromSelector(action) forKey:@"action"];
}

@end
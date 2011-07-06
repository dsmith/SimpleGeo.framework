//
//  SGStorageQuery.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGStorageQuery.h"

@implementation SGStorageQuery

+ (id)queryWithPoint:(SGPoint *)point
             inLayer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithPoint:point
                                          inLayer:layer] autorelease];
}
    
+ (id)queryWithAddress:(NSString *)address
               inLayer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithAddress:address
                                            inLayer:layer] autorelease];
}

- (id)initWithPoint:(SGPoint *)point
            inLayer:(NSString *)layer
{
    SGStorageQuery *query = [super initWithPoint:point];
    [query setLayer:layer];
    return query;
}

- (id)initWithAddress:(NSString *)address
              inLayer:(NSString *)layer
{
    SGStorageQuery *query = [super initWithAddress:address];
    [query setLayer:layer];
    return query;
}

- (NSString *)layer
{
    return [self.query objectForKey:@"layer"];
}

- (void)setLayer:(NSString *)layer
{
    [self.query setObject:layer forKey:@"layer"];
}

- (NSString *)cursor
{
    return [self.query objectForKey:@"cursor"];
}

- (void)setCursor:(NSString *)cursor
{
    [self.query setObject:cursor forKey:@"cursor"];
}

@end

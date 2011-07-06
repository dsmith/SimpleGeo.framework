//
//  SGQuery+Nearby.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGNearbyQuery.h"

@implementation SGNearbyQuery

- (float)radius
{
    return [[self.query objectForKey:@"radius"] floatValue];
}

- (void)setRadius:(float)radius
{
    [self.query setObject:[NSNumber numberWithFloat:radius] forKey:@"radius"];
}

- (int)limit
{
    return [[self.query objectForKey:@"limit"] intValue];
}

- (void)setLimit:(int)limit
{
    [self.query setObject:[NSNumber numberWithInt:limit] forKey:@"limit"];
}

@end

//
//  SGContextQuery.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGContextQuery.h"

@implementation SGContextQuery

- (NSString *)featureCategory
{
    return [self.query objectForKey:@"featureCategory"];
}

- (void)setFeatureCategory:(NSString *)featureCategory
{
    [self.query setObject:[featureCategory retain] forKey:@"featureCategory"];
}

- (NSString *)filter
{
    return [self.query objectForKey:@"filter"];
}

- (void)setFilter:(NSString *)filter
{
    [self.query setObject:[filter retain] forKey:@"filter"];
}

@end

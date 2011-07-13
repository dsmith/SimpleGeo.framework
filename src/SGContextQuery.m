//
//  SGContextQuery.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGContextQuery.h"

@implementation SGContextQuery

@synthesize featureCategory, filter;

- (NSDictionary *)asDictionary
{
    NSMutableDictionary *dictionary = (NSMutableDictionary *)[super asDictionary];
    if (featureCategory) [dictionary setObject:featureCategory forKey:@"featureCategory"];
    if (filter) [dictionary setObject:filter forKey:@"filter"];
    return dictionary;
}

- (void)dealloc
{
    [featureCategory release];
    [filter release];
    [super dealloc];
}

@end

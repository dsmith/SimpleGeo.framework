//
//  SGContextQuery.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGContextQuery.h"

@implementation SGContextQuery

@synthesize featureCategories, featureSubcategories, filters, acsTableIDs;

- (NSDictionary *)asDictionary
{
    NSMutableDictionary *dictionary = (NSMutableDictionary *)[super asDictionary];
    [dictionary setValue:featureCategories forKey:@"featureCategories"];
    [dictionary setValue:featureSubcategories forKey:@"featureSubcategories"];
    [dictionary setValue:filters forKey:@"filters"];
    [dictionary setValue:acsTableIDs forKey:@"acsTableIDs"];
    return dictionary;
}

- (void)dealloc
{
    [featureCategories release];
    [featureSubcategories release];
    [filters release];
    [acsTableIDs release];
    [super dealloc];
}

@end
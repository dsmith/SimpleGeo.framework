//
//  NSDictionary+Classifier.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/21/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "NSDictionary+Classifier.h"

@implementation NSDictionary (Classifier)

+ (NSDictionary *)classifierWithType:(NSString *)type
                            category:(NSString *)category
                         subcategory:(NSString *)subcategory
{
    return [[[NSDictionary alloc] initWithObjectsAndKeys:
             type, @"type",
             category, @"category",
             subcategory, @"subcategory",
             nil] autorelease];
}

- (NSString *)SGClassifierType {
    return [self objectForKey:@"type"];
}

- (NSString *)SGClassifierCategory {
    return [self objectForKey:@"category"];
}

- (NSString *)SGClassifierSubcategory {
    return [self objectForKey:@"subcategory"];
}

@end

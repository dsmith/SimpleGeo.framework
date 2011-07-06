//
//  SGPlacesQuery.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGPlacesQuery.h"

@implementation SGPlacesQuery

- (NSString *)searchQuery
{
    return [self.query objectForKey:@"searchQuery"];
}

- (void)setSearchQuery:(NSString *)searchQuery
{
    [self.query setObject:[searchQuery retain] forKey:@"searchQuery"];
}

- (NSArray *)categories
{
    return [self.query objectForKey:@"categories"];
}

- (void)setCategories:(NSArray *)categories
{
    NSMutableArray *catArray = [NSMutableArray array];
    for (NSObject *object in categories) {
        if ([object isKindOfClass:[NSString class]]) {
            [catArray addObject:object];
        }
    }
    [self.query setObject:catArray forKey:@"categories"];
}

- (void)addCategory:(NSString *)category
{
    if ([self.query objectForKey:@"categories"]) {
        [[self.query objectForKey:@"categories"] addObject:[category retain]];
    } else {
        [self.query setObject:[NSMutableArray arrayWithObject:[category retain]] forKey:@"categories"];
    }
}

@end

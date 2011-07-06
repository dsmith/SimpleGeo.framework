//
//  SGPlacesQuery.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGNearbyQuery.h"

@interface SGPlacesQuery : SGNearbyQuery

- (NSString *)searchQuery;
- (void)setSearchQuery:(NSString *)searchQuery;

- (NSArray *)categories;
- (void)setCategories:(NSArray *)categories;
- (void)addCategory:(NSString *)category;

@end

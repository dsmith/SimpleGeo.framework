//
//  SGContextQuery.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery.h"

/*!
 * Context query object.
 */
@interface SGContextQuery : SGQuery
{
    NSMutableArray *featureCategories;
    NSMutableArray *featureSubcategories;
    NSMutableArray *filters;
    NSMutableArray *acsTableIDs;
}

//! Feature categories for this query
@property (nonatomic, retain) NSMutableArray *featureCategories;

//! Feature subcategories for this query
@property (nonatomic, retain) NSMutableArray *featureSubcategories;

//! Filters for this query
@property (nonatomic, retain) NSMutableArray *filters;

//! List of ACS table IDs to include
@property (nonatomic, retain) NSMutableArray *acsTableIDs;

@end

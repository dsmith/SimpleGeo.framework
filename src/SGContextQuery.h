//
//  SGContextQuery.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery+Envelope.h"

/*!
 * Context query object.
 */
@interface SGContextQuery : SGQuery

/*!
 * Return the associated feature category for this query
 */
- (NSString *)featureCategory;

/*!
 * Set a feature category for this query
 * @param category Feature category
 */
- (void)setFeatureCategory:(NSString *)featureCategory;

/*!
 * Return the associated filter for this query
 */
- (NSString *)filter;

/*!
 * Set a filter for this query
 * @param filter Filter
 */
- (void)setFilter:(NSString *)filter;

@end

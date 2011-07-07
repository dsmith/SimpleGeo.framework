//
//  SGQuery+Private.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery.h"

@interface SGQuery (Private)

/*!
 * Create a query from a dictionary
 * @param dictionary dictionary
 */
+ (id)queryWithDictionary:(NSDictionary *)dictionary;

/*!
 * Construct a query from a dictionary
 * @param dictionary dictionary
 */
- (id)initWithDictionary:(NSDictionary *)dictionary;

/*!
 * Set the query dictionary
 * @param newQuery new query dictionary
 */
- (void)setQuery:(NSDictionary *)newQuery;

/*!
 * Return the associated target for this query's response
 */
- (NSObject *)target;

/*!
 * Set the query's response target
 * @param action action
 */
- (void)setTarget:(NSObject*)target;

/*!
 * Return the associated action for this query's response
 */
- (SEL)action;

/*!
 * Set the query's response action
 * @param action action
 */
- (void)setAction:(SEL)action;

@end
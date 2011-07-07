//
//  SGQuery.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

@class SGPoint;

@interface SGQuery : NSObject
{
  @private
    NSMutableDictionary *query;
}

//! Query dictionary
@property (nonatomic, readonly) NSMutableDictionary *query;

/*!
 * Create a point-based query
 * @param point point
 */
+ (id)queryWithPoint:(SGPoint *)point;

/*!
 * Create an address-based query
 * @param address address
 */
+ (id)queryWithAddress:(NSString *)address;

/*!
 * Construct a point-based query
 * @param point point
 */
- (id)initWithPoint:(SGPoint *)point;

/*!
 * Construct an address-based query
 * @param address address
 */
- (id)initWithAddress:(NSString *)address;

/*!
 * Return the associated point for this query
 */
- (SGPoint *)point;

/*!
 * Return the associated address for this query
 */
- (NSString *)address;

/*!
 * Return the associated user info for this query
 */
- (NSDictionary *)userInfo;

/*!
 * Set associated user info for this query
 * @param userInfo user info
 */
- (void)setUserInfo:(NSDictionary*)userInfo;

/*!
 * Return an NSDictionary representation of this query
 */
- (NSDictionary *)asDictionary;

@end

//
//  SGQuery+Envelope.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import <SimpleGeo/SimpleGeo.h>

/*!
 * Query category allowing envelop search.
 */
@interface SGQuery (SGQuery_Envelope)

/*!
 * Create an overlap query with a bounding box
 * @param bounds bounding box
 */
+ (id)queryWithEnvelope:(SGEnvelope *)envelope;

/*!
 * Construct an overlap query with a bounding box
 * @param bounds bounding box
 */
- (id)initWithEnvelope:(SGEnvelope *)envelope;

/*!
 * Return the associated envelope for this query
 */
- (SGEnvelope *)envelope;

@end

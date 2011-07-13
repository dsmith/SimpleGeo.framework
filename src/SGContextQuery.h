//
//  SGContextQuery.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGEnvelopeQuery.h"

/*!
 * Context query object.
 */
@interface SGContextQuery : SGEnvelopeQuery
{
    NSString *featureCategory;
    NSString *filter;
}

//! Feature category for this query
@property (nonatomic, retain) NSString *featureCategory;

//! Filter for this query
@property (nonatomic, retain) NSString *filter;

@end

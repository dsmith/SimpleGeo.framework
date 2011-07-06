//
//  SGQuery+Nearby.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery.h"

@interface SGNearbyQuery : SGQuery

- (float)radius;
- (void)setRadius:(float)radius;

- (int)limit;
- (void)setLimit:(int)limit;

@end

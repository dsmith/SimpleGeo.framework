//
//  SGStorageQuery.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGNearbyQuery.h"

@interface SGStorageQuery : SGNearbyQuery

+ (id)queryWithPoint:(SGPoint *)point
             inLayer:(NSString *)layer;
+ (id)queryWithAddress:(NSString *)address
               inLayer:(NSString *)layer;

- (id)initWithPoint:(SGPoint *)point
             inLayer:(NSString *)layer;
- (id)initWithAddress:(NSString *)address
               inLayer:(NSString *)layer;

- (id)initWithPoint:(SGPoint *)point inLayer:(NSString *)layer;
- (id)initWithAddress:(NSString *)address inLayer:(NSString *)layer;

- (NSString *)layer;
- (void)setLayer:(NSString *)layer;

- (NSString *)cursor;
- (void)setCursor:(NSString *)cursor;

@end

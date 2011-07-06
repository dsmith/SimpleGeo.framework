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

@property (nonatomic, readonly) NSMutableDictionary *query;

+ (id)queryWithPoint:(SGPoint *)point;
+ (id)queryWithAddress:(NSString *)address;

- (id)initWithPoint:(SGPoint *)point;
- (id)initWithAddress:(NSString *)address;

- (SGPoint *)point;
- (NSString *)address;
- (NSDictionary *)asDictionary;

- (NSObject *)target;
- (void)setTarget:(NSObject*)target;

- (SEL)action;
- (void)setAction:(SEL)action;

- (NSDictionary *)userInfo;
- (void)setUserInfo:(NSDictionary*)userInfo;

@end

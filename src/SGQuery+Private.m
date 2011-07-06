//
//  SGQuery+Private.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 6/27/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery+Private.h"

@implementation SGQuery (Private)

- (void)setQuery:(NSDictionary *)newQuery
{
    [self.query release];
    self.query = [NSMutableDictionary dictionaryWithDictionary:newQuery];
}

@end

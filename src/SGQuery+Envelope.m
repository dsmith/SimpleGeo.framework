//
//  SGQuery+Envelope.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/7/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import "SGQuery+Envelope.h"

@implementation SGQuery (SGQuery_Envelope)

+ (id)queryWithEnvelope:(SGEnvelope *)envelope
{
    return [[[self alloc] initWithEnvelope:envelope] autorelease];
}

- (id)initWithEnvelope:(SGEnvelope *)envelope
{
    self = [super init];
    if (self) {
        query = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[envelope retain],
                 @"envelope",
                 nil];
    }
    return self;
}

- (SGEnvelope *)envelope
{
    return [self.query objectForKey:@"envelope"];
}

@end

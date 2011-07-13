//
//  SGStorageQuery.m
//  SimpleGeo.framework
//
//  Copyright (c) 2010, SimpleGeo Inc.
//  All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "SGStorageQuery.h"

@implementation SGStorageQuery

@synthesize layer, cursor;

+ (id)queryWithPoint:(SGPoint *)point
             inLayer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithPoint:point
                                          inLayer:layer] autorelease];
}
    
+ (id)queryWithAddress:(NSString *)address
               inLayer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithAddress:address
                                            inLayer:layer] autorelease];
}

- (id)initWithPoint:(SGPoint *)aPoint
            inLayer:(NSString *)aLayer
{
    SGStorageQuery *query = [super initWithPoint:point];
    [query setLayer:layer];
    return query;
}

- (id)initWithAddress:(NSString *)anAddress
              inLayer:(NSString *)aLayer
{
    SGStorageQuery *query = [super initWithAddress:address];
    [query setLayer:layer];
    return query;
}

- (NSDictionary *)asDictionary
{
    NSMutableDictionary *dictionary = (NSMutableDictionary *)[super asDictionary];
    if (layer) [dictionary setObject:layer forKey:@"layer"];
    if (cursor) [dictionary setObject:cursor forKey:@"cursor"];
    return dictionary;
}

- (void)dealloc
{
    [layer release];
    [cursor release];
    [super dealloc];
}

@end

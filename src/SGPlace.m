//
//  SGStoredRecord.m
//  SimpleGeo.framework
//
//  Copyright (c) 2011, SimpleGeo Inc.
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

#import "SGPlace.h"

@implementation SGPlace

@synthesize name, isPrivate;

#pragma mark Instantiation Methods

+ (SGPlace *)placeWithName:(NSString *)name
                     point:(SGPoint *)point
{
    return [[[SGPlace alloc] initWithName:name
                                    point:point] autorelease];
}

+ (SGPlace *)placeWithFeature:(SGFeature *)feature
                         name:(NSString *)name
{
    return [[[SGPlace alloc] initWithFeature:feature
                                        name:name] autorelease];
}

+ (SGPlace *)placeWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    return [[[SGPlace alloc] initWithGeoJSON:geoJSONFeature] autorelease];
}

- (id)initWithName:(NSString *)aName
             point:(SGPoint *)point
{
    self = [super initWithGeometry:point];
    if (self) {
        name = [aName retain];
    }
    return self;
}

- (id)initWithFeature:(SGFeature *)feature
                 name:(NSString *)aName
{
    if ([feature.geometry isKindOfClass:[SGPoint class]]) {
        self = [super initWithGeoJSON:[feature asGeoJSON]];
        if (self) {
            name = [aName retain];
        }
        return self;
    }
    return nil;
}

- (id)initWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    self = [super initWithGeoJSON:geoJSONFeature];
    if (self) {
        // name
        name = [[properties objectForKey:@"name"] retain];
        [properties removeObjectForKey:@"name"];
        // visibility
        NSString *visibility = [properties objectForKey:@"private"];
        if ([visibility isEqual:@"true"]) isPrivate = YES;
        [properties removeObjectForKey:@"private"];
    }
    return self;
}

#pragma mark Convenience Methods

- (NSDictionary *)asGeoJSON
{
    NSMutableDictionary *dictionary = (NSMutableDictionary *)[super asGeoJSON];
    NSLog(@"%@",dictionary);
    [[dictionary objectForKey:@"properties"] setValue:name forKey:@"name"];
    if (isPrivate) [[dictionary objectForKey:@"properties"] setValue:@"true" forKey:@"private"];
    NSLog(@"%@",dictionary);
    return dictionary;
}

#pragma mark Memory

- (void)dealloc
{
    [name release];
    [super dealloc];
}

@end

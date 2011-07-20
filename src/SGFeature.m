//
//  SGFeature.m
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

#import "SGFeature.h"
#import "SGGeometry.h"

@implementation SGFeature

@synthesize identifier, geometry, properties, created, distance, selfLink;

#pragma mark Instantiation Methods

+ (SGFeature *)featureWithGeometry:(SGGeometry *)geometry
{
    return [[[SGFeature alloc] initWithGeometry:geometry] autorelease];
}

+ (SGFeature *)featureWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    return [[[SGFeature alloc] initWithGeoJSON:geoJSONFeature] autorelease];
}

- (id)initWithGeometry:(SGGeometry *)aGeometry
{
    self = [super init];
    if (self) {
        geometry = [aGeometry retain];
    }
    return self;
}

- (id)initWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    self = [self initWithGeometry:[SGGeometry geometryWithGeoJSON:[geoJSONFeature objectForKey:@"geometry"]]];
    if (self) {
        // id
        identifier = [[geoJSONFeature objectForKey:@"id"] retain];
        // properties
        [self setProperties:[geoJSONFeature objectForKey:@"properties"]];
        // date
        NSNumber *epoch = [geoJSONFeature objectForKey:@"created"];
        if (epoch) created = [[NSDate alloc] initWithTimeIntervalSince1970:[epoch intValue]];
        // link
        NSDictionary *selfLinkDict = [geoJSONFeature objectForKey:@"selfLink"];
        if (selfLinkDict) selfLink = [[selfLinkDict objectForKey:@"href"] retain];
        // distance
        distance = [[geoJSONFeature objectForKey:@"distance"] retain];
    }
    return self;
}

#pragma mark Convenience Methods

- (void)setProperties:(NSDictionary *)someProperties
{
    [properties release];
    properties = [[NSMutableDictionary dictionaryWithDictionary:someProperties] retain];
}

- (NSDictionary *)asGeoJSON
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"Feature" forKey:@"type"];
    [dictionary setValue:identifier forKey:@"id"];
    [dictionary setValue:[geometry asGeoJSON] forKey:@"geometry"];
    if (created) [dictionary setValue:[NSNumber numberWithDouble:[created timeIntervalSince1970]] forKey:@"created"];
    if (selfLink) [dictionary setValue:[NSDictionary dictionaryWithObject:selfLink forKey:@"href"] forKey:@"selfLink"]; // TODO remove?
    [dictionary setValue:distance forKey:@"distance"]; // TODO remove?
    [dictionary setValue:[NSMutableDictionary dictionaryWithDictionary:properties] forKey:@"properties"];
    return dictionary;
}

- (NSString *)description
{
    return [[self asGeoJSON] description];
}

#pragma mark Comparison Methods

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [identifier isEqual:[object identifier]] && [geometry isEqual:[object geometry]];
}

- (NSUInteger)hash
{
    return [identifier hash] + [geometry hash];
}

#pragma mark Memory

- (void)dealloc
{
    [identifier release];
    [geometry release];
    [properties release];
    [created release];
    [distance release];
    [selfLink release];
    [super dealloc];
}

@end

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

@synthesize handle, geometry, properties, created, distance, selfLink;

#pragma mark Instantiation Methods

+ (SGFeature *)featureWithHandle:(NSString *)handle
                        geometry:(SGGeometry *)geometry
{
    return [SGFeature featureWithHandle:handle
                               geometry:geometry
                             properties:nil];
}

+ (SGFeature *)featureWithHandle:(NSString *)handle
                        geometry:(SGGeometry *)geometry
                      properties:(NSDictionary *)properties
{
    return [[[SGFeature alloc] initWithHandle:handle
                                     geometry:geometry
                                   properties:properties] autorelease];
}

+ (SGFeature *)featureWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    return [[[SGFeature alloc] initWithGeoJSON:geoJSONFeature] autorelease];
}

- (id)initWithHandle:(NSString *)aHandle
            geometry:(SGGeometry *)aGeometry
{
    return [self initWithHandle:aHandle
                       geometry:aGeometry
                     properties:nil];
}

- (id)initWithHandle:(NSString *)aHandle
            geometry:(SGGeometry *)aGeometry
          properties:(NSDictionary *)someProperties
{
    self = [super init];
    if (self) {
        handle = [aHandle retain];
        geometry = [aGeometry retain];
        [self setProperties:someProperties];
    }
    return self;
}

- (id)initWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    self = [self initWithHandle:[geoJSONFeature objectForKey:@"id"]
                       geometry:[SGGeometry geometryWithGeoJSON:[geoJSONFeature objectForKey:@"geometry"]]
                     properties:[geoJSONFeature objectForKey:@"properties"]];
    if (self) {
        // date
        NSNumber *epoch = [geoJSONFeature objectForKey:@"created"];
        if (epoch) created = [[NSDate alloc] initWithTimeIntervalSince1970:[epoch intValue]];
        // distance, links
        distance = [[geoJSONFeature objectForKey:@"distance"] retain];
        NSDictionary *selfLinkDict = [geoJSONFeature objectForKey:@"selfLink"];
        if (selfLinkDict) selfLink = [[selfLinkDict objectForKey:@"href"] retain];
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
    [dictionary setValue:handle forKey:@"id"];
    [dictionary setValue:[geometry asGeoJSON] forKey:@"geometry"];
    [dictionary setValue:distance forKey:@"distance"];
    if (created) [dictionary setValue:[NSNumber numberWithDouble:[created timeIntervalSince1970]] forKey:@"created"];
    if (selfLink) [dictionary setValue:[NSDictionary dictionaryWithObject:selfLink forKey:@"href"] forKey:@"selfLink"];
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
    return [handle isEqual:[object handle]] &&
    [created isEqual:[object created]];
}

- (NSUInteger)hash
{
    return [handle hash] + [created hash];
}

- (void)dealloc
{
    [handle release];
    [geometry release];
    [properties release];
    [created release];
    [distance release];
    [selfLink release];
    [super dealloc];
}

@end

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
#import "SGFeature+Private.h"
#import "SGGeometry+Private.h"

@implementation SGFeature

@synthesize featureId, geometry, properties, distance, selfLink;

+ (SGFeature *)featureWithId:(NSString *)identifier
{
    return [SGFeature featureWithId:identifier
                         dictionary:nil];
}

+ (SGFeature *)featureWithId:(NSString *)identifier
                  dictionary:(NSDictionary *)data
{
    return [[[SGFeature alloc] initWithId:identifier
                               dictionary:data] autorelease];
}

+ (SGFeature *)featureWithDictionary:(NSDictionary *)data
{
    return [SGFeature featureWithId:nil
                         dictionary:data];
}

+ (SGFeature *)featureWithId:(NSString *)identifier
                  properties:(NSDictionary *)properties
{
    return [SGFeature featureWithId:identifier
                           geometry:nil
                         properties:properties];
}

+ (SGFeature *)featureWithId:(NSString *)identifier
                    geometry:(SGGeometry *)geometry
{
    return [SGFeature featureWithId:identifier
                           geometry:geometry
                         properties:nil];
}

+ (SGFeature *)featureWithGeometry:(SGGeometry *)geometry
                        properties:(NSDictionary *)properties
{
    return [SGFeature featureWithId:nil
                           geometry:geometry
                         properties:properties];
}

+ (SGFeature *)featureWithId:(NSString *)identifier
                    geometry:(SGGeometry *)geometry
                  properties:(NSDictionary *)properties
{
    return [[[SGFeature alloc] initWithId:identifier
                                 geometry:geometry
                               properties:properties] autorelease];
}

- (id)initWithId:(NSString *)identifier
{
    return [self initWithId:identifier
                   geometry:nil];
}

- (id)initWithId:(NSString *)identifier
      properties:(NSDictionary *)someProperties
{
    return [self initWithId:identifier
                   geometry:nil
                 properties:someProperties];
}

- (id)initWithId:(NSString *)identifier
        geometry:(SGGeometry *)aGeometry
{
    return [self initWithId:identifier
                   geometry:aGeometry
                 properties:nil];
}

- (id)initWithGeometry:(SGGeometry *)aGeometry
            properties:(NSDictionary *)someProperties
{
    return [self initWithId:nil
                   geometry:aGeometry
                 properties:someProperties];
}

- (id)initWithId:(NSString *)identifier
        geometry:(SGGeometry *)aGeometry
      properties:(NSDictionary *)someProperties
{
    self = [super init];

    if (self) {
        featureId = [identifier retain];
        geometry = [aGeometry retain];
        properties = [someProperties retain];
    }

    return self;
}

- (id)initWithId:(NSString *)identifier
      dictionary:(NSDictionary *)data
{
    self = [super init];

    if (self) {
        featureId = [identifier retain];

        if (data) {
            if (! [[data objectForKey:@"type"] isEqual:@"Feature"]) {
                NSLog(@"Unsupported geometry type: %@", [data objectForKey:@"type"]);
                return nil;
            }

            [self setValuesForKeysWithDictionary:data];
        }
    }

    return self;
}

- (void)dealloc
{
    [featureId release];
    [geometry release];
    [properties release];
    [super dealloc];
}

- (NSDictionary *)asDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:4];

    [dict setObject:@"Feature" forKey:@"type"];
    [dict setValue:featureId forKey:@"id"];
    [dict setValue:geometry forKey:@"geometry"];
    [dict setValue:properties forKey:@"properties"];
    [dict setValue:distance forKey:@"distance"];
    [dict setValue:selfLink forKey:@"selfLink"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSString *)description
{
    return [[self asDictionary] description];
}

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [self isEqualToFeature:(SGFeature *)object];
}

- (BOOL)isEqualToFeature:(SGFeature *)feature
{
    return [featureId isEqualToString:[feature featureId]];
}

- (NSUInteger)hash
{
    return [featureId hash];
}

- (id)JSON
{
    return [self asDictionary];
}

- (SGGeometry *)geometry
{
    return geometry;
}

- (void)setGeometry:(id)input
{
    [geometry release];
    geometry = [[SGGeometry geometryWithGeometry:input] retain];
}

/**
 * Alternate setter for KeyValueCoding
 */
- (void)setId:(NSString *)identifier
{
    [self setFeatureId:identifier];
}

/**
 * Setter for KeyValueCoding
 */
- (void)setType:(NSString *)type
{
    // noop; we know this is a feature
}

// prevent exceptions from being thrown when JSON responses contain unexpected keys
- (void)setValue:(id)value
 forUndefinedKey:(NSString *)key
{
    NSLog(@"%@ received a value for an unknown property: %@: %@", [self class], key, value);
}

@end

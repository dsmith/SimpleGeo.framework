//
//  NSArray+GeoJSON.m
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

#import "NSArray+GeoJSON.h"
#import "SGGeometry.h"
#import "SGFeature.h"
#import "SGStoredRecord.h"

@implementation NSArray (GeoJSON)

#pragma mark GeoJSON -> SGGeometry

+ (NSArray *)arrayWithGeoJSONCollection:(NSDictionary *)collection
{
    return [[[NSArray alloc] initWithGeoJSONCollection:collection] autorelease];
}

- (id)initWithGeoJSONCollection:(NSDictionary *)featureCollection
{
    NSString *type = [featureCollection objectForKey:@"type"];
    BOOL isGeometryCollection = [type isEqual:GeoJSONCollectionTypeGeometry];
    NSArray *objects;
    if (isGeometryCollection)
        objects = [NSArray arrayWithArray:[featureCollection objectForKey:@"geometries"]];
    else
        objects = [NSArray arrayWithArray:[featureCollection objectForKey:@"features"]];
    
    NSMutableArray *output = [NSMutableArray arrayWithCapacity:[objects count]];
    for (NSDictionary *object in objects) {
        if (isGeometryCollection)
            [output addObject:[SGGeometry geometryWithGeoJSON:object]];
        else {
            NSDictionary *properties = [object objectForKey:@"properties"];
            if (properties && [properties objectForKey:@"layer"])
                [output addObject:[SGStoredRecord recordWithGeoJSON:object]];
            else
                [output addObject:[SGFeature featureWithGeoJSON:object]];
        }
    }
    return [self initWithArray:output];
}

#pragma mark SGGeometry -> GeoJSON

- (NSDictionary *)asGeoJSONCollection:(GeoJSONCollectionType)collectionType
{
    NSMutableArray *geoJSONObjects = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger i, BOOL *stop) {
        [geoJSONObjects addObject:[object asGeoJSON]];
    }];
    NSString *label;
    if (collectionType == GeoJSONCollectionTypeFeature) label = @"features";
    else label = @"geometries";
    return [NSDictionary dictionaryWithObjectsAndKeys:
            collectionType, @"type",
            geoJSONObjects, label,
            nil];
}

@end

//
//  NSArray+SGCollection.m
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

#import "NSArray+SGCollection.h"
#import "SGGeometry.h"
#import "SGFeature.h"
#import "SGPlace.h"
#import "SGStoredRecord.h"

@implementation NSArray (SGCollection)

#pragma mark SGCollection -> SGObjects

+ (NSArray *)arrayWithSGCollection:(NSDictionary *)collection
                              type:(SGCollectionType)collectionType
{
    return [[[NSArray alloc] initWithSGCollection:collection
                                            type:collectionType] autorelease];
}

- (id)initWithSGCollection:(NSDictionary *)collection
                      type:(SGCollectionType)collectionType
{
    NSArray *objects;
    if (collectionType == SGCollectionTypePoints) objects = [collection objectForKey:@"geometries"];
    else objects = [collection objectForKey:@"features"];
    
    NSMutableArray *output = [NSMutableArray arrayWithCapacity:[objects count]];
    for (NSDictionary *object in objects) {
        switch (collectionType) {
            case SGCollectionTypePoints:
                [output addObject:[SGGeometry geometryWithGeoJSON:object]];
                break;
            case SGCollectionTypeFeatures:
                [output addObject:[SGFeature featureWithGeoJSON:object]];
                break;
            case SGCollectionTypePlaces:
                [output addObject:[SGPlace placeWithGeoJSON:object]];
                break;
            case SGCollectionTypeRecords:
                [output addObject:[SGStoredRecord recordWithGeoJSON:object]];
                break;
            default:
                break;
        }
    }
    return [self initWithArray:output];
}

#pragma mark SGObjects -> SGCollection

- (NSDictionary *)asSGCollection:(SGCollectionType)collectionType
{
    NSMutableArray *geoJSONObjects = [NSMutableArray arrayWithCapacity:[self count]];
    for (id object in self)
        if ([object respondsToSelector:@selector(asGeoJSON)])
            [geoJSONObjects addObject:[object asGeoJSON]];
    NSString *collectionLabel;
    NSString *listLabel;
    if (collectionType == SGCollectionTypePoints) {
        listLabel = @"geometries";
        collectionLabel = @"GeometryCollection";
    } else {
        listLabel = @"features";
        collectionLabel = @"FeatureCollection";
    }
    return [NSDictionary dictionaryWithObjectsAndKeys:
            collectionLabel, @"type",
            geoJSONObjects, listLabel,
            nil];
}

@end

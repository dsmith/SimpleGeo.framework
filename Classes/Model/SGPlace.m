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
#import "SGPoint.h"
#import "NSDictionary+Classifier.h"

@implementation SGPlace

@synthesize name, tags, isPrivate;

#pragma mark Instantiation Methods

+ (SGPlace *)placeWithName:(NSString *)name
                     point:(SGPoint *)point
{
    return [[[SGPlace alloc] initWithName:name
                                    point:point] autorelease];
}

+ (SGPlace *)placeWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    return [[[SGPlace alloc] initWithGeoJSON:geoJSONFeature] autorelease];
}

- (id)initWithName:(NSString *)aName
             point:(SGPoint *)point
{
    if (self) {
        geometry = [point retain];
        name = [aName retain];
    }
    return self;
}

- (id)initWithGeoJSON:(NSDictionary *)geoJSONFeature
{
    self = [super initWithGeoJSON:geoJSONFeature];
    if (self) {
        // distance
        distance = [[properties objectForKey:@"distance"] retain];
        [properties removeObjectForKey:@"distance"];
        
        // tags
        tags = [[NSMutableArray alloc] init];
        [tags addObjectsFromArray:[properties objectForKey:@"tags"]];
        [properties removeObjectForKey:@"tags"];
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
    
    [[dictionary objectForKey:@"properties"] setValue:distance forKey:@"distance"]; // distance
    
    [[dictionary objectForKey:@"properties"] setValue:tags forKey:@"tags"]; // tags
    if (isPrivate) [[dictionary objectForKey:@"properties"] setValue:@"true" forKey:@"private"]; // visibility
    return dictionary;
}

#pragma mark Memory

- (void)dealloc
{
    [tags release];
    [super dealloc];
}

@end
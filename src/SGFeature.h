//
//  SGFeature.h
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

#import "SGGeometry.h"

/*!
 * Feature
 */
@interface SGFeature : NSObject
{
    NSString *handle;
    SGGeometry *geometry;
    NSMutableDictionary *properties;
    NSDate *created;
    
    NSNumber *distance;
    NSDictionary *selfLink;
}

//! Feature handle (ID)
@property (nonatomic, retain) NSString *handle;

//! Feature geometry
@property (nonatomic, retain) SGGeometry *geometry;

//! Feature properties
@property (nonatomic, retain) NSDictionary *properties;

//! Created timestamp
@property (nonatomic, retain) NSDate *created;

//! Distance (in meters) from the query point.
// Only present if the feature was generated from a nearby request
@property (nonatomic, readonly) NSNumber *distance;

//! API URL for the feature.
// Only present if the feature was generated from an API query
@property (nonatomic, readonly) NSDictionary *selfLink;

#pragma mark Instantiation Methods

/*!
 * Create an SGFeature with a handle and a geometry
 * @param handle    Feature handle
 * @param geometry  Feature geometry
 */
+ (SGFeature *)featureWithHandle:(NSString *)handle
                        geometry:(SGGeometry *)geometry;

/*!
 * Create an SGFeature with a handle, a geometry, and some properties
 * @param handle        Feature id
 * @param geometry      Feature geometry
 * @param properties    Feature properties
 */
+ (SGFeature *)featureWithHandle:(NSString *)handle
                        geometry:(SGGeometry *)geometry
                      properties:(NSDictionary *)properties;

/*!
 * Create an SGFeature from a dictionary that
 * abides by the GeoJSON Feature specification
 * @param feature   Feature dictionary
 */
+ (SGFeature *)featureWithGeoJSON:(NSDictionary *)geoJSONFeature;

/*!
 * Construct an SGFeature with a handle and a geometry
 * @param handle    Feature handle
 * @param geometry  Feature geometry
 */
- (id)initWithHandle:(NSString *)handle
            geometry:(SGGeometry *)geometry;

/*!
 * Construct an SGFeature with a handle, a geometry, and some properties
 * @param handle        Feature id
 * @param geometry      Feature geometry
 * @param properties    Feature properties
 */
- (id)initWithHandle:(NSString *)handle
            geometry:(SGGeometry *)geometry
          properties:(NSDictionary *)properties;

/*!
 * Construct an SGFeature from a dictionary that
 * abides by the GeoJSON Feature specification
 * @param feature   Feature dictionary
 */
- (id)initWithGeoJSON:(NSDictionary *)geoJSONFeature;

#pragma mark Convenience Methods

/*!
 * Set the properties field
 * @param properties    Feature properties
 */
- (void)setProperties:(NSDictionary *)properties;

/*!
 * A dictionary representation of the feature that
 * conforms to the geoJSON Feature specification
 */
- (NSDictionary *)asGeoJSON;

@end

//
//  SGGeometry.h
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

@class SGPoint;
@class SGEnvelope;

/*!
 * Abstract Geometry representation
 */
@interface SGGeometry : NSObject

#pragma mark -
#pragma mark GeoJSON -> SGGeometry

/*!
 * Create an appropriate SGGeometry object from
 * a valid GeoJSON Geometry dictionary
 * @param geoJSONGeometry   GeoJSON Geometry dictionary
 */
+ (SGGeometry *)geometryWithGeoJSON:(NSDictionary *)geoJSONGeometry;

/*!
 * Construct an appropriate SGGeometry object from
 * a valid GeoJSON Geometry dictionary
 * @param geoJSONGeometry   GeoJSON Geometry dictionary
 */
- (id)initWithGeoJSON:(NSDictionary *)geoJSONGeometry;

#pragma mark -
#pragma mark SGGeometry -> GeoJSON

/*!
 * SGGeometry object as a GeoJSON Geometry dictionary
 */
- (NSDictionary *)asGeoJSON;

@end

#pragma mark -
#pragma mark Region Geometry Protocol

/*!
 * (Multi)Polygon geometry protocol
 */
@protocol SGRegionGeometry <NSObject>

- (SGEnvelope *)envelope;

/*!
 * Determine if a given point lies within the bounds of the polygon
 * @param point Point to check
 */
- (BOOL)containsPoint:(SGPoint *)point;

@end
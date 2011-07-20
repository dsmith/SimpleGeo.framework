//
//  SGPlace.h
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

#import "SGFeature.h"
#import "SGPoint.h"

/*!
 * SimpleGeo Place representation
 */
@interface SGPlace : SGFeature
{
    // required
    NSString *name;
    BOOL isPrivate;
}

//! Place name
@property (nonatomic, retain) NSString *name;

//! Place visibility
@property (nonatomic, assign) BOOL isPrivate;

#pragma mark Instantiation Methods

/*!
 * Create an SGPlace with a name, and location
 * @param name          Place name
 * @param point         Place location
 */
+ (SGPlace *)placeWithName:(NSString *)name
                     point:(SGPoint *)point;

/*!
 * Create an SGPlace with a point-feature and name
 * @param feature       Point feature
 * @param name          Place name
 */
+ (SGPlace *)placeWithFeature:(SGFeature *)feature
                         name:(NSString *)name;

/*!
 * Construct an SGPlace from a dictionary that
 * abides by the GeoJSON Feature specification.
 * Note: geoJSON Feature must contain a "name"
 * key and value in the property dictionary
 * @param feature       Feature dictionary
 */
+ (SGPlace *)placeWithGeoJSON:(NSDictionary *)geoJSONFeature;

/*!
 * Construct an SGPlace with a name and location
 * @param name          Place name
 * @param point         Place location
 */
- (id)initWithName:(NSString *)name
             point:(SGPoint *)point;

/*!
 * Construct an SGPlace with a point-feature and name
 * @param feature       Point feature
 * @param name          Place name
 */
- (id)initWithFeature:(SGFeature *)feature
                 name:(NSString *)name;

@end

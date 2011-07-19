//
//  SGStoredRecord.h
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

/*!
 * Representation of a record as exposed by the SimpleGeo Storage API.
 */
@interface SGStoredRecord : SGFeature
{
    NSString *layer;
    
    NSDictionary *layerLink;
}

//! Layer name
@property (nonatomic, retain) NSString *layer;

//! API URL for the record's layer
// Only present if the feature was generated from an API query.
@property (nonatomic, readonly) NSDictionary *layerLink;

#pragma mark Instantiation Methods

/*!
 * Create an SGStoredRecord from a Feature with an associated layer
 * @param feature Feature
 * @param layer  Associated layer
 */
+ (SGStoredRecord *)recordWithFeature:(SGFeature *)feature
                                layer:(NSString *)layerName;

/*!
 * Create an SGStoredRecord from a Feature with a created timestamp and an associated
 * layer
 * @param feature Feature
 * @param created Created timestamp
 * @param layer   Associated layer
 */
+ (SGStoredRecord *)recordWithFeature:(SGFeature *)feature
                                layer:(NSString *)layerName
                            timestamp:(NSDate *)dateCreated;

/*!
 * Create an SGStoredRecord from a dictionary that
 * abides by the GeoJSON Feature specification.
 * Note: GeoJSON Feature must contain a layer property
 * @param feature   Feature dictionary
 */
+ (SGStoredRecord *)recordWithGeoJSON:(NSDictionary *)geoJSONFeature;

/*!
 * Construct an SGStoredRecord from a Feature with an associated layer
 * @param feature Feature
 * @param layer   Associated layer
 */
- (id)initWithFeature:(SGFeature *)feature
                layer:(NSString *)layerName;

/*!
 * Construct an SGStoredRecord from a Feature with
 * a created timestamp and an associated layer
 * @param feature Feature
 * @param created Created timestamp
 * @param layer   Associated layer
 */
- (id)initWithFeature:(SGFeature *)feature
                layer:(NSString *)layerName
            timestamp:(NSDate *)dateCreated;

/*!
 * Construct an SGStoredRecord from a dictionary that
 * abides by the GeoJSON Feature specification.
 * Note: GeoJSON Feature must contain a layer property
 * @param feature   Feature dictionary
 */
- (id)initWithGeoJSON:(NSDictionary *)geoJSONFeature;

@end

//
//  SGObject.h
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
 * Abstract SimpleGeo Object representation
 */
@interface SGObject : NSObject
{
    // required
    SGGeometry *geometry;
    // optional
    NSString *identifier;
    NSMutableDictionary *properties;
    // from request
    NSDictionary *selfLink;
    NSNumber *distance;
}

//! Object geometry
@property (nonatomic, retain) SGGeometry *geometry;

//! Object ID
@property (nonatomic, retain) NSString *identifier;

//! Object properties
@property (nonatomic, retain) NSDictionary *properties;

//! API URL for the Object.
//! Only present if the Object originated from an API request
@property (nonatomic, readonly) NSDictionary *selfLink;

//! Distance (in meters) from the query point.
//! Valid for SGObjects with point geometry
//! Only present if the Object originated from a nearby request
@property (nonatomic, readonly) NSNumber *distance;

@end

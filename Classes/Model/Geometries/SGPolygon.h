//
//  SGPolygon.h
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

@class SGPoint;

/*!
 * Polygon representation
 */
@interface SGPolygon : SGGeometry
{
    NSArray *rings;
}

//! LinearRings that define this polygon
@property (nonatomic, retain) NSArray *rings;

#pragma mark Instantiation Methods

/*!
 * Create a polygon from a set of LinearRings of SGPoints
 * @param rings LinearRings
 */
+ (SGPolygon *)polygonWithRings:(NSArray *)rings;

/*!
 * Create a polygon from a boundary ring and
 * and array of hole rings of SGPoints
 * @param boundary  Boundary ring
 * @param holes     Hole rings
 */
+ (SGPolygon *)polygonWithBoundary:(NSArray *)boundary
                             holes:(NSArray *)holes;

/*!
 * Construct a polygon from a set of LinearRings
 * @param rings LinearRings
 */
- (id)initWithRings:(NSArray *)rings;

/*!
 * Construct a polygon from a boundary ring and
 * and array of hole rings
 * @param boundary  Boundary ring
 * @param holes     Hole rings
 */
- (id)initWithBoundary:(NSArray *)boundary
                 holes:(NSArray *)holes;

#pragma mark Convenience Methods

/*!
 * Boundary ring
 */
- (NSArray *)boundary;

/*!
 * Array of hole rings
 */
- (NSArray *)holes;

/*!
 * Determine if a given point lies within the bounds of the polygon
 * @param point Point to check
 */
- (BOOL)containsPoint:(SGPoint *)point;

@end
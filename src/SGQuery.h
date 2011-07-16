//
//  SGQuery.h
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
 * Abstract query object
 */
@interface SGQuery : NSObject
{
    SGPoint *point;
    NSString *address;
    SGEnvelope *envelope;
    NSDictionary *userInfo;
    id target;
    SEL action;
}

//! Point for a point-based query
@property (nonatomic, readonly) SGPoint *point;

//! Address for an address-based query
@property (nonatomic, readonly) NSString *address;

//! Envelope for a bounding box query
@property (nonatomic, readonly) SGEnvelope *envelope;

//! Attached user info
@property (nonatomic, retain) NSDictionary *userInfo;

//! Delegate object
@property (nonatomic, retain) id target;

//! Delegate action
@property (nonatomic, assign) SEL action;

/*!
 * Create a point-based query
 * @param point Point
 */
+ (id)queryWithPoint:(SGPoint *)point;

/*!
 * Create an address-based query
 * @param address Address
 */
+ (id)queryWithAddress:(NSString *)address;

/*!
 * Create an overlap query with a bounding box
 * @param bounds Bounding box
 */
+ (id)queryWithEnvelope:(SGEnvelope *)envelope;

/*!
 * Construct a point-based query
 * @param point Point
 */
- (id)initWithPoint:(SGPoint *)point;

/*!
 * Construct an address-based query
 * @param address Address
 */
- (id)initWithAddress:(NSString *)address;

/*!
 * Construct an overlap query with a bounding box
 * @param bounds Bounding box
 */
- (id)initWithEnvelope:(SGEnvelope *)envelope;

/*!
 * Return an NSDictionary representation of this query
 */
- (NSDictionary *)asDictionary;

@end

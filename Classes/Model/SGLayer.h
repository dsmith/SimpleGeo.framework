//
//  SGLayer.h
//  SimpleGeo
//
//  Copyright (c) 2010-2011, SimpleGeo Inc.
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

/*!
 * Layer representation
 */
@interface SGLayer : NSObject
{
    NSString *name;
    NSString *title;
    NSString *description;
    NSMutableArray *callbackURLs;
    // from API request
    BOOL isPublic;
    NSDate *created;
    NSDate *updated;
}

//! Layer name
@property (nonatomic, readonly) NSString *name;

//! Layer title
@property (nonatomic, retain) NSString *title;

//! Layer description
@property (nonatomic, retain) NSString *description;

//! Callback URLs for the layer
@property (nonatomic, retain) NSArray *callbackURLs;

//! Privacy of the layer
@property (nonatomic, readonly) BOOL isPublic;

//! Date the layer was created
@property (nonatomic, readonly) NSDate *created;

//! Date the layer was last updated
@property (nonatomic, readonly) NSDate *updated;

#pragma mark Instantiation Methods

/*!
 * Create an SGLayer
 * @param name          Layer name
 * @param title         Layer title
 * @param description   Layer description
 * @param callbackURLs  Callback URLs for the layer
 */
+ (SGLayer *)layerWithName:(NSString *)name
                     title:(NSString *)title
               description:(NSString *)description
               callackURLs:(NSArray *)callbackURLs;

/*!
 * Construct an SGLayer
 * @param name          Layer name
 * @param title         Layer title
 * @param description   Layer description
 * @param callbackURLs  Callback URLs for the layer
 */
- (id)initWithName:(NSString *)name
             title:(NSString *)title
       description:(NSString *)description
       callackURLs:(NSArray *)callbackURLs;

/*!
 * Create an SGLayer from a dictionary
 * Dictionary should contain "name" and "title" keys
 * @param layerDictionary   Layer dictionary
 */
+ (SGLayer *)layerWithDictionary:(NSDictionary *)layerDictionary;

/*!
 * Construct an SGLayer from a dictionary
 * Dictionary should contain "name" and "title" keys
 * @param layerDictionary   Layer dictionary
 */
- (id)initWithDictionary:(NSDictionary *)layerDictionary;

#pragma mark Convenience Methods

/*!
 * Dictionary representation of the layer
 */
- (NSDictionary *)asDictionary;

@end

//
//  SimpleGeo.h
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

#import "ASIHTTPRequest.h"

#import "SGGeometry.h"
#import "SGPoint.h"
#import "SGEnvelope.h"
#import "SGPolygon.h"
#import "SGMultiPolygon.h"

#import "SGFeature.h"
#import "SGPlace.h"
#import "SGStoredRecord.h"

#if TARGET_OS_IPHONE
    #import "SGGeometry+Mapkit.h"
    #import "SGPoint+Mapkit.h"
    #import "SGPolygon+Mapkit.h"
    #import "SGMultiPolygon+Mapkit.h"    
#endif

#import "SGContextQuery.h"
#import "SGPlacesQuery.h"
#import "SGStorageQuery.h"

#import "SGTypes.h"
#import "SGCategories.h"
#import "SGCallback.h"
#import "NSArray+SGCollection.h"
#import "NSDictionary+Classifier.h"

/*!
 * \mainpage
 *
 * \section intro_sec Introduction
 *
 * You've reached the documentation for SimpleGeo's Objective-C client.
 *
 * For more information, please look at the Class documentation.
 *
 * You can also
 * <a href="https://github.com/simplegeo/SimpleGeo.framework/downloads">download
 * an Xcode docset.</a>
 */

extern NSString * const SG_API_VERSION;
extern NSString * const SG_URL_PREFIX;

/*!
 * SimpleGeo client interface
 */
@interface SimpleGeo : NSObject
{
    NSString *userAgent;
    NSString *consumerKey;
    NSString *consumerSecret;
}

//! Client consumer key
@property (nonatomic, readonly) NSString *consumerKey;

//! Client consumer secret
@property (nonatomic, readonly) NSString *consumerSecret;

#pragma mark Instantiation Methods

/*!
 * Create a client
 * @param consumerKey    OAuth consumer key
 * @param consumerSecret OAuth consumer secret
 */
+ (SimpleGeo *)clientWithConsumerKey:(NSString *)consumerKey
                      consumerSecret:(NSString *)consumerSecret;

/*!
 * Construct a client
 * @param consumerKey    OAuth consumer key
 * @param consumerSecret OAuth consumer secret
 */
- (id)initWithConsumerKey:(NSString *)consumerKey
           consumerSecret:(NSString *)consumerSecret;

@end

#import "SimpleGeo+Context.h"
#import "SimpleGeo+Places.h"
#import "SimpleGeo+Storage.h"

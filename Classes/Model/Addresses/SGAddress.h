//
//  SGAddress.h
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

@class SGPoint;

typedef enum {
    SGAddressFormatUSFull,
    SGAddressFormatUSNormal,
    SGAddressFormatUSShort,
} SGAddressFormat;

/*!
 * Address representation
 */
@interface SGAddress : NSObject
{
    @private
    NSString *street;
    NSString *city;
    NSString *county;
    NSString *province;
    NSString *postalCode;
    NSString *ISOcountryCode;
}

//! Street Address, eg. 41 Decatur St
@property (nonatomic, retain) NSString *street;

//! City, eg. San Francisco
@property (nonatomic, retain) NSString *city;

//! County, eg. Santa Clara
@property (nonatomic, retain) NSString *county;

//! State, eg. CA
@property (nonatomic, retain) NSString *province;

//! Zip code, eg. 94103
@property (nonatomic, retain) NSString *postalCode;

// Country, eg. US
@property (nonatomic, retain) NSString *ISOcountryCode;

#pragma mark -
#pragma mark Instantiation

/*!
 * Create an address from a dictionary
 * containing top-level address keys
 * @param dictionary    Address dictionary
 */
+ (SGAddress *)addressWithDictionary:(NSDictionary *)dictionary;

/*!
 * Construct an address from a dictionary
 * containing top-level address keys
 * @param dictionary    Address dictionary
 */
- (id)initWithDictionary:(NSDictionary *)dictionary;

#pragma mark -
#pragma mark Convenience

/*!
 * Formatted address string
 * @param addressFormat Address format
 * @param includeStreet Include the street address
 */
- (NSString *)formattedAddress:(SGAddressFormat)addressFormat
                    withStreet:(BOOL)includeStreet;

/*!
 * Address dictionary
 */
- (NSDictionary *)asDictionary;

@end

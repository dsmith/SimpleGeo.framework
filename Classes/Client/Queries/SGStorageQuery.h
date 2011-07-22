//
//  SGStorageQuery.h
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

#import "SGNearbyQuery.h"
#import "SGTypes.h"

/*!
 * API query for SimpleGeo Storage.
 * Call getRecordsForQuery: to make a Storage request with an SGStorageQuery object.
 */
@interface SGStorageQuery : SGNearbyQuery
{
    NSString *layer;
    NSString *cursor;
    SGSortOrder sortType;
    
    NSDate *startDate;
    NSDate *endDate;
    
    SGStoredPropertyType propertyType;
    NSString *propertyName;
    NSObject *propertyValue;
    NSObject *propertyStartValue;
    NSObject *propertyEndValue;
}

//! Layer to query
@property (nonatomic, retain) NSString *layer;

//! Cursor for paginating query results
@property (nonatomic, retain) NSString *cursor;

//! Sorting method for query
@property (nonatomic, retain) SGSortOrder sortType;

//! Start date for query
@property (nonatomic, readonly) NSDate *startDate;

//! End date for query
@property (nonatomic, readonly) NSDate *endDate;

//! Property type for property filtering
@property (nonatomic, readonly) SGStoredPropertyType propertyType;

//! Property name for property filtering
@property (nonatomic, readonly) NSString *propertyName;

//! Property value for property filtering
@property (nonatomic, readonly) NSObject *propertyValue;

//! Property start value for range-based property filtering
@property (nonatomic, retain) NSObject *propertyStartValue;

//! Property end value for a range-based property filtering
@property (nonatomic, retain) NSObject *propertyEndValue;

#pragma mark Instantiation Methods

/*!
 * Create a point-based Storage query
 * @param point     Point
 * @param layer     Layer
 */
+ (id)queryWithPoint:(SGPoint *)point
               layer:(NSString *)layer;

/*!
 * Create an address-based Storage query
 * @param address   Address
 * @param layer     Layer
 */
+ (id)queryWithAddress:(NSString *)address
                 layer:(NSString *)layer;

/*!
 * Construct an envelope-based Storage query
 * @param envelope  Envelope
 * @param layer     Layer
 */
+ (id)queryWithEnvelope:(SGEnvelope *)envelope
                  layer:(NSString *)layer;

/*!
 * Construct a point-based Storage query
 * @param point     Point
 * @param layer     Layer
 */
- (id)initWithPoint:(SGPoint *)point
              layer:(NSString *)layer;

/*!
 * Construct an address-based Storage query
 * @param address   Address
 * @param layer     Layer
 */
- (id)initWithAddress:(NSString *)address
                layer:(NSString *)layer;

/*!
 * Construct an envelope-based Storage query
 * @param envelope  Envelope
 * @param layer     Layer
 */
- (id)initWithEnvelope:(SGEnvelope *)anEnvelope
                 layer:(NSString *)aLayer;

#pragma mark Convenience Methods

/*!
 * Set a property name by which to query
 * @param property  Property name
 * @param type      Property type
 */
- (void)setProperty:(NSString *)property
             ofType:(SGStoredPropertyType)type;

/*!
 * Set a property name and value by which to query
 * @param property  Property name
 * @param type      Property type
 * @param value     Property value
 */
- (void)setProperty:(NSString *)property
             ofType:(SGStoredPropertyType)type
             equals:(NSObject *)value;

/*!
 * Set a date range
 * @param startDate Start date
 * @param endDate   End date
 */
- (void)setDateRangeFrom:(NSDate *)startDate
                      to:(NSDate *)endDate;

@end

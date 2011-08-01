//
//  SGStorageQuery.m
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

#import "SGStorageQuery.h"

@interface SGStorageQuery ()
@property (nonatomic, retain, readwrite) NSDate *startDate;
@property (nonatomic, retain, readwrite) NSDate *endDate;
@property (nonatomic, retain, readwrite) SGStoredPropertyType propertyType;
@property (nonatomic, retain, readwrite) NSString *propertyName;
@property (nonatomic, retain, readwrite) NSObject *propertyValue;
@end

@implementation SGStorageQuery

@synthesize layer, cursor, sortType, startDate, endDate, propertyType, propertyName, propertyValue, propertyStartValue, propertyEndValue;

#pragma mark -
#pragma mark Instantiation

+ (SGStorageQuery *)queryWithPoint:(SGPoint *)point
                             layer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithPoint:point
                                            layer:layer] autorelease];
}

+ (SGStorageQuery *)queryWithAddress:(NSString *)address
                               layer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithAddress:address
                                              layer:layer] autorelease];
}

+ (SGStorageQuery *)queryWithEnvelope:(SGEnvelope *)envelope
                                layer:(NSString *)layer
{
    return [[[SGStorageQuery alloc] initWithEnvelope:envelope
                                               layer:layer] autorelease];
}

- (id)initWithPoint:(SGPoint *)aPoint
              layer:(NSString *)aLayer
{
    self = [self initWithPoint:aPoint];
    if (self) {
        layer = [aLayer retain];
    }
    return self;
}

- (id)initWithAddress:(NSString *)anAddress
                layer:(NSString *)aLayer
{
    self = [self initWithAddress:anAddress];
    if (self) {
        layer = [aLayer retain];
    }
    return self;
}

- (id)initWithEnvelope:(SGEnvelope *)anEnvelope
                 layer:(NSString *)aLayer
{
    self = [self initWithEnvelope:anEnvelope];
    if (self) {
        layer = [aLayer retain];
    }
    return self;
}

#pragma mark -
#pragma mark Convenience

- (void)setProperty:(NSString *)property
             ofType:(SGStoredPropertyType)type
{
    [self setProperty:property
               ofType:type
               equals:nil];
}

- (void)setProperty:(NSString *)property
             ofType:(SGStoredPropertyType)type
             equals:(NSObject *)value
{
    self.propertyType = type;
    self.propertyName = property;
    self.propertyValue = value;
}

- (void)setDateRangeFrom:(NSDate *)aStartDate
                      to:(NSDate *)anEndDate
{
    self.startDate = aStartDate;
    self.endDate = anEndDate;
}

#pragma mark -
#pragma mark Memory

- (void)dealloc
{
    [layer release];
    [cursor release];
    [sortType release];
    [startDate release];
    [endDate release];
    [propertyType release];
    [propertyValue release];
    [propertyStartValue release];
    [propertyEndValue release];
    [super dealloc];
}

@end

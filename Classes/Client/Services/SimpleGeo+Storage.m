//
//  SimpleGeo+Storage.m
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

#import "SimpleGeo+Storage.h"
#import "SimpleGeo+Internal.h"
#import "SGStorageQuery.h"
#import "NSArray+SGCollection.h"
#import "SGCallback.h"

NSString * const SG_API_VERSION_STORAGE = @"0.1";

@implementation SimpleGeo (Storage)

#pragma mark Record Request Methods

- (void)getRecord:(NSString *)recordID
          inLayer:(NSString *)layerName
         callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/records/%@/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, layerName, recordID];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:nil
                 callback:callback];
}

- (void)getRecordsForQuery:(SGStorageQuery *)query
                  callback:(SGCallback *)callback
{
    NSDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:query.address forKey:@"address"];
    [parameters setValue:query.cursor forKey:@"cursor"];
    [parameters setValue:query.sortType forKey:@"order"];
    [parameters setValue:[NSString stringWithFormat:@"%f", query.radius] forKey:@"radius"];
    [parameters setValue:[NSString stringWithFormat:@"%d", query.limit] forKey:@"limit"];
    if (query.startDate) [parameters setValue:[NSString stringWithFormat:@"%f", [query.startDate timeIntervalSince1970]] forKey:@"start"];
    if (query.endDate) [parameters setValue:[NSString stringWithFormat:@"%f", [query.endDate timeIntervalSince1970]] forKey:@"end"];
    [parameters setValue:query.propertyType forKey:@"prop.type"];
    [parameters setValue:query.propertyName forKey:@"prop.name"];
    if ([query.propertyType isEqual:@"boolean"])
        if ([(NSNumber *)query.propertyValue boolValue]) [parameters setValue:@"true" forKey:@"prop.equals"];
        else [parameters setValue:@"false" forKey:@"prop.equals"];        
    else [parameters setValue:query.propertyValue forKey:@"prop.equals"];
    [parameters setValue:query.propertyStartValue forKey:@"prop.start"];
    [parameters setValue:query.propertyEndValue forKey:@"prop.end"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/records/%@/nearby/%@",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, query.layer, [self baseEndpointForQuery:query]];

    [self sendHTTPRequest:@"GET"
                  toURL:url
             withParams:parameters
               callback:callback];
}

- (void)getHistoryForRecord:(NSString *)recordID
                    inLayer:(NSString *)layerName
                      limit:(NSNumber *)limit
                     cursor:(NSString *)cursor
                   callback:(SGCallback *)callback
{
    NSDictionary *parameters = [NSMutableDictionary dictionary];
    if (limit) [parameters setValue:[NSString stringWithFormat:@"%d", [limit intValue]] forKey:@"limit"];
    [parameters setValue:cursor forKey:@"cursor"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/records/%@/%@/history.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, layerName, recordID];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:parameters
                 callback:callback];
}

#pragma mark Record Manipulation Methods

- (void)addOrUpdateRecord:(SGStoredRecord *)record
                 callback:(SGCallback *)callback
{
    [self addOrUpdateRecords:[NSArray arrayWithObject:record]
                     inLayer:record.layer
                    callback:callback];
}

- (void)addOrUpdateRecords:(NSArray *)records
                   inLayer:(NSString *)layerName
                  callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/records/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, layerName];
    
    NSDictionary *featureCollection = [records asSGCollection:SGCollectionTypeRecords];
    
    [self sendHTTPRequest:@"POST"
                    toURL:url
               withParams:featureCollection
                 callback:callback];
}

- (void)deleteRecord:(NSString *)recordID
             inLayer:(NSString *)layerName
            callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/records/%@/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, layerName, recordID];
    
    [self sendHTTPRequest:@"DELETE"
                    toURL:url
               withParams:nil
                 callback:callback];
}

#pragma mark Layer Request Methods

- (void)getLayer:(NSString *)layerName
        callback:(SGCallback *)callback
{    
    NSString *url = [NSString stringWithFormat:@"%@/%@/layers/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, layerName];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:nil
                 callback:callback];
}

- (void)getLayersWithCallback:(SGCallback *)callback
{
    [self getLayersWithCursor:nil
                     callback:callback];
}

- (void)getLayersWithCursor:(NSString *)cursor
                   callback:(SGCallback *)callback
{
    NSDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:cursor forKey:@"cursor"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/layers.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:parameters
                 callback:callback];
}

#pragma mark Layer Manipulation Methods

- (void)addOrUpdateLayer:(NSString *)name
                   title:(NSString *)title
             description:(NSString *)description
            callbackURLs:(NSArray *)callbackURLs
                callback:(SGCallback *)callback
{
    NSDictionary *layerDict = [NSMutableDictionary dictionary];
    [layerDict setValue:name forKey:@"name"];
    [layerDict setValue:title forKey:@"title"];
    [layerDict setValue:description forKey:@"description"];
    [layerDict setValue:@"false" forKey:@"public"];
    [layerDict setValue:callbackURLs forKey:@"callbackURLs"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/layers/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, name];
    
    [self sendHTTPRequest:@"PUT"
                    toURL:url
               withParams:layerDict
                 callback:callback];
}

- (void)deleteLayer:(NSString *)layerName
           callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/layers/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION_STORAGE, layerName];
    
    [self sendHTTPRequest:@"DELETE"
                    toURL:url
               withParams:nil
                 callback:callback];
}

@end
//
//  SimpleGeo+Internal.h
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

#import "SimpleGeo.h"

@interface SimpleGeo (Internal)

#pragma mark Master Request Method

/*!
 * Send an API request
 * @param type      Request type
 * @param url       Request URL
 * @param params    Request parameters
 * @param callback  Request callback
 */
- (void)sendHTTPRequest:(NSString *)type
                  toURL:(NSString *)url
             withParams:(NSDictionary *)parameters 
               callback:(SGCallback *)callback;

#pragma mark Dispatcher Methods

/*!
 * Handle an API response;
 * Dispatch the response data (or error) appropriately
 * depending on the specified callback mechanism
 * @param response  Finished HTTP request object
 * @param failed    Whether or not the request failed
 */
- (void) handleResponse:(ASIHTTPRequest *)response
                 failed:(BOOL)failed;

#pragma Helper Methods for Requests

/*!
 * Generate the base endpoint for a query, depending
 * on whether it is a point, address, or envelope query
 * @param query     Query object
 */
- (NSString *)baseEndpointForQuery:(SGQuery *)query;

/*!
 * Encode a URL string
 * @param urlString     String to encode
 */
- (NSURL *)encodeURLString:(NSString *)urlString;

/*!
 * Normalize an array of request parameters into a URL string
 * @param parameters    Parameter array
 */
- (NSString *)normalizeRequestParameters:(NSDictionary *)parameters;

/*!
 * Generate a JSON Dictionary from an NSData object
 * @param data          Data object
 */
- (NSDictionary *)jsonObjectForResponseData:(NSData *)data;

@end

//
//  SimpleGeo+Context.h
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
@class SGContextQuery;

/*!
 * Informal delegate protocol for Context functionality
 */
@interface NSObject (SimpleGeoContextDelegate)

/*!
 * Called when Context information has been loaded
 * Called only when a custom target/action has not been set
 * @param context Context response
 * @param query   SGQuery object
 */
- (void)didLoadContext:(NSDictionary *)context
            forSGQuery:(SGContextQuery *)query;

#pragma mark Deprecated Delegate Methods

/*!
 * Called when Context information has been loaded
 * @param context Context response
 * @param query   Query information.
 */
- (void)didLoadContext:(NSDictionary *)context
              forQuery:(NSDictionary *)query __attribute__((deprecated));

@end

/*!
 * Client support for Context API
 */
@interface SimpleGeo (Context)

/*!
 * Get Context information for an SGQuery
 * @param query Query object
 */
- (void)getContextForQuery:(SGContextQuery *)query;

/*!
 * Called when a Context request returns if no target/action is set
 * Formats response into appropriate the appropriate SG object(s),
 * then calls standard delegate method didLoadContext:forSGQuery:
 * @param request The request query and response
 */
- (void)didReceiveContext:(NSDictionary *)request;

#pragma mark Deprecated Request Methods

/*!
 * Get Context information for a specific point
 * @param point Query point
 */
- (void)getContextForPoint:(SGPoint *)point __attribute__((deprecated));

/*!
 * Get Context information for an address
 * @param address Query address
 */
- (void)getContextForAddress:(NSString *)address __attribute__((deprecated));

@end

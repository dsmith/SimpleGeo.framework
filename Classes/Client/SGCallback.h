//
//  SGCallback.h
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

#if NS_BLOCKS_AVAILABLE
typedef void (^SGFailureBlock)(NSError *error);
typedef void (^SGSuccessBlock)(NSDictionary *response);
#endif

/*!
 * Callback object for requests
 */
@interface SGCallback : NSObject
{
    @private
    id delegate;
    SEL successMethod;
    SEL failureMethod;
    
    #if NS_BLOCKS_AVAILABLE
    SGFailureBlock failureBlock;
    SGSuccessBlock successBlock;
    #endif
}

//! Delegate object for callback
@property (nonatomic, readonly) id delegate;

//! Success method for callback;
// Takes one argument, an NSDictionary * response
@property (nonatomic, readonly) SEL successMethod;

//! Failure method for callback;
// Takes one argument, an NSError *
@property (nonatomic, readonly) SEL failureMethod;

#if NS_BLOCKS_AVAILABLE

//! Success block for callback;
// Takes one argument, an NSDictionary * response
@property (nonatomic, readonly) SGSuccessBlock successBlock;

//! Failure block for callback;
// Takes one argument, an NSError *
@property (nonatomic, readonly) SGFailureBlock failureBlock;

#endif

#pragma mark -
#pragma mark Instantiation

/*!
 * Create a delegate-based callback
 * @param delegate      Delegate object
 * @param successMethod Method called upon a successful request
 * @param failureMethod Method called upon a failed request
 */
+ (SGCallback *)callbackWithDelegate:(id)delegate
                       successMethod:(SEL)successMethod
                       failureMethod:(SEL)failureMethod;

/*!
 * Construct a delegate-based callback
 * @param delegate      Delegate object
 * @param successMethod Method called upon a successful request
 * @param failureMethod Method called upon a failed request
 */
- (id)initWithDelegate:(id)delegate
         successMethod:(SEL)successMethod
         failureMethod:(SEL)failureMethod;

#if NS_BLOCKS_AVAILABLE

/*!
 * Create a block-based callback
 * @param successBlock  Block called upon a successful request
 * @param failureBlock  Block called upon a failed request
 */
+ (SGCallback *)callbackWithSuccessBlock:(SGSuccessBlock)successBlock
                            failureBlock:(SGFailureBlock)failureBlock;

/*!
 * Construct a block-based callback
 * @param successBlock  Block called upon a successful request
 * @param failureBlock  Block called upon a failed request
 */
- (id)initWithSuccessBlock:(SGSuccessBlock)successBlock
              failureBlock:(SGFailureBlock)failureBlock;

#endif

@end
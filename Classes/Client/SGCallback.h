//
//  SGCallback.h
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/18/11.
//  Copyright 2011 AppThat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleGeo.h"

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

//! Success method for callback.
// Takes one argument, an NSDictionary * response
@property (nonatomic, readonly) SEL successMethod;

//! Failure method for callback.
// Takes one argument, an NSError *
@property (nonatomic, readonly) SEL failureMethod;

#if NS_BLOCKS_AVAILABLE

//! Success block for callback.
// Takes one argument, an NSDictionary * response
@property (nonatomic, readonly) SGSuccessBlock successBlock;

//! Failure block for callback.
// Takes one argument, an NSError *
@property (nonatomic, readonly) SGFailureBlock failureBlock;

#endif

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
         successMethod:(SEL)method
         failureMethod:(SEL)method;

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
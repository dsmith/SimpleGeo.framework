//
//  SGCallback.m
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

#import "SGCallback.h"

#if NS_BLOCKS_AVAILABLE
@interface SGCallback (Private)
+ (void)releaseBlocks:(NSArray *)blocks;
@end
#endif

@implementation SGCallback

@synthesize delegate, successMethod, failureMethod;

#if NS_BLOCKS_AVAILABLE
@synthesize successBlock, failureBlock;
#endif

#pragma mark -
#pragma mark Instantiation

+ (SGCallback *) callbackWithDelegate:(id)delegate
                        successMethod:(SEL)successMethod
                        failureMethod:(SEL)failureMethod
{
    return [[[SGCallback alloc] initWithDelegate:delegate
                                   successMethod:successMethod
                                   failureMethod:failureMethod] autorelease];
}

- (id)initWithDelegate:(id)aDelegate
         successMethod:(SEL)aSuccessMethod
         failureMethod:(SEL)aFailureMethod
{
    self = [super init];
    if(self) {
        delegate = aDelegate;
        successMethod = aSuccessMethod;
        failureMethod = aFailureMethod;
    }
    return self;
}

#if NS_BLOCKS_AVAILABLE

+ (SGCallback *)callbackWithSuccessBlock:(SGSuccessBlock)successBlock
                            failureBlock:(SGFailureBlock)failureBlock
{
    return [[[SGCallback alloc] initWithSuccessBlock:successBlock
                                        failureBlock:failureBlock] autorelease];
}

- (id)initWithSuccessBlock:(SGSuccessBlock)sBlock
              failureBlock:(SGFailureBlock)fBlock
{
    self = [super init];
    if(self) {
        successBlock = [sBlock copy];
        failureBlock = [fBlock copy];
    }
    return self;
}

#endif

#pragma mark -
#pragma mark Memory

- (void)dealloc
{
    #if NS_BLOCKS_AVAILABLE
	NSMutableArray *blocks = [NSMutableArray array];
	if(successBlock) {
		[blocks addObject:successBlock];
		[successBlock release];
		successBlock = nil;
	}
	if(failureBlock) {
		[blocks addObject:failureBlock];
		[failureBlock release];
		failureBlock = nil;
	}    
    [[self class] performSelectorOnMainThread:@selector(releaseBlocks:) 
                                   withObject:blocks
                                waitUntilDone:[NSThread isMainThread]];
    #endif
    [super dealloc];
}

#if NS_BLOCKS_AVAILABLE
+ (void)releaseBlocks:(NSArray *)blocks
{
	// Blocks will be released when this method exits
}
#endif

@end

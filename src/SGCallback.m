//
//  SGCallback.m
//  SimpleGeo
//
//  Created by Ryan Gomba on 7/18/11.
//  Copyright 2011 AppThat. All rights reserved.
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
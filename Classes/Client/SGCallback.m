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

@synthesize delegate, method, successMethod, failureMethod;

#if NS_BLOCKS_AVAILABLE
@synthesize block, successBlock, failureBlock;
#endif

+ (SGCallback *)callbackWithDelegate:(id)delegate
                              method:(SEL)method
{
    return [[[SGCallback alloc] initWithDelegate:delegate
                                          method:method] autorelease];
}

+ (SGCallback *) callbackWithDelegate:(id)delegate
                        successMethod:(SEL)successMethod
                        failureMethod:(SEL)failureMethod
{
    return [[[SGCallback alloc] initWithDelegate:delegate
                                   successMethod:successMethod
                                   failureMethod:failureMethod] autorelease];
}

- (id)initWithDelegate:(id)aDelegate
                method:(SEL)aMethod
{
    self = [super init];
    if(self) {
        delegate = aDelegate;
        method = aMethod;
    }
    return self;
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

+ (SGCallback *)callbackWithBlock:(SGResponseBlock)block
{
    return [[[SGCallback alloc] initWithBlock:block] autorelease];
}

+ (SGCallback *)callbackWithSuccessBlock:(SGSuccessBlock)successBlock
                            failureBlock:(SGFailureBlock)failureBlock
{
    return [[[SGCallback alloc] initWithSuccessBlock:successBlock
                                        failureBlock:failureBlock] autorelease];
}

- (id)initWithBlock:(SGResponseBlock)aBlock
{
    self = [super init];
    if(self) {
        block = [aBlock copy];
    }
    return self;
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
    if(block) {
		[blocks addObject:block];
		[block release];
		block = nil;
	}
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
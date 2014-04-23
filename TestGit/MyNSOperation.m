//
//  MyNSOperation.m
//  TestGit
//
//  Created by kaxiaoer on 14-4-23.
//  Copyright (c) 2014年 miaogaoliang. All rights reserved.
//

#import "MyNSOperation.h"

@implementation MyNSOperation

- (id)init {
    self = [super init];
    if (self) {
        executing = NO;
        finished = NO;
    }
    return self;
}

- (void)start{
    if ([self isCancelled]) {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}
- (void)main{
    @try {
        // Do the main work of the operation here.
//        then excute completionBlock on mainthread;
//        self completionBlock
        [self completeOperation];
    }
    @catch (NSException *exception) {
        NSLog([exception description],nil);
    }
    @finally {
        NSLog(@"complete %s",__func__);
    }
}
- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    executing = NO;
    finished = YES;
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}
- (BOOL)isConcurrent{
    return YES;
}
- (BOOL)isExecuting{
    return executing;
}
- (BOOL)isFinished{
    return finished;
}

@end

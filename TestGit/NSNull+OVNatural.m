//
//  NSNull+OVNatural.m
//  TestGit
//
//  Created by kaxiaoer on 14-4-24.
//  Copyright (c) 2014年 miaogaoliang. All rights reserved.
//

#import "NSNull+OVNatural.h"

@implementation NSNull (OVNatural)
- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self respondsToSelector:[invocation selector]]) {
        [invocation invokeWithTarget:self];
    }
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *sig = [[NSNull class] instanceMethodSignatureForSelector:selector];
    if(sig == nil) {
        sig = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    }
    return sig;
}
@end

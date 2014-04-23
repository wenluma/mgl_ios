//
//  Person.h
//  TestGit
//
//  Created by kaxiaoer on 14-4-22.
//  Copyright (c) 2014年 miaogaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(BOOL, Sex) {
    F = NO,
    M = YES
};

@interface Person : NSObject
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSUInteger age;
@property (assign, nonatomic) Sex sex;// yes 男， no 代表 女
@end

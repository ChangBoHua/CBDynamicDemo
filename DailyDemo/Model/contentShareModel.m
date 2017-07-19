//
//  contentShareModel.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/5.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "contentShareModel.h"
#import "HomeGreatsModel.h"
#import "HomeReplysModel.h"
@implementation contentShareModel

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"replys" : [HomeReplysModel class],
             @"greats" : [HomeGreatsModel class]
             };
}
@end

//
//  HomeModel.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/4.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "HomeModel.h"


@implementation HomeModel

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [contentShareModel class]
             };
}

@end

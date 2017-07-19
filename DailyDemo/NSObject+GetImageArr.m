//
//  NSObject+GetImageArr.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/14.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "NSObject+GetImageArr.h"

@implementation NSObject (GetImageArr)

+ (NSMutableArray *)initWihtImageStr:(NSString *)imageStr{
    NSMutableArray *imageArr = [NSMutableArray array];
    for (int i = 0; i< [[imageStr componentsSeparatedByString:@"|"] count]; i++) {
        [imageArr addObject:[imageStr componentsSeparatedByString:@"|"][i]];
    }
    return imageArr;
}
@end

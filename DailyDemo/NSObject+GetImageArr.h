//
//  NSObject+GetImageArr.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/14.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GetImageArr)

/**
 传一个字符串，解析一个图片数组
 */
+ (NSMutableArray *)initWihtImageStr:(NSString *)imageStr;
@end

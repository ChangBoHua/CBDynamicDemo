//
//  NSString+LikeStr.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/15.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "NSString+LikeStr.h"

@implementation NSString (LikeStr)

+ (NSString *)initWithLikeArr:(NSArray *)likeArr{
    

    NSString *returnStr = @"";
    for (int i = 0; i<likeArr.count; i++) {
        if (returnStr.length == 0) {
            returnStr = likeArr.firstObject;
        }else{
            returnStr = [NSString stringWithFormat:@"%@、%@",returnStr,likeArr[i]];
        }
    }
    //    NSLog(@"点赞转化的字符串：%@",returnStr);
    return returnStr;
}

@end

//
//  YYLabel+MessageHeight.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/14.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "YYLabel.h"

@interface YYLabel (MessageHeight)

+ (CGFloat)getMessageHeight:(NSString *)messageStr
                   MaxWidth:(CGFloat)MaxWidth
                    FontNub:(CGFloat)FontNub;

@end

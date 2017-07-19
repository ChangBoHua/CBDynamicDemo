//
//  YYLabel+MessageHeight.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/14.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "YYLabel+MessageHeight.h"
#import "NSString+SimpleModifier.h"

@implementation YYLabel (MessageHeight)


+ (CGFloat)getMessageHeight:(NSString *)messageStr
                   MaxWidth:(CGFloat)MaxWidth
                    FontNub:(CGFloat)FontNub{
    //    TICK
    YYLabel *label = [YYLabel new];
    label.text = [messageStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    label.font = [UIFont systemFontOfSize:FontNub];
    label.numberOfLines = 0;
    YYTextSimpleEmoticonParser *parser = [YYTextSimpleEmoticonParser new];
    parser.emoticonMapper  = [NSString retunRichTextDic];
    YYTextLinePositionSimpleModifier *mod = [YYTextLinePositionSimpleModifier new];
    mod.fixedLineHeight = 23;
    label.textParser = parser;
    label.linePositionModifier = mod;
    CGSize size = [label sizeThatFits:CGSizeMake(MaxWidth, CGFLOAT_MAX)];
    return size.height;
}

@end

//
//  NSString+expression.m
//  ManagementSystem
//
//  Created by 俊欧巴 on 17/6/6.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "NSString+expression.h"
@implementation NSString (expression)
+ (void)setContentWithContentStr:(NSString *)contentStr currentLabel:(UILabel *)currentLabel{
    
//    self.text = @"";
    @try {
        NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:0];
        
        [NSString getMessageRange:contentStr :imageArr];
        
        NSMutableAttributedString *mutableAttributedStr=[[NSMutableAttributedString alloc]initWithString:@""];
        [imageArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSString *contentPartStr = [NSString stringWithFormat:@"%@",obj];
            if (contentPartStr.length > 0) {
                
                NSString *firstC = [obj substringWithRange:NSMakeRange(0, 1)];
                
                NSString *endC = [obj substringWithRange:NSMakeRange(1, contentPartStr.length-1)];
                NSAttributedString *attributedStr;
                if ([firstC isEqualToString:@"[" ]&&[endC rangeOfString:@"]" ].location!=NSNotFound ) {
                    NSRange firstRange = [obj rangeOfString:@"["];
                    NSRange secondRange = [obj rangeOfString:@"]"];
                    NSUInteger length = secondRange.location - firstRange.location;
                    NSRange imageNameRange = NSMakeRange(1, length - 1);
                    NSString *imageName = [obj substringWithRange:imageNameRange];
                    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
                    attachment.image = [UIImage imageNamed:imageName];

                    if (attachment.image==nil) {
                    attributedStr = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"[%@]",imageName]];
                    }else{
                        attachment.bounds = CGRectMake(0, 0, 20, 20);
                        attributedStr = [[NSAttributedString alloc]initWithString:@""];
                        attributedStr = [NSAttributedString attributedStringWithAttachment:attachment];
                    }
                }
                else{
                    attributedStr = [[NSAttributedString alloc]initWithString:obj];
                    
                }
                
                [mutableAttributedStr appendAttributedString:attributedStr];
                 currentLabel.attributedText =mutableAttributedStr;
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
    }
}
+ (void)getMessageRange:(NSString*)message :(NSMutableArray*)array {
    
    NSRange rangeL = [message rangeOfString:@"["];
    NSRange rangeR = [message rangeOfString:@"]"];
    //判断当前字符串是否还有表情的标志。
    if (rangeL.length && rangeR.length) {
        if (rangeL.location > 0) {
            
            [array addObject:[message substringToIndex:rangeL.location]];
            [array addObject:[message substringWithRange:NSMakeRange(rangeL.location, rangeR.location + 1 - rangeL.location)]];
            
            NSString *str = [message substringFromIndex:rangeR.location + 1];
            [self getMessageRange:str :array];
        }
        else {
            NSString *nextstr = [message substringWithRange:NSMakeRange(rangeL.location, rangeR.location + 1 - rangeL.location)];
            //排除“”空字符串
            if (![nextstr isEqualToString:@""]) {
                
                [array addObject:nextstr];
                
                NSString *str = [message substringFromIndex:rangeR.location + 1];
                [self getMessageRange:str :array];
            }
            else {
                
                return;
            }
        }
    }
    else {
        [array addObject:message];
    }
}

@end

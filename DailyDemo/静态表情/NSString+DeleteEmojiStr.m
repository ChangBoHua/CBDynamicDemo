//
//  NSString+DeleteEmojiStr.m
//  CBEmojiKeyboard
//
//  Created by 俊欧巴 on 17/6/6.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "NSString+DeleteEmojiStr.h"

@implementation NSString (DeleteEmojiStr)

+ (void)setDeleteEmojiStr:(NSString *)richStr
              returnBlock:(void(^)(NSString *returnStr))returnBlock{
    if (richStr.length>0) {
        if ([[richStr substringFromIndex:richStr.length-1] isEqualToString:@"]"]) {
            if (richStr.length == 4) {
                if ([[richStr substringFromIndex:richStr.length-4] hasPrefix:@"["]) {
                    NSRange lastRange = [richStr rangeOfComposedCharacterSequenceAtIndex:richStr.length-4];
                    richStr= [richStr substringToIndex:lastRange.location];
                }
            }else if (richStr.length == 3){
                if ([[richStr substringFromIndex:richStr.length-3] hasPrefix:@"["]) {
                    NSRange lastRange = [richStr rangeOfComposedCharacterSequenceAtIndex:richStr.length-3];
                    richStr= [richStr substringToIndex:lastRange.location];
                }
            }else if (richStr.length > 4){
                if ([[richStr substringFromIndex:richStr.length-5] hasPrefix:@"["]) {
                    NSRange lastRange = [richStr rangeOfComposedCharacterSequenceAtIndex:richStr.length-5];
                    richStr= [richStr substringToIndex:lastRange.location];
                }else if ([[richStr substringFromIndex:richStr.length-4] hasPrefix:@"["]){
                    NSRange lastRange = [richStr rangeOfComposedCharacterSequenceAtIndex:richStr.length-4];
                    richStr= [richStr substringToIndex:lastRange.location];
                }else if ([[richStr substringFromIndex:richStr.length-3] hasPrefix:@"["]) {
                    NSRange lastRange = [richStr rangeOfComposedCharacterSequenceAtIndex:richStr.length-3];
                    richStr= [richStr substringToIndex:lastRange.location];
                }
            }
        }else{
            NSRange lastRange = [richStr rangeOfComposedCharacterSequenceAtIndex:richStr.length-1];
            richStr = [richStr substringToIndex:lastRange.location];
        }
    }else{
        NSLog(@"空字符串不用删除");
    }
    if (returnBlock) {
        returnBlock(richStr);
    }
}




@end

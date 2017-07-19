//
//  NSString+DeleteEmojiStr.h
//  CBEmojiKeyboard
//
//  Created by 俊欧巴 on 17/6/6.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (DeleteEmojiStr)

/**
 将富文本字符串加入到方法里面

 @param richStr 富文本字符串
 @param returnBlock 返回删除完的字符串
 */
+ (void)setDeleteEmojiStr:(NSString *)richStr
              returnBlock:(void(^)(NSString *returnStr))returnBlock;

@end

//
//  CommentView.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/15.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIImageView

/**
 将两个数组传递过来

 @param replysArr 评论的数组
 @param greatsArr 点赞的数组
 */
- (void)setReplysArr:(NSMutableArray *)replysArr greatsArr:(NSMutableArray *)greatsArr;

@end

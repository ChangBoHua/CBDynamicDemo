//
//  CommentCell.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/15.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "CommentCell.h"
#import "SDAutoLayout.h"
#import "NSAttributedString+YYText.h"
#import "YYLabel+MessageHeight.h"
#import "NSString+SimpleModifier.h"

/* 屏幕大小 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// rgb颜色转换（16进制->10进制）
#define HEXCOLOR(rgbValue)                                                                                             \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0                                               \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0                                                  \
blue:((float)(rgbValue & 0xFF)) / 255.0                                                           \
alpha:1.0]
@implementation CommentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"reuse3";
    // 1.缓存中取
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addsubViews];
        [self setUp];
        self.backgroundColor = HEXCOLOR(0xf2f2f2);
    }
    return self;
}

#pragma mark --------- 添加视图 -----------
- (void)addsubViews{
    [self.contentView sd_addSubviews:@[self.commentLabel]];
}
- (void)setUp{
    
    self.commentLabel.sd_layout
    .widthIs(SCREEN_WIDTH-44)
    .leftSpaceToView(self.contentView,5)
    .topSpaceToView(self.contentView,0);
}
- (YYLabel *)commentLabel{
    
    if (!_commentLabel) {
        _commentLabel = [YYLabel new];
        _commentLabel.font = [UIFont systemFontOfSize:14];
        _commentLabel.textColor = HEXCOLOR(0x4c4c4c);
        _commentLabel.numberOfLines = 0;
        _commentLabel.preferredMaxLayoutWidth = SCREEN_WIDTH-44; //设置最大的宽度
        _commentLabel.displaysAsynchronously = YES; /// enable async display
        YYTextSimpleEmoticonParser *parser = [YYTextSimpleEmoticonParser new];
        parser.emoticonMapper  = [NSString retunRichTextDic];
        YYTextLinePositionSimpleModifier *mod = [YYTextLinePositionSimpleModifier new];
        mod.fixedLineHeight = 22.5;
        _commentLabel.textParser = parser;
        _commentLabel.linePositionModifier = mod;
    }
    return _commentLabel;
}

- (void)setComentArr:(NSMutableArray *)comentArr{
    
    
    
    if ([[[comentArr objectAtIndex:self.indexPath.row] valueForKey:@"TYPE"] isEqualToString:@"1"]) {
        
        CGFloat cellHeight = [YYLabel getMessageHeight:[[NSString stringWithFormat:@"%@ 回复 %@:%@",[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"],[comentArr[self.indexPath.row] valueForKey:@"TARGET_NAME"],[comentArr[self.indexPath.row] valueForKey:@"REPLY_CONTENT"]] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  MaxWidth:SCREEN_WIDTH-34 FontNub:14];
        
        self.commentLabel.sd_layout
        .heightIs(cellHeight);
        
        NSRange range = NSMakeRange(0, [[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"] length]);
        
        NSRange toRange = NSMakeRange([[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"] length]+4,[[comentArr[self.indexPath.row] valueForKey:@"TARGET_NAME"] length]);
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[[NSString stringWithFormat:@"%@ 回复 %@:%@",[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"],[comentArr[self.indexPath.row] valueForKey:@"TARGET_NAME"],[comentArr[self.indexPath.row] valueForKey:@"REPLY_CONTENT"]] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] attributes:@{NSForegroundColorAttributeName:HEXCOLOR(0x303030)}];
        text.yy_font = [UIFont systemFontOfSize:14];
        [text yy_setTextHighlightRange:range
                                 color:HEXCOLOR(0x5583f0)
                       backgroundColor:[UIColor clearColor]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){

                                 NSLog(@"%@",text);
                                 
                             }];
        [text yy_setTextHighlightRange:toRange
                                 color:HEXCOLOR(0x5583f0)
                       backgroundColor:[UIColor clearColor]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){

                                 NSLog(@"%@",text);
                                 
                                 
                             }];
        text.yy_lineSpacing = 0;
        text.yy_alignment = NSTextAlignmentJustified;
        self.commentLabel.attributedText = text;
        
        
    }else if ([[[comentArr objectAtIndex:self.indexPath.row] valueForKey:@"TYPE"] isEqualToString:@"0"]){
        CGFloat cellHeight = [YYLabel getMessageHeight:[[NSString stringWithFormat:@"%@: %@",[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"],[comentArr[self.indexPath.row] valueForKey:@"REPLY_CONTENT"]] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  MaxWidth:SCREEN_WIDTH-34 FontNub:14];
        
        self.commentLabel.sd_layout
        .heightIs(cellHeight);
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[[NSString stringWithFormat:@"%@: %@",[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"],[comentArr[self.indexPath.row] valueForKey:@"REPLY_CONTENT"]] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] attributes:@{NSForegroundColorAttributeName:HEXCOLOR(0x303030)}];
        text.yy_font = [UIFont systemFontOfSize:14];
        NSRange range = NSMakeRange(0, [[comentArr[self.indexPath.row] valueForKey:@"USER_NAME"] length]);
        [text yy_setTextHighlightRange:range
                                 color:HEXCOLOR(0x5583f0)
                       backgroundColor:[UIColor clearColor]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                        
                                 NSLog(@"%@",text.string);

                                 
                             }];
        text.yy_lineSpacing = 0;
        text.yy_alignment = NSTextAlignmentJustified;
        self.commentLabel.attributedText = text;
        
    }

    
}

@end

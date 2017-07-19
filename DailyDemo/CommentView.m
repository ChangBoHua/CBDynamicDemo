//
//  CommentView.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/15.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "CommentView.h"
#import "YYLabel.h"
#import "NSAttributedString+YYText.h"
#import "SDAutoLayout.h"
#import "CommentCell.h"
#import "YYLabel+MessageHeight.h"
#import "NSString+LikeStr.h"

// rgb颜色转换（16进制->10进制）
#define HEXCOLOR(rgbValue)                                                                                             \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0                                               \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0                                                  \
blue:((float)(rgbValue & 0xFF)) / 255.0                                                           \
alpha:1.0]

/* 屏幕大小 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface CommentView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) YYLabel *zanLabel; //点赞的label
@property (nonatomic, strong) UITableView *tableView; //评论的tableView
@property (nonatomic, strong) NSMutableArray *commentArr;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation CommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addsubViews];
        [self setUp];
    }
    return self;
}

#pragma mark --------- 添加视图 -----------
- (void)addsubViews{
    [self sd_addSubviews:@[self.zanLabel,
                           self.tableView]];
}
- (void)setUp{
    
    self.tableView.sd_layout
    .widthIs(SCREEN_WIDTH-34)
    .leftSpaceToView(self,0);
    self.zanLabel.sd_layout
    .widthIs(SCREEN_WIDTH-48)
    .leftSpaceToView(self,7);

    

    
}
- (void)setReplysArr:(NSMutableArray *)replysArr
           greatsArr:(NSMutableArray *)greatsArr{
    
    
    NSMutableArray *greatsArrs = [NSMutableArray array];
   
    [greatsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *greatsStr = [obj valueForKey:@"USER_NAME"];
        [greatsArrs addObject:greatsStr];
    }];
    
    
    if (greatsArr.count > 0) {
      self.zanLabel.hidden = NO;
      self.zanLabel.sd_layout
      .heightIs(30)
      .topSpaceToView(self,7.5);

        if (replysArr.count > 0) {
            self.tableView.sd_layout
            .topSpaceToView(self.zanLabel,0);
        }

    }else{

        self.zanLabel.hidden = YES;
        self.zanLabel.sd_layout
        .heightIs(0);
        self.tableView.sd_layout
        .topSpaceToView(self,7.5);
    }
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:14];
    UIImage *image = [UIImage imageNamed:@"dynamic-32"];
    NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString:attachText];
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %@",[NSString initWithLikeArr:greatsArrs]] attributes:@{NSForegroundColorAttributeName:HEXCOLOR(0x303030)}]];
    text.yy_lineSpacing = 2;
    self.zanLabel.textColor = HEXCOLOR(0x303030);
    self.zanLabel.attributedText = text;
    
    self.commentArr = replysArr.copy;
    self.tableView.sd_layout
    .heightIs([self getCommentTotalHeight:self.commentArr]);
    [self.tableView reloadData];
    
    
}
- (YYLabel *)zanLabel{
    
    if (!_zanLabel) {
        _zanLabel = [YYLabel new];
    }
    return _zanLabel;
}
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        _tableView.scrollEnabled = NO;
        _tableView.backgroundColor = HEXCOLOR(0xf2f2f2);
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat cellHeight = 0;
    
    if ([[[self.commentArr objectAtIndex:indexPath.row] valueForKey:@"TYPE"] isEqualToString:@"1"]) {
        cellHeight = [YYLabel getMessageHeight:[NSString stringWithFormat:@"%@ 回复 %@:%@",[[self.commentArr objectAtIndex:indexPath.row] valueForKey:@"USER_NAME"],[[self.commentArr objectAtIndex:indexPath.row] valueForKey:@"TARGET_NAME"],[[self.commentArr objectAtIndex:indexPath.row] valueForKey:@"REPLY_CONTENT"]]  MaxWidth:SCREEN_WIDTH-34 FontNub:14];
        return cellHeight;
        
    }else{
        cellHeight = [YYLabel getMessageHeight:[NSString stringWithFormat:@"%@: %@",[[self.commentArr objectAtIndex:indexPath.row]valueForKey:@"USER_NAME"],[[self.commentArr objectAtIndex:indexPath.row]valueForKey:@"REPLY_CONTENT"]]  MaxWidth:SCREEN_WIDTH-34 FontNub:14];
        return cellHeight;
        
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentCell *cell = [CommentCell cellWithTableView:tableView];
    cell.indexPath = indexPath;
    [cell setComentArr:self.commentArr];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
}
- (CGFloat )getCommentTotalHeight:(NSMutableArray *)commetnArr{

    CGFloat cellsTotalHeight = 0;
    for (int j = 0; j<commetnArr.count; j ++) {
        
        CGFloat cellHeight = 0;
        
        if ([[[commetnArr objectAtIndex:j] valueForKey:@"TYPE"] isEqualToString:@"1"]) {
        cellHeight = [YYLabel getMessageHeight:[NSString stringWithFormat:@"%@ 回复 %@:%@",[commetnArr[j] valueForKey:@"USER_NAME"],[commetnArr[j] valueForKey:@"TARGET_NAME"],[commetnArr[j] valueForKey:@"REPLY_CONTENT"]]  MaxWidth:SCREEN_WIDTH-34 FontNub:14];
        }else{
            cellHeight = [YYLabel getMessageHeight:[NSString stringWithFormat:@"%@: %@",[[commetnArr objectAtIndex:j]valueForKey:@"USER_NAME"],[[commetnArr objectAtIndex:j]valueForKey:@"REPLY_CONTENT"]]  MaxWidth:SCREEN_WIDTH-34 FontNub:14];
        }
        
        cellsTotalHeight = cellsTotalHeight+cellHeight;
    }

    return cellsTotalHeight;

}

@end

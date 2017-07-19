//
//  SingleRowCell.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/4.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "SingleRowCell.h"
#import "SDAutoLayout.h"
#import "NSString+SimpleModifier.h"
#import "YYLabel+MessageHeight.h"

/* 屏幕大小 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/* 适配 */
#define WIDTH [UIScreen mainScreen].bounds.size.width / 375
#define HEIGHT [UIScreen mainScreen].bounds.size.height / 667
// rgb颜色转换（16进制->10进制）
#define HEXCOLOR(rgbValue)                                                                                             \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0                                               \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0                                                  \
blue:((float)(rgbValue & 0xFF)) / 255.0                                                           \
alpha:1.0]
@implementation SingleRowCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"reuse";
    // 1.缓存中取
    SingleRowCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[SingleRowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = 0;
        [self addSubViews];
        [self setUp];
    }
    return self;
}

#pragma mark --------- 添加视图 -----------
- (void)addSubViews{
   
    [self.contentView sd_addSubviews:@[self.lastNameLabel,
                                       self.userNameLabel,
                                       self.departmentLabel,
                                       self.typeLabel,
                                       self.contentLabel,
                                       self.photoView,
                                       self.distanceLabel,
                                       self.timeLabel,
                                       self.zanBtn,
                                       self.commentBtn,
                                       self.comentView]];
}
- (void)setUp{
    
    self.lastNameLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,6)
    .widthIs(41)
    .heightIs(41);
    self.userNameLabel.sd_layout
    .leftSpaceToView(self.lastNameLabel,10)
    .topSpaceToView(self.contentView,7)
    .heightIs(20);
    [self.userNameLabel setSingleLineAutoResizeWithMaxWidth:200];
    self.departmentLabel.sd_layout
    .leftSpaceToView(self.lastNameLabel,10)
    .topSpaceToView(self.userNameLabel,0)
    .heightIs(20);
    [self.departmentLabel setSingleLineAutoResizeWithMaxWidth:200];
    self.typeLabel.sd_layout
    .topSpaceToView(self.contentView,32)
    .rightSpaceToView(self.contentView,17)
    .heightIs(20);
    [self.typeLabel setSingleLineAutoResizeWithMaxWidth:200];
    self.contentLabel.sd_layout
    .leftSpaceToView(self.contentView,17)
    .widthIs(SCREEN_WIDTH-40)
    .topSpaceToView(self.lastNameLabel,8);
    self.photoView.sd_layout
    .topSpaceToView(self.contentLabel,10)
    .leftSpaceToView(self.contentView,17);
    self.distanceLabel.sd_layout
    .leftSpaceToView(self.contentView,17)
    .heightIs(20);
    [self.distanceLabel setSingleLineAutoResizeWithMaxWidth:300];
    self.timeLabel.sd_layout
    .leftSpaceToView(self.contentView,17)
    .topSpaceToView(self.distanceLabel,3)
    .heightIs(20);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:200];
    self.zanBtn.sd_layout
    .widthIs(30)
    .heightIs(30)
    .leftSpaceToView(self.contentView,300*WIDTH)
    .topSpaceToView(self.distanceLabel,-5);
    self.commentBtn.sd_layout
    .widthIs(30)
    .heightIs(30)
    .leftSpaceToView(self.zanBtn,0)
    .topSpaceToView(self.distanceLabel,-4);
    self.comentView.sd_layout
    .topSpaceToView(self.timeLabel,2)
    .leftSpaceToView(self.contentView,17)
    .widthIs(SCREEN_WIDTH-34);
    
}
- (void)setContentModel:(contentShareModel *)contentModel{
    
    CGFloat height = [YYLabel getMessageHeight:[contentModel.contentShare.CONTENT_A stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] MaxWidth:SCREEN_WIDTH-40 FontNub:15];
    self.contentLabel.sd_layout
    .heightIs (height);
    
    if (contentModel.contentShare.IMG.length > 0) {
        self.photoView.hidden = NO;
        self.distanceLabel.sd_layout
        .topSpaceToView (self.photoView,10);
        [self.photoView setImagerStr:contentModel.contentShare.IMG];
    }else{
        self.distanceLabel.sd_layout
        .topSpaceToView (self.contentLabel,10);
        [self.photoView setImagerStr:@""];
        self.photoView.hidden = YES;
    }
    if (contentModel.contentShare.POSITION.length > 0) {
        self.distanceLabel.text = contentModel.contentShare.POSITION;
    }else{
         self.distanceLabel.text = @"暂无位置信息";
    }
    if ([contentModel.contentShare.TYPE isEqualToString:@"1"]) {
        self.typeLabel.text = @"日报";
    }else if ([contentModel.contentShare.TYPE isEqualToString:@"4"]){
        self.typeLabel.text = @"分享";
    }else if ([contentModel.contentShare.TYPE isEqualToString:@"5"]){
        self.typeLabel.text = @"客户";
    }else if ([contentModel.contentShare.TYPE isEqualToString:@"6"]){
        self.typeLabel.text = @"拜访";
    }
    self.lastNameLabel.text = @"仙";
    self.userNameLabel.text = contentModel.contentShare.USER_NAME;
    self.departmentLabel.text = contentModel.contentShare.USER_ORG_NAME;
    self.timeLabel.text = contentModel.contentShare.CREATE_DATE;
    self.contentLabel.text =[contentModel.contentShare.CONTENT_A stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
     UIView *bottomView = nil;
    if (contentModel.replys.count > 0 ) {
        self.comentView.hidden = NO;
        bottomView = self.comentView;
        if (contentModel.greats.count > 0) {
            self.comentView.sd_layout
            .heightIs([self getCommentTotalHeight:contentModel.replys]+40);
        }else{
            self.comentView.sd_layout
            .heightIs([self getCommentTotalHeight:contentModel.replys]+10);
        }
        
    }else{
        if (contentModel.greats.count > 0) {
            self.comentView.hidden = NO;
            self.comentView.sd_layout
            .heightIs(40);
            bottomView = self.comentView;
        }else{
            self.comentView.sd_layout
            .heightIs(0);
            self.comentView.hidden = YES;
            bottomView = self.timeLabel;
        }
    }
    [self.comentView setReplysArr:contentModel.replys greatsArr:contentModel.greats];
    [self setupAutoHeightWithBottomView:bottomView bottomMargin:10];
    
}
- (UILabel *)lastNameLabel{
    if (!_lastNameLabel) {
        _lastNameLabel = [UILabel new];
        _lastNameLabel.layer.masksToBounds = YES;
        _lastNameLabel.layer.cornerRadius = 20;
        _lastNameLabel.layer.borderWidth = 0.5;
        _lastNameLabel.layer.borderColor = HEXCOLOR(0x48bed9).CGColor;
        _lastNameLabel.textColor = HEXCOLOR(0x48bed9);
        _lastNameLabel.textAlignment = NSTextAlignmentCenter;
        _lastNameLabel.userInteractionEnabled = YES;
        _lastNameLabel.tag  = 10;
//        UITapGestureRecognizer *tapNameLab = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapNameLabel:)];
//        [_lastNameLabel addGestureRecognizer:tapNameLab];
    }
    return _lastNameLabel;
}
- (UILabel *)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [UILabel new];
        _userNameLabel.textColor = HEXCOLOR(0x303030);
        _userNameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _userNameLabel;
}
- (UILabel *)departmentLabel{
    if (!_departmentLabel) {
        _departmentLabel = [UILabel new];
        _departmentLabel.textColor = HEXCOLOR(0xb3b3b3);
        _departmentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _departmentLabel;
}
- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.textColor = HEXCOLOR(0x5583f0);
        _typeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _typeLabel;
}
- (YYLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [YYLabel new];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textColor = HEXCOLOR(0x303030);
        _contentLabel.numberOfLines = 0;
        _contentLabel.size = CGSizeMake(330*WIDTH, CGFLOAT_MAX);
        YYTextSimpleEmoticonParser *parser = [YYTextSimpleEmoticonParser new];
        parser.emoticonMapper  = [NSString retunRichTextDic];
        YYTextLinePositionSimpleModifier *mod = [YYTextLinePositionSimpleModifier new];
        mod.fixedLineHeight = 22;
        _contentLabel.textParser = parser;
        _contentLabel.linePositionModifier = mod;
    }
    return _contentLabel;
}
- (UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [UILabel new];
        _distanceLabel.textColor = HEXCOLOR(0x6d6d6d);
        _distanceLabel.font = [UIFont systemFontOfSize:13];
    }
    return _distanceLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.textColor = HEXCOLOR(0x6d6d6d);
        _timeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _timeLabel;
}
- (PhotoView *)photoView{
    if (!_photoView) {
        _photoView = [PhotoView new];
    }
    return _photoView;
}
- (UIButton *)zanBtn{
    
    if (!_zanBtn) {
        _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zanBtn setImage:[UIImage imageNamed:@"dynamic-29"] forState:UIControlStateNormal];
        [_zanBtn addTarget:self action:@selector(toggleZanBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zanBtn;
    
}
- (UIButton *)commentBtn{
    if (!_commentBtn) {
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentBtn setImage:[UIImage imageNamed:@"dynamic-31"] forState:UIControlStateNormal];
        [_commentBtn addTarget:self action:@selector(toggleCommentBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}
- (CommentView *)comentView{
    
    if (!_comentView) {
        _comentView = [[CommentView alloc] init];
        _comentView.image = [[UIImage imageNamed:@"LikeCmtBg"] stretchableImageWithLeftCapWidth:30 topCapHeight:30];
        _comentView.userInteractionEnabled = YES;
    }
    return _comentView;
}
// 点击点赞的按钮了
- (void)toggleZanBtnClicked:(UIButton *)btn{
    NSLog(@"点赞");
}
// 点击了评论的按钮
- (void)toggleCommentBtnClicked:(UIButton *)btn{
    NSLog(@"评论");

}
- (CGFloat )getCommentTotalHeight:(NSMutableArray *)commetnArr{
    
    CGFloat cellsTotalHeight = 0;
    for (int j = 0; j<commetnArr.count; j ++) {
        
        CGFloat cellHeight = 0;
        
        if ([[[commetnArr objectAtIndex:j] valueForKey:@"TYPE"] isEqualToString:@"1"]) {
            cellHeight = [YYLabel getMessageHeight:[NSString stringWithFormat:@"%@ 回复 %@:%@",[commetnArr[j] valueForKey:@"USER_NAME"],[commetnArr[j] valueForKey:@"TARGET_NAME"],[commetnArr[j] valueForKey:@"REPLY_CONTENT"]]  MaxWidth:SCREEN_WIDTH-40 FontNub:14];
        }else{
            cellHeight = [YYLabel getMessageHeight:[NSString stringWithFormat:@"%@: %@",[[commetnArr objectAtIndex:j]valueForKey:@"USER_NAME"],[[commetnArr objectAtIndex:j]valueForKey:@"REPLY_CONTENT"]]  MaxWidth:SCREEN_WIDTH-40 FontNub:14];
        }
        
        cellsTotalHeight = cellsTotalHeight+cellHeight;
    }
    return cellsTotalHeight;
    
}


@end

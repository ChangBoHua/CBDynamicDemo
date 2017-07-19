//
//  DoubleRowCell.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/4.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYLabel.h"
#import "contentShareModel.h"
#import "PhotoView.h"
#import "CommentView.h"


@interface DoubleRowCell : UITableViewCell

@property (nonatomic, strong) UILabel *lastNameLabel; // 名字的最后一个字
@property (nonatomic, strong) UILabel *userNameLabel; // 昵称
@property (nonatomic, strong) UILabel *departmentLabel; // 部门
@property (nonatomic, strong) UILabel *typeLabel; // 类型
@property (nonatomic, strong) PhotoView *photoView; // 图片的view
@property (nonatomic, strong) UILabel *titleLabel; // 主标题
@property (nonatomic, strong) UILabel *subtitleLabel; //副标题
@property (nonatomic, strong) YYLabel *a_contentLabel; // 文本a的内容
@property (nonatomic, strong) YYLabel *b_contentLabel; // 文本b的内容
@property (nonatomic, strong) UILabel *distanceLabel; // 距离的label
@property (nonatomic, strong) UILabel *timeLabel; //时间的label
@property (nonatomic, strong) UIButton *zanBtn; //点赞的按钮
@property (nonatomic, strong) UIButton *commentBtn; // 评论的按钮
@property (nonatomic, strong) CommentView *comentView; //评论的View

@property (nonatomic, strong) contentShareModel *contentModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;



@end

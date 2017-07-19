//
//  SingleRowCell.h
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


@interface SingleRowCell : UITableViewCell

@property (nonatomic, strong) UILabel *lastNameLabel; // 名字的最后一个字
@property (nonatomic, strong) UILabel *userNameLabel; // 昵称
@property (nonatomic, strong) UILabel *departmentLabel; // 部门
@property (nonatomic, strong) UILabel *typeLabel; // 类型
@property (nonatomic, strong) YYLabel *contentLabel; // 文本内容
@property (nonatomic, strong) PhotoView *photoView; // 图片的view
@property (nonatomic, strong) UILabel *distanceLabel; // 距离的label
@property (nonatomic, strong) UILabel *timeLabel; //时间的label
@property (nonatomic, strong) UIButton *zanBtn; //点赞的按钮
@property (nonatomic, strong) UIButton *commentBtn; // 评论的按钮
@property (nonatomic, strong) CommentView *comentView; //评论的View
@property (nonatomic, strong) contentShareModel *contentModel;
@property (nonatomic, strong) NSIndexPath* indexPath;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

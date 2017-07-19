//
//  CommentCell.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/15.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYLabel.h"
@interface CommentCell : UITableViewCell

@property (nonatomic, strong) YYLabel *commentLabel;
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setComentArr:(NSMutableArray *)comentArr;

@end

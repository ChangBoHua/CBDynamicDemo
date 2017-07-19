//
//  contentShareModel.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/5.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareModel.h"

@class contentShareModel,HomeGreatsModel,HomeReplysModel,ShareModel;

@interface contentShareModel : NSObject


@property (nonatomic, strong) ShareModel *contentShare;
@property (nonatomic, strong) HomeReplysModel *replysModel;
@property (nonatomic, strong) HomeGreatsModel *greatsModel;
@property (nonatomic, strong) NSMutableArray *replys;
@property (nonatomic, strong) NSMutableArray *greats;

@end

//
//  HomeModel.h
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/4.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "contentShareModel.h"
#import "HomeGreatsModel.h"
#import "HomeReplysModel.h"


@interface HomeModel : NSObject

/**
 接收服务器的返回数组
 */
@property (nonatomic, strong) NSMutableArray *list;

@end

//
//  HomeView.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/4.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "HomeView.h"
#import "DoubleRowCell.h"
#import "SingleRowCell.h"
#import "HomeModel.h"
#import "YYModel.h"
#import "SDAutoLayout.h"
@interface HomeView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr; // 数据源
@property (nonatomic, strong) NSMutableArray *dataSourceArr; //

@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addsubViews];
        [self fetchData];
    }
    return self;
}
#pragma mark --------- 添加视图 -----------
- (void)addsubViews{
    [self addSubview:self.tableView];
}
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}
#pragma mark --------- 创建tableView ----------------
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)] ;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.dataSourceArr[indexPath.row][@"contentShare"][@"TYPE"] isEqualToString:@"3"]||[self.dataSourceArr[indexPath.row][@"contentShare"][@"TYPE"] isEqualToString:@"2"]) {
        
        DoubleRowCell *cell = [DoubleRowCell cellWithTableView:tableView];
        cell.contentModel = self.dataArr[indexPath.row];
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        return cell;
        
    }else{

        SingleRowCell *cell = [SingleRowCell cellWithTableView:tableView];
        cell.indexPath = indexPath;
        cell.contentModel = self.dataArr[indexPath.row];
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];

        return cell;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width tableView:self.tableView];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
#pragma mark ------------- 获取数据（这里是本地的一个Json数据） ---------------
- (void)fetchData{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:@"json"];
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:path];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    self.dataSourceArr = dic[@"page"][@"list"];
    
    
    HomeModel *model = [HomeModel yy_modelWithDictionary:dic[@"page"]];

    
    self.dataArr = model.list;
    
    [self.tableView reloadData];
    
}

@end

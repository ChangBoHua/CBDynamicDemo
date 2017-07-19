//
//  ViewController.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/4.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "ViewController.h"
#import "HomeView.h"
@interface ViewController ()

@property (nonatomic, strong) HomeView *homeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addSubViews];
}
#pragma mark ------------- 添加View ---------------
- (void)addSubViews{
    [self.view addSubview:self.homeView];
}

- (HomeView *)homeView{
    if (!_homeView) {
        _homeView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _homeView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

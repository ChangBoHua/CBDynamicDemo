//
//  PhotoView.m
//  DailyDemo
//
//  Created by 俊欧巴 on 17/7/13.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "PhotoView.h"
#import "NSObject+GetImageArr.h"
#import "SDAutoLayout.h"
#import "UIImageView+WebCache.h"

@interface PhotoView ()

@property (nonatomic, strong) NSMutableArray *imageArr;
@property (nonatomic, strong) NSMutableArray *photoImageArr;

@end

@implementation PhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        [temp addObject:imageView];
    }
    
    self.photoImageArr = [temp copy];
}

- (NSMutableArray *)imageArr{
    if (!_imageArr) {
        _imageArr = [NSMutableArray array];
    }
    return _imageArr;
}
- (void)setImagerStr:(NSString *)imageStr{

    self.imageArr = [NSObject initWihtImageStr:imageStr];
    
    for (long i = self.imageArr.count; i < self.photoImageArr.count; i++) {
        
        UIImageView *imageView = [self.photoImageArr objectAtIndex:i];
        imageView.hidden = YES;
    }
    if (self.imageArr.count == 0) {
        self.height_sd = 0;
        self.fixedHeight = @(0);
        return;
    }
    CGFloat itemW = 90;
    CGFloat itemH = 90;
   long perRowItemCount = [self perRowItemCountForPhotoArray:self.imageArr];
    CGFloat margin = 5;
  [self.imageArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
     
      long columnIndex = idx % perRowItemCount;
      long rowIndex = idx / perRowItemCount;
      UIImageView *imageView = [self.photoImageArr objectAtIndex:idx];
      imageView.hidden = NO;
      imageView.image = [UIImage imageNamed:obj];
      [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",obj]]];
      imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
  }];
  
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(self.imageArr.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    self.width_sd = w;
    self.height_sd = h;
    self.fixedHeight = @(h);
    self.fixedWidth = @(w);
    
}
- (NSInteger)perRowItemCountForPhotoArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count <= 4) {
        return 3;
    } else {
        return 3;
    }
}
#pragma mark - private actions

- (void)tapImageView:(UITapGestureRecognizer *)tap
{
    NSLog(@"点击图片了");
}

@end

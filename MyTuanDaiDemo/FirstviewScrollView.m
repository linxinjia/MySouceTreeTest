//
//  FirstviewScrollView.m
//  TelevisionFans
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "FirstviewScrollView.h"
//#import "SecondViewCell.h"
@implementation FirstviewScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createCycleScroll];
    }
    return self;
}
- (void)createCycleScroll
{
    _array = @[[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"1.png"]];
    
    // 网络加载图片的轮播器
//    _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    _cycleScrollView = [[SDCycleScrollView alloc]init];

    // 本地加载图片的轮播器
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imagesGroup:_array];
    _cycleScrollView.dotColor = [UIColor redColor]; // 自定义分页控件小圆标颜色

    
//    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight; // 设置pageControl居右，默认居中
    
//    _cycleScrollView.titlesGroup = ; // 如果设置title数组，则会在图片下面添加标题
    
//    _cycleScrollView.delegate = ; // 如需监听图片点击，请设置代理，实现代理方法
    

    
    
    [self addSubview:_cycleScrollView];
    _cycleScrollView.autoScrollTimeInterval = 3.0f;// 自定义轮播时间间隔

}
@end

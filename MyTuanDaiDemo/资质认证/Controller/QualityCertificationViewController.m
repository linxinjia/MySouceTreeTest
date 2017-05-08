//
//  QualityCertificationViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/2/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "QualityCertificationViewController.h"
#import "QualityCertificationView.h"

@interface QualityCertificationViewController ()
{
    CGSize size;
}
@property (nonatomic ,strong)QualityCertificationView *qualityCertificationView;
@end

@implementation QualityCertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:244/255.0 alpha:1];
    size = [UIScreen mainScreen].bounds.size;
    
    _qualityCertificationView = [[QualityCertificationView alloc]initWithFrame:CGRectMake(0, 64, size.width, size.height-64)];
    [self.view addSubview:_qualityCertificationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

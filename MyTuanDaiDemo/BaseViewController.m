//
//  BaseViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)openView:(UIViewController *)viewController{
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

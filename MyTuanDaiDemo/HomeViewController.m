//
//  HomeViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HomeViewController.h"
#import "MyHomeView.h"
#import "SDCycleScrollView.h"
//#import "TAPageControl.h"
#import "MJRefresh.h"
#import "CloseLimitAdvertiseView.h"
#import "QualityCertificationViewController.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate>
{
    CGSize size;
}
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic ,strong)MyHomeView *homeView;
@property (nonatomic,strong)SDCycleScrollView *cycleScrollView;//轮播图
@property (nonatomic,strong)NSArray *array;//轮播图资源

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    size = [UIScreen mainScreen].bounds.size;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_message"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(lookForMessage)];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_signin"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(toSignIn)];

    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightitem;
    
    [self initView];
    [self initLogic];
    
    
    
    
    
}



- (void)initView{
    _scrollView = [UIScrollView new];
    _scrollView.clipsToBounds = YES;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    _scrollView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadTuandaiData)];
    _scrollView.translatesAutoresizingMaskIntoConstraints =NO;
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_scrollView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeading
                                             multiplier:1.0f
                                               constant:0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_scrollView
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTrailing
                                             multiplier:1.0f
                                               constant:0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_scrollView
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:64];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_scrollView
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:-50];
    [self.view addConstraint:constraint];
    
    
    
    
    
//    _scrollView.contentSize = CGSizeMake(375, 553);
    
    
    CGFloat height;
    if (size.height < 667) {
        height = 667-64-50-50;
    }else{
        height = size.height-64-50;
    }
    
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:view];
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_scrollView
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0]];
    [_scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [_scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(height)]|" options:0 metrics:@{@"height":[NSNumber numberWithFloat:height]} views:NSDictionaryOfVariableBindings(view)]];
    
    
    
    
    
    
    
    
    
    
    _cycleScrollView = [SDCycleScrollView new];
    _cycleScrollView.delegate = self;
    [view addSubview:_cycleScrollView];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.autoScrollTimeInterval = 5.0f;
    _cycleScrollView.localizationImagesGroup = @[[UIImage imageNamed:@"image_cfinancing"],[UIImage imageNamed:@"image_1218"],[UIImage imageNamed:@"image_security"],[UIImage imageNamed:@"icon_spokesman"]];
    _cycleScrollView.translatesAutoresizingMaskIntoConstraints =NO;
//    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_cycleScrollView
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:0];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_cycleScrollView
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_cycleScrollView
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0f
                                               constant:0];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_cycleScrollView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:0.35f
                                               constant:0];
    [view addConstraint:constraint];
    
    
    

    
    _homeView = [MyHomeView new];
    _homeView.clipsToBounds = YES;
    _homeView.backgroundColor = [UIColor whiteColor];
    [view addSubview:_homeView];
    _homeView.translatesAutoresizingMaskIntoConstraints =NO;
//    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_homeView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeLeading
                                             multiplier:1.0f
                                               constant:0];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_homeView
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0f
                                               constant:0];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_homeView
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_cycleScrollView
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:0];
    [view addConstraint:constraint];
    
    
    constraint = [NSLayoutConstraint constraintWithItem:_homeView
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:view
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:0];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:_homeView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [view addConstraint:constraint];
}



- (void)initLogic{
    UITapGestureRecognizer *gesture0 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedSelfty)];
    _homeView.selftyImage.userInteractionEnabled = YES;
    [_homeView.selftyImage addGestureRecognizer:gesture0];
    UITapGestureRecognizer *gesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedSelfty)];
    _homeView.selftyLabel.userInteractionEnabled = YES;
    [_homeView.selftyLabel addGestureRecognizer:gesture1];
    
    UITapGestureRecognizer *gesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(welfareSelfty)];
    _homeView.welfareImage.userInteractionEnabled = YES;
    [_homeView.welfareImage addGestureRecognizer:gesture2];
    UITapGestureRecognizer *gesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(welfareSelfty)];
    _homeView.welfareLabel.userInteractionEnabled = YES;
    [_homeView.welfareLabel addGestureRecognizer:gesture3];
    
    UITapGestureRecognizer *gesture4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dataSelfty)];
    _homeView.dataImage.userInteractionEnabled = YES;
    [_homeView.dataImage addGestureRecognizer:gesture4];
    UITapGestureRecognizer *gesture5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dataSelfty)];
    _homeView.dataLabel.userInteractionEnabled = YES;
    [_homeView.dataLabel addGestureRecognizer:gesture5];
    
    [_homeView.intrestGrowthButton addTarget:self action:@selector(toIntrestGrowth) forControlEvents:UIControlEventTouchDown];
}

- (void)reloadTuandaiData{
    [_scrollView.header endRefreshing];
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    UIViewController *viewcontroller = [UIViewController new];
    viewcontroller.view.backgroundColor = [UIColor whiteColor];
    viewcontroller.title = [NSString stringWithFormat:@"活动%ld",(long)index+1];
    [self openView:viewcontroller];
}

- (void)lookForMessage{
    UIViewController *viewcontroller = [UIViewController new];
    viewcontroller.view.backgroundColor = [UIColor whiteColor];
    viewcontroller.title = @"消息中心";
    [self openView:viewcontroller];
}

- (void)toSignIn{
    UIViewController *viewcontroller = [UIViewController new];
    viewcontroller.view.backgroundColor = [UIColor whiteColor];
    [self openView:viewcontroller];
}

- (void)clickedSelfty{
//    UIViewController *viewcontroller = [UIViewController new];
//    viewcontroller.view.backgroundColor = [UIColor whiteColor];
//    viewcontroller.title = @"安全保障";
//    [self openView:viewcontroller];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
    QualityCertificationViewController *qualityCertificationVC = [QualityCertificationViewController new];
    [self openView:qualityCertificationVC];
    
    
    
//    CloseLimitAdvertiseView *closeLimitAdvertiseView = [CloseLimitAdvertiseView new];
//    [self.view addSubview:closeLimitAdvertiseView];
//    closeLimitAdvertiseView.frame = [UIScreen mainScreen].bounds;
}

- (void)welfareSelfty{
    UIViewController *viewcontroller = [UIViewController new];
    viewcontroller.view.backgroundColor = [UIColor whiteColor];
    viewcontroller.title = @"新手福利";
    [self openView:viewcontroller];
}

- (void)dataSelfty{
    UIViewController *viewcontroller = [UIViewController new];
    viewcontroller.view.backgroundColor = [UIColor whiteColor];
    viewcontroller.title = @"团贷数据";
    [self openView:viewcontroller];
}

- (void)toIntrestGrowth{
    UIViewController *viewcontroller = [UIViewController new];
    viewcontroller.view.backgroundColor = [UIColor whiteColor];
    viewcontroller.title = @"新手专享";
    [self openView:viewcontroller];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

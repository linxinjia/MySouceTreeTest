//
//  MineViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MineViewController.h"
#import "POP.h"

@interface MineViewController ()
{
    CGFloat scaleFloat;
}
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIView *showView;

@property (nonatomic, strong)CALayer *myLayer;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scaleFloat = 2;
    
    
    [self mySpringAnimation];
    [self myDecayAnimation];
}

#pragma mark - 衰减动画
- (void)myDecayAnimation
{
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    self.button.backgroundColor = [UIColor redColor];
    self.button.layer.cornerRadius = 50;
    self.button.layer.masksToBounds = YES;
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 初始化拖拽手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.button addGestureRecognizer:panGesture];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self.button.layer pop_removeAllAnimations];
    }
    
    // 获取拖拽点
    CGPoint translation = [recognizer translationInView:self.view];
    // 实现拖拽移动
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    // 恢复坐标系
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
    // 判断手势停止时，执行代码
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"手势停止了");
        // 获取加速度值
        CGPoint velocity = [recognizer velocityInView:self.view];
        // 初始化POPDecay衰减动画
        POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        // 添加
        [recognizer.view.layer pop_addAnimation:decayAnimation forKey:nil];
    }
}

- (void)buttonAction:(UIButton *)button
{
    [self.button.layer pop_removeAllAnimations];
}

#pragma mark - 弹簧动画
- (void)mySpringAnimation
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.showView = [[UIView alloc] init];
    self.showView.frame = CGRectMake(200, 300, 40, 40);
    self.showView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.showView];
    
//    [self performSelector:@selector(startSpringAnimation) withObject:nil afterDelay:2.0f];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startSpringAnimation)];
    [self.showView addGestureRecognizer:tapGesture];
}

- (void)startSpringAnimation
{
    // 初始化SpringAnimation动画
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    sizeAnimation.springSpeed = 0.f;    // 动画的速度
    
    
    if (_showView.bounds.size.width <= 40) {
        scaleFloat = 1.5;
    }else if(_showView.bounds.size.width*2 >= self.view.bounds.size.width){
        scaleFloat = 0.66;
    }
    
    sizeAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, _showView.bounds.size.width*scaleFloat, _showView.bounds.size.height*scaleFloat)];
    
    // 添加动画
    [self.showView pop_addAnimation:sizeAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

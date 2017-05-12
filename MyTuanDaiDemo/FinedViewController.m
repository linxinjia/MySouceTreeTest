//
//  FinedViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "FinedViewController.h"
#import "pop/POP.h"

@interface FinedViewController ()
//POP动画引擎的动画效果非常流畅，因为它使用了CADisplayLink来刷新画面（帧）
@property (nonatomic, strong)CALayer *normalLayer;
@property (nonatomic, strong)CALayer *poplayer;

@end

@implementation FinedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[UIImage imageNamed:@"image_cfinancing"]];
    [array addObject:[UIImage imageNamed:@"image_security"]];
    view.animationImages = array;
    [self.view addSubview:view];
//    [view startAnimating];
    
    [self accessNormalLayer];
    [self accessPopLayer];
}

#pragma mark - 处理popLayer
- (void)accessPopLayer
{
    self.poplayer = [CALayer layer];
    self.poplayer.frame = CGRectMake(100, 100, 100, 100);
    self.poplayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:self.poplayer];
    
    POPBasicAnimation *popAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    popAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100+150, 500)];
    popAnimation.duration = 4.5f;
    popAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.poplayer pop_addAnimation:popAnimation forKey:nil];
    
    [self performSelector:@selector(removePopAnimation) withObject:nil afterDelay:1.5f];
}

#pragma mark - 处理normalLayer
- (void)accessNormalLayer
{
    self.normalLayer = [CALayer layer];
    self.normalLayer.frame = CGRectMake(100, 100, 100, 100);
    self.normalLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.normalLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue = [NSValue valueWithCGPoint:self.normalLayer.position];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100+150, 500)];
    basicAnimation.duration = 4.f;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    // 设置结束位置的值
    self.normalLayer.position = CGPointMake(100+150, 500);
    [self.normalLayer addAnimation:basicAnimation forKey:nil];
    
    // 1.5秒后移除动画
    [self performSelector:@selector(removeNormalAnimation) withObject:nil afterDelay:4.0f];
}

#pragma mark - 移除pop动画
- (void)removePopAnimation
{
    [self.poplayer pop_removeAllAnimations];
}

#pragma mark - 移除普通动画效果
- (void)removeNormalAnimation
{
    CALayer *layer = self.normalLayer.presentationLayer;
    NSLog(@"%@",NSStringFromCGRect(self.normalLayer.frame));
    NSLog(@"%@",NSStringFromCGRect(layer.frame));
    
    [self.normalLayer removeAllAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

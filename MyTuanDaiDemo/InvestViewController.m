//
//  InvestViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "InvestViewController.h"

@interface InvestViewController ()

@property (nonatomic ,strong) CADisplayLink *displayLink;
@property (nonatomic) NSInteger count;
@end

@implementation InvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayLink =[CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkEvent:)];
    
    [self performSelector:@selector(eventOne) withObject:nil afterDelay:1.f];
    [self performSelector:@selector(eventTwo) withObject:nil afterDelay:2.f];
}

#pragma mark displayLink Event
- (void)displayLinkEvent:(id)object
{
    self.count ++;
    NSLog(@"count = %ld",self.count);
}

- (void)eventOne
{
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)eventTwo
{
    [self.displayLink invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

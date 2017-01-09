//
//  MyHomeView.m
//  NSLayout
//
//  Created by Apple on 16/12/8.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MyHomeView.h"

@interface MyHomeView()
{
    CGSize size;
}

@end
@implementation MyHomeView

- (id)copyWithZone:(NSZone *)zone
{
    MyHomeView *newObj = [[self class]allocWithZone:zone];
    newObj.selftyImage = self.selftyImage;
    return newObj;
}

- (instancetype)init{
    if (self = [super init]) {
        size = [UIScreen mainScreen].bounds.size;
        [self myLayout2];//上半部分
        [self myLayout4];//下半部分
    }
    return self;
}


- (void)myLayout2{
    _selftyImage = [UIImageView new];
    _selftyImage.userInteractionEnabled = YES;
    _selftyImage.image = [UIImage imageNamed:@"Icon_safety"];
    _selftyImage.backgroundColor = [UIColor whiteColor];
    _selftyImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_selftyImage];
    _selftyImage.translatesAutoresizingMaskIntoConstraints =NO;
    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_selftyImage
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_selftyImage
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1/3.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_selftyImage
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:35];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_selftyImage
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_selftyImage
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    
    _selftyLabel = [UILabel new];
    _selftyLabel.backgroundColor = [UIColor whiteColor];
    _selftyLabel.text = @"安全保障";
    _selftyLabel.font = [UIFont systemFontOfSize:15.0];
    _selftyLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_selftyLabel];
    _selftyLabel.translatesAutoresizingMaskIntoConstraints =NO;
    //    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_selftyLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_selftyImage
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_selftyLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_selftyImage
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_selftyLabel
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:100];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_selftyLabel
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:20];
    [self addConstraint:constraint];
    
    
    
    
    
    //新手福利
    _welfareImage = [UIImageView new];
    _welfareImage.image = [UIImage imageNamed:@"icon_welfare"];
    _welfareImage.backgroundColor = [UIColor whiteColor];
    _welfareImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_welfareImage];
    _welfareImage.translatesAutoresizingMaskIntoConstraints =NO;
    //    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_welfareImage
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_welfareImage
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_welfareImage
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:35];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_welfareImage
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_welfareImage
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    _welfareLabel = [UILabel new];
    _welfareLabel.backgroundColor = [UIColor whiteColor];
    _welfareLabel.text = @"新手福利";
    _welfareLabel.font = [UIFont systemFontOfSize:15.0];
    _welfareLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_welfareLabel];
    _welfareLabel.translatesAutoresizingMaskIntoConstraints =NO;
    //    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_welfareLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_welfareImage
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_welfareLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_welfareImage
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_welfareLabel
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:100];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_welfareLabel
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:20];
    [self addConstraint:constraint];
    
    
    
    
    //团代数据
    _dataImage = [UIImageView new];
    _dataImage.image = [UIImage imageNamed:@"icon_data"];
    _dataImage.backgroundColor = [UIColor whiteColor];
    _dataImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_dataImage];
    _dataImage.translatesAutoresizingMaskIntoConstraints =NO;
    //    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_dataImage
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dataImage
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:5/3.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dataImage
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:35];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dataImage
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_dataImage
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    _dataLabel = [UILabel new];
    _dataLabel.backgroundColor = [UIColor whiteColor];
    _dataLabel.text = @"团代数据";
    _dataLabel.font = [UIFont systemFontOfSize:15.0];
    _dataLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_dataLabel];
    _dataLabel.translatesAutoresizingMaskIntoConstraints =NO;
    //    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_dataLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_dataImage
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dataLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_dataImage
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dataLabel
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:100];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dataLabel
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:20];
    [self addConstraint:constraint];
    
    
    _grayLabel = [UILabel new];
    _grayLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:240/255.0 alpha:1];
    [self addSubview:_grayLabel];
    
    _grayLabel.translatesAutoresizingMaskIntoConstraints =NO;
    //    NSLayoutConstraint *constraint = nil;
    constraint = [NSLayoutConstraint constraintWithItem:_grayLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_selftyLabel
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:15];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_grayLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_grayLabel
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0f
                                               constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_grayLabel
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:0
                                             multiplier:1.0f
                                               constant:10];
    [self addConstraint:constraint];
}

- (void)myLayout4{
/*  H:|-20-[label(100@1000)]
    V:|-100-[label(100)]
    H:|-100-[textView]-100-|
    前面的H代表是水平的布局还是垂直的布局，H代表水平，V表示垂直，|表示父视图的边沿，-20-表示距离20px，[]内是要布局摆放的视图对象名，()中是约束的尺寸，H下则为宽度，V下则为高度,@后面的数字代表优先级。*/
    
    _intrestGrowth = [UIImageView new];
    [self addSubview:_intrestGrowth];
    _intrestGrowth.image = [UIImage imageNamed:@"icon_welfare2"];
    _intrestGrowth.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_intrestGrowth(80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowth)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_intrestGrowth(27)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowth)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowth attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_grayLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    
    
    _intrestGrowth2 = [UILabel new];
    [self addSubview:_intrestGrowth2];
    _intrestGrowth2.text = @"新手专享";
    _intrestGrowth2.font = [UIFont systemFontOfSize:15.0f];
    _intrestGrowth2.textAlignment = NSTextAlignmentCenter;
    _intrestGrowth2.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_intrestGrowth2(80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowth2)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_intrestGrowth2(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowth2)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowth2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_grayLabel attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowth2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_intrestGrowth attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];

    
    _intrestGrowth3 = [UILabel new];
    [self addSubview:_intrestGrowth3];
    _intrestGrowth3.text = @"新手专享";
    _intrestGrowth3.textColor = [UIColor orangeColor];
    _intrestGrowth3.textAlignment = NSTextAlignmentCenter;
    _intrestGrowth3.font = [UIFont systemFontOfSize:10.0f];
    _intrestGrowth3.layer.borderColor = [UIColor orangeColor].CGColor;
    _intrestGrowth3.layer.borderWidth = 0.5f;
    _intrestGrowth3.layer.cornerRadius = 10.0f;
    _intrestGrowth3.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_intrestGrowth3(60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowth3)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_intrestGrowth3(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowth3)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowth3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_grayLabel attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowth3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_intrestGrowth2 attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10]];
    
    
    _safeLabel = [UILabel new];
    [self addSubview:_safeLabel];
    _safeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _safeLabel.backgroundColor = [UIColor whiteColor];
    _safeLabel.text = @"个人资产由银行级别风控体系保障";
    _safeLabel.textColor = [UIColor grayColor];
    _safeLabel.font = [UIFont systemFontOfSize:12.0f];
    _safeLabel.textAlignment = NSTextAlignmentCenter;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_safeLabel(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_safeLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_safeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_safeLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-5]];
    
    
    _safeImage = [UIImageView new];
    [self addSubview:_safeImage];
    _safeImage.translatesAutoresizingMaskIntoConstraints = NO;
    _safeImage.image = [UIImage imageNamed:@"icon_safety2"];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_safeImage(17)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_safeImage)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_safeImage(17)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_safeImage)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_safeImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_safeLabel attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_safeImage attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_safeLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    
    
    _panicBuyBottom = [UILabel new];
    [self addSubview:_panicBuyBottom];
    _panicBuyBottom.translatesAutoresizingMaskIntoConstraints = NO;
    _panicBuyBottom.backgroundColor = [UIColor colorWithRed:251/255.0 green:208/255.0 blue:30/255.0 alpha:1];
    _panicBuyBottom.text = @"\n\n已加入282人";
    _panicBuyBottom.numberOfLines = 0;
    _panicBuyBottom.textColor = [UIColor whiteColor];
    _panicBuyBottom.font = [UIFont systemFontOfSize:10.0f];
    _panicBuyBottom.textAlignment = NSTextAlignmentCenter;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_panicBuyBottom]-30-|" options:0 metrics:nil  views:NSDictionaryOfVariableBindings(_panicBuyBottom)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_panicBuyBottom(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_panicBuyBottom)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_panicBuyBottom attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_safeLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:-20]];
    
    
    _panicBuyLabel = [UILabel new];
    [self addSubview:_panicBuyLabel];
    _panicBuyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _panicBuyLabel.text = @"立即抢购";
    _panicBuyLabel.textColor = [UIColor whiteColor];
    _panicBuyLabel.font = [UIFont systemFontOfSize:15.0f];
    _panicBuyLabel.textAlignment = NSTextAlignmentCenter;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_panicBuyLabel(80)]" options:0 metrics:nil  views:NSDictionaryOfVariableBindings(_panicBuyLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_panicBuyLabel(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_panicBuyLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_panicBuyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeTop multiplier:1.0f constant:3]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_panicBuyLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    
    
    _line = [UILabel new];
    [self addSubview:_line];
    _line.translatesAutoresizingMaskIntoConstraints = NO;
    _line.backgroundColor = [UIColor lightGrayColor];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[_line(0.5)]" options:0 metrics:@{@"left":[NSNumber numberWithFloat:size.width*0.26]} views:NSDictionaryOfVariableBindings(_line)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_line(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_line)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeTop multiplier:1.0f constant:-15]];
    
    
    _line2 = [UILabel new];
    [self addSubview:_line2];
    _line2.translatesAutoresizingMaskIntoConstraints = NO;
    _line2.backgroundColor = [UIColor lightGrayColor];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[_line2(0.5)]" options:0 metrics:@{@"left":[NSNumber numberWithFloat:size.width*0.66]} views:NSDictionaryOfVariableBindings(_line2)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_line2(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_line2)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_line2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeTop multiplier:1.0f constant:-15]];
    
    
    
    
    
    
    _duration = [UILabel new];
    [self addSubview:_duration];
    _duration.text = @"3个月";
    _duration.font = [UIFont systemFontOfSize:15.0f];
    _duration.textAlignment = NSTextAlignmentCenter;
    _duration.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_duration]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_duration)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_duration(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_duration)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_duration attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeTop multiplier:1.0f constant:-15]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_duration attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_line attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];

    
    _remainingBalance = [UILabel new];
    [self addSubview:_remainingBalance];
    _remainingBalance.text = @"剩余133.43万元";
    _remainingBalance.font = [UIFont systemFontOfSize:15.0f];
    _remainingBalance.textAlignment = NSTextAlignmentCenter;
    _remainingBalance.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_remainingBalance(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_remainingBalance)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_remainingBalance attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeTop multiplier:1.0f constant:-15]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_remainingBalance attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_line2 attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_remainingBalance attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_line attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
    
    
    _floorPrice = [UILabel new];
    [self addSubview:_floorPrice];
    _floorPrice.text = @"100元起购";
    _floorPrice.font = [UIFont systemFontOfSize:15.0f];
    _floorPrice.textAlignment = NSTextAlignmentCenter;
    _floorPrice.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_floorPrice]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_floorPrice)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_floorPrice(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_floorPrice)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_floorPrice attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_panicBuyBottom attribute:NSLayoutAttributeTop multiplier:1.0f constant:-15]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_floorPrice attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_line2 attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
    
    
    _intrestGrowthCount = [UILabel new];
    [self addSubview:_intrestGrowthCount];
    _intrestGrowthCount.backgroundColor = [UIColor whiteColor];
    _intrestGrowthCount.text = @"13";
    _intrestGrowthCount.textColor = [UIColor colorWithRed:243/255.0f green:104/255.0f blue:24/255.0f alpha:1];
    _intrestGrowthCount.font = [UIFont systemFontOfSize:60.0f];
    _intrestGrowthCount.textAlignment = NSTextAlignmentRight;
    _intrestGrowthCount.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_intrestGrowthCount(80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowthCount)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowthCount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_intrestGrowth3 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:-15]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowthCount attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_intrestGrowth3 attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowthCount attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_duration attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
    
    
    
    _percent = [UILabel new];
    [self addSubview:_percent];
    _percent.backgroundColor = [UIColor whiteColor];
    _percent.text = @"%";
    _percent.textColor = [UIColor colorWithRed:243/255.0f green:104/255.0f blue:24/255.0f alpha:1];
    _percent.font = [UIFont systemFontOfSize:30.0f];
    _percent.textAlignment = NSTextAlignmentRight;
    _percent.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_percent(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_percent)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_percent attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_intrestGrowthCount attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:11]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_percent attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_intrestGrowthCount attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
    
    
    
    
    _intrestGrowthButton = [UIButton new];
    [self addSubview:_intrestGrowthButton];
    _intrestGrowthButton.backgroundColor = [UIColor clearColor];
    _intrestGrowthButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_intrestGrowthButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowthButton)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_intrestGrowthButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_intrestGrowthButton)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_intrestGrowthButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_grayLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
}

@end

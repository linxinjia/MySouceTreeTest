//
//  ZhuanHuaHuaView.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/2/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CloseLimitAdvertiseView.h"

@interface CloseLimitAdvertiseView()
{
    CGSize size;
}

@end
@implementation CloseLimitAdvertiseView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        size = [UIScreen mainScreen].bounds.size;
        
        [self mylayout];
    }
    return self;
}

- (void)mylayout
{
    _backGroundview = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _backGroundview.backgroundColor = [UIColor lightGrayColor];
    _backGroundview.alpha = 0.4;
    [self addSubview:_backGroundview];
    
    _bottomView = [UIView new];
    [self addSubview:_bottomView];
    _bottomView.backgroundColor = [UIColor whiteColor];
    _bottomView.layer.cornerRadius = 15;
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[_bottomView]-25-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomView(310.5)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];

    
    _iconImage = [UIImageView new];
    [self addSubview:_iconImage];
    _iconImage.backgroundColor = [UIColor clearColor];
    _iconImage.image = [UIImage imageNamed:@"icon_ios10"];
    _iconImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_iconImage(60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_iconImage)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_iconImage(60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_iconImage)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_iconImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_iconImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-30]];

    
    _title = [UILabel new];
    [self addSubview:_title];
    _title.text = @"致ios10用户";
    _title.font = [UIFont systemFontOfSize:19.0f];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_title(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_title)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_iconImage attribute:NSLayoutAttributeBottom multiplier:1.0f constant:30]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
    
    
    _subTitle = [UILabel new];
    [self addSubview:_subTitle];
    _subTitle.text = @"您还有最后一步设置即可进入赚花花";
    _subTitle.textColor = [UIColor darkGrayColor];
    _subTitle.font = [UIFont systemFontOfSize:14.0f];
    _subTitle.textAlignment = NSTextAlignmentCenter;
    _subTitle.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_subTitle(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_subTitle)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_subTitle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_title attribute:NSLayoutAttributeBottom multiplier:1.0f constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_subTitle attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_subTitle attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
    
    
    _first = [UILabel new];
    [self addSubview:_first];
    _first.text = @"1.";
    _first.textColor = [UIColor darkGrayColor];
    _first.font = [UIFont systemFontOfSize:14.0f];
    _first.textAlignment = NSTextAlignmentLeft;
    _first.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_first(10)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_first)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_first(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_first)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_first attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_subTitle attribute:NSLayoutAttributeBottom multiplier:1.0f constant:20]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_first attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:(size.width-50-130)/2]];

    
    _firstImage = [UIImageView new];
    [self addSubview:_firstImage];
    _firstImage.backgroundColor = [UIColor clearColor];
    _firstImage.image = [UIImage imageNamed:@"icon_set"];
    _firstImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_firstImage(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_firstImage)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_firstImage(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_firstImage)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_firstImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_firstImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeRight multiplier:1.0f constant:5]];

    
    _firstStep = [UILabel new];
    [self addSubview:_firstStep];
    _firstStep.text = @"进入'设置'";
    _firstStep.textColor = [UIColor darkGrayColor];
    _firstStep.font = [UIFont systemFontOfSize:14.0f];
    _firstStep.textAlignment = NSTextAlignmentLeft;
    _firstStep.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_firstStep]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_firstStep)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_firstStep(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_firstStep)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_firstStep attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_firstStep attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_firstImage attribute:NSLayoutAttributeRight multiplier:1.0f constant:5]];
    
    
    _Second = [UILabel new];
    [self addSubview:_Second];
    _Second.text = @"2.";
    _Second.textColor = [UIColor darkGrayColor];
    _Second.font = [UIFont systemFontOfSize:14.0f];
    _Second.textAlignment = NSTextAlignmentLeft;
    _Second.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_Second(10)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_Second)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_Second(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_Second)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_Second attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_Second attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    
    
    _secondImage = [UIImageView new];
    [self addSubview:_secondImage];
    _secondImage.backgroundColor = [UIColor clearColor];
    _secondImage.image = [UIImage imageNamed:@"icon_privacy"];
    _secondImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_secondImage(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_secondImage)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_secondImage(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_secondImage)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_secondImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_Second attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_secondImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_Second attribute:NSLayoutAttributeRight multiplier:1.0f constant:5]];
    
    
    _SecondStep = [UILabel new];
    [self addSubview:_SecondStep];
    _SecondStep.text = @"选择'隐私'";
    _SecondStep.textColor = [UIColor darkGrayColor];
    _SecondStep.font = [UIFont systemFontOfSize:14.0f];
    _SecondStep.textAlignment = NSTextAlignmentLeft;
    _SecondStep.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_SecondStep]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_SecondStep)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_SecondStep(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_SecondStep)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_SecondStep attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_Second attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_SecondStep attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_secondImage attribute:NSLayoutAttributeRight multiplier:1.0f constant:5]];
    
    
    _thirdStep = [UILabel new];
    [self addSubview:_thirdStep];
    _thirdStep.text = @"3.进入'广告'";
    _thirdStep.textColor = [UIColor darkGrayColor];
    _thirdStep.font = [UIFont systemFontOfSize:14.0f];
    _thirdStep.textAlignment = NSTextAlignmentLeft;
    _thirdStep.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_thirdStep]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_thirdStep)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_thirdStep(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_thirdStep)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_thirdStep attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_Second attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_thirdStep attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    
    
    _fourthStep = [UILabel new];
    [self addSubview:_fourthStep];
    _fourthStep.backgroundColor = [UIColor clearColor];
    _fourthStep.text = @"4.关闭'限制广告跟踪'";
    _fourthStep.textColor = [UIColor darkGrayColor];
    _fourthStep.font = [UIFont systemFontOfSize:14.0f];
    _fourthStep.textAlignment = NSTextAlignmentLeft;
    _fourthStep.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_fourthStep]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_fourthStep)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_fourthStep(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_fourthStep)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_fourthStep attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_thirdStep attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_fourthStep attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_first attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    
    
    _line = [UILabel new];
    [self addSubview:_line];
    _line.backgroundColor = [UIColor lightGrayColor];
    _line.alpha = 0.3;
    _line.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_line(1)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_line)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-45]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_line attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_line attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];


    _setUpSuccess = [UIButton new];
    [self addSubview:_setUpSuccess];
    [_setUpSuccess setTitle:@"设置成功" forState:UIControlStateNormal];
    [_setUpSuccess setTitleColor:[UIColor colorWithRed:246/255.0 green:0 blue:26/255.0 alpha:1] forState:UIControlStateNormal];
    [_setUpSuccess setFont:[UIFont systemFontOfSize:16.0f]];
    _setUpSuccess.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_setUpSuccess attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_line attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_setUpSuccess attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_setUpSuccess attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_setUpSuccess attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
}
@end

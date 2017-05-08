//
//  QualityCertificationView.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/2/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "QualityCertificationView.h"


@interface QualityCertificationView()
{
    CGSize size;
}
@end

@implementation QualityCertificationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        size = [UIScreen mainScreen].bounds.size;
        self.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:244/255.0 alpha:1];
        [self myLayout];
    }
    return self;
}

- (void)myLayout
{
    CGFloat height = (size.width-15*2)*0.38;
    CGFloat width = size.width-15*2;
    
    _bottomView = [UIView new];
    [self addSubview:_bottomView];
    _bottomView.backgroundColor = [UIColor whiteColor];
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_bottomView]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_bottomView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0f constant:height]];
    
    
    _bottomView2 = [UIView new];
    [self addSubview:_bottomView2];
    _bottomView2.backgroundColor = [UIColor whiteColor];
    _bottomView2.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_bottomView2]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomView2)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomView2]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomView2)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0f constant:height]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomView2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:30]];

    
    
    _studentsImage = [UIImageView new];
    [self addSubview:_studentsImage];
    _studentsImage.image = [UIImage imageNamed:@"mine_selected"];
    _studentsImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:width*0.16]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeTop multiplier:1.0f constant:height*0.2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-height*0.2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_studentsImage attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0]];

    
    
    _employeimage = [UIImageView new];
    [self addSubview:_employeimage];
    _employeimage.image = [UIImage imageNamed:@"mine_selected"];
    _employeimage.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeimage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeLeft multiplier:1.0f constant:width*0.16]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeimage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeTop multiplier:1.0f constant:height*0.2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeimage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-height*0.2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeimage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_employeimage attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0]];
    
    
    _studentlabel = [UILabel new];
    [self addSubview:_studentlabel];
    _studentlabel.text = @"在校学生";
    _studentlabel.textColor = [UIColor darkGrayColor];
    _studentlabel.font = [UIFont systemFontOfSize:20.0f];
    _studentlabel.textAlignment = NSTextAlignmentLeft;
    _studentlabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_studentlabel]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_studentlabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_studentlabel(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_studentlabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentlabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_studentsImage attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentlabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_studentsImage attribute:NSLayoutAttributeRight multiplier:1.0f constant:30]];
    
    
    _employelabe = [UILabel new];
    [self addSubview:_employelabe];
    _employelabe.text = @"有业人事";
    _employelabe.textColor = [UIColor darkGrayColor];
    _employelabe.font = [UIFont systemFontOfSize:20.0f];
    _employelabe.textAlignment = NSTextAlignmentLeft;
    _employelabe.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_employelabe]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_employelabe)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_employelabe(20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_employelabe)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employelabe attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_employeimage attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employelabe attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_employeimage attribute:NSLayoutAttributeRight multiplier:1.0f constant:30]];
    
    
    _studentsButton = [UIButton new];
    [self addSubview:_studentsButton];
    _studentsButton.backgroundColor = [UIColor clearColor];
    _studentsButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_studentsButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_bottomView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];

    
    _employeButton = [UIButton new];
    [self addSubview:_employeButton];
    _employeButton.backgroundColor = [UIColor clearColor];
    _employeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_employeButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_bottomView2 attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
}
@end

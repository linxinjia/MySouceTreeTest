//
//  ZhuanHuaHuaView.h
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/2/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CloseLimitAdvertiseView : UIView

@property (nonatomic ,strong) UIView *backGroundview;
@property (nonatomic ,strong) UIView *bottomView;

@property (nonatomic ,strong) UIImageView *iconImage;
@property (nonatomic ,strong) UILabel *title;
@property (nonatomic ,strong) UILabel *subTitle;

@property (nonatomic ,strong) UILabel *first;
@property (nonatomic ,strong) UIImageView *firstImage;
@property (nonatomic ,strong) UILabel *firstStep;
@property (nonatomic ,strong) UILabel *Second;
@property (nonatomic ,strong) UIImageView *secondImage;
@property (nonatomic ,strong) UILabel *SecondStep;
@property (nonatomic ,strong) UILabel *thirdStep;
@property (nonatomic ,strong) UILabel *fourthStep;

@property (nonatomic ,strong) UILabel *line;
@property (nonatomic ,strong) UIButton *setUpSuccess;
@end

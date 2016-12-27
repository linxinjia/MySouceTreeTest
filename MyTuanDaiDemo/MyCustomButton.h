//
//  MyCustomButton.h
//  NSLayout
//
//  Created by Apple on 16/12/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义button样式
@interface MyCustomButton : UIButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect;
- (CGRect)imageRectForContentRect:(CGRect)contentRect;

@end

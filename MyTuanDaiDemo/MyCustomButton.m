//
//  MyCustomButton.m
//  NSLayout
//
//  Created by Apple on 16/12/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MyCustomButton.h"

@implementation MyCustomButton

//样式为：图上文下  http://m.blog.csdn.net/article/details?id=51323336
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat interval = CGRectGetWidth(contentRect)/16.0;
    interval = MIN(interval, 6);
    
    //设置图片的宽高为button宽度的7/8 (或12);
    CGFloat imageW = CGRectGetWidth(contentRect) - 2 * interval;
    
    CGRect rect = CGRectMake(interval, interval, imageW, imageW);
    
    return rect;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat interval = CGRectGetWidth(contentRect)/16.0;
    interval = MIN(interval, 6);
    
    //设置图片的宽高为button宽度的7/8 (或12);
    CGFloat imageW = CGRectGetWidth(contentRect) - 2 * interval;
    
    CGRect rect = CGRectMake(0, interval*2 + imageW, CGRectGetWidth(contentRect) , CGRectGetHeight(contentRect) - 3*interval - imageW);
    
    return rect;
}


#if 0
//样式为：图右文左
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat inteval = CGRectGetHeight(contentRect)/8.0;
    
    //设置图片的宽高为button高度的3/4;
    CGFloat imageH = CGRectGetHeight(contentRect) - 2 * inteval;
    
    CGRect rect = CGRectMake(CGRectGetWidth(contentRect) - imageH - inteval, inteval, imageH, imageH);
    
    return rect;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat inteval = CGRectGetHeight(contentRect)/8.0;
    //设置图片的宽高为button高度的3/4;
    CGFloat imageH = CGRectGetHeight(contentRect) - 2 * inteval;
    
    CGRect rect = CGRectMake(inteval, inteval, CGRectGetWidth(contentRect) - imageH - 2*inteval, CGRectGetHeight(contentRect) - 2*inteval);
    
    return rect;
}
#endif
@end

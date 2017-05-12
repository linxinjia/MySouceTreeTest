//
//  TDImageViewController.h
//  TDImagePickerController
//
//  Created by linxinjia on 2017/4/27.
//  Copyright © 2017年 tuandaiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDPhotosManagerDelegate <NSObject>

- (void)getPhotosSuccess:(NSMutableArray *)photos;

@end

@interface TDPhotosManager : UIViewController

@property (nonatomic, weak) id<TDPhotosManagerDelegate> delegate;

//导航栏的背景颜色和文字颜色与controller保持一致 (默认为NO)
@property (nonatomic, assign) BOOL ifFitToNavigationBarColor;

/**
 实例化
 */
+ (TDPhotosManager *)shareInstance;

/**
 选择单张照片
 
 @param delegate 代理
 */
- (void)toSelectImageDelegate:(id<TDPhotosManagerDelegate>)delegate;

/**
 选择单张照片可裁剪,使用方形剪切 (查看大图时是展示剪切前的照片)
 
 @param delegate 代理
 @param alowCrop YES-允许剪切
 */
- (void)toSelectImageDelegate:(id<TDPhotosManagerDelegate>)delegate alowCrop:(BOOL)alowCrop;

/**
 选择单张照片可裁剪,使用圆形剪切 (查看大图时是展示剪切前的照片)
 
 @param delegate   代理
 @param alowCrop   YES-允许剪切
 @param circleCrop YES-使用圆形剪切框
 */
- (void)toSelectImageDelegate:(id<TDPhotosManagerDelegate>)delegate alowCrop:(BOOL)alowCrop circleCrop:(BOOL)circleCrop;

/**
 选择多张照片
 
 @param delegate       代理
 @param selectedPhotos 已选照片
 @param count          最多可选张数
 */
- (void)toSelectImagesDelegate:(id<TDPhotosManagerDelegate>)delegate selectedPhotos:(NSMutableArray *)selectedPhotos maxImagesCount:(NSInteger)count;

/**
 查看照片 (只能在选取照片后并查看时使用，不适用于其他图片查看)
 
 @param delegate 代理
 @param photos   照片
 @param index    查看位置
 */
- (void)checkPhotosDelegate:(id<TDPhotosManagerDelegate>)delegate photos:(NSMutableArray *)photos index:(NSInteger)index;

/**
 查看照片并可对照片进行删除操作 (只能在选取照片后并查看时使用，不适用于其他图片查看)
 
 @param delegate   代理
 @param photos     照片
 @param index      查看位置
 @param alowRemove YES-允许移除
 */
- (void)checkPhotosDelegate:(id<TDPhotosManagerDelegate>)delegate photos:(NSMutableArray *)photos index:(NSInteger)index alowRemove:(BOOL)alowRemove;

/**
 拍照
 
 @param controller 控制器
 */
- (void)takePhoto:(UIViewController *)controller;

@end

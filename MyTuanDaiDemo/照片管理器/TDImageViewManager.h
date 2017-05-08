//
//  TDImageViewController.h
//  TDImagePickerController
//
//  Created by linxinjia on 2017/4/27.
//  Copyright © 2017年 tuandaiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDImageViewManagerDelegate <NSObject>

- (void)takePhotoSuccess:(NSMutableArray *)photos;

@end


@interface TDImageViewManager : UIViewController

@property (nonatomic, weak) id<TDImageViewManagerDelegate> delegate;

+ (TDImageViewManager *)shareInstance;

/**
 选择单张照片
 
 @param controller 控制器
 */
- (void)toSelectImage:(UIViewController *)controller completion:(void (^)(NSArray<UIImage *> *photos))completion;


/**
 选择多张照片
 
 @param controller 控制器
 @param count 最多可选张数
 */
- (void)toSelectImages:(UIViewController *)controller maxImagesCount:(NSInteger)count completion:(void (^)(NSArray<UIImage *> *photos))completion;


/**
 查看照片,index表示图片开始显示位置 (这个方法只能用来查看照片类型的图，因为assets不能为空)
 
 @param photos 照片
 @param controller 控制器
 */
- (void)lookOverPhotos:(NSMutableArray *)photos index:(NSInteger)index controller:(UIViewController *)controller completion:(void (^)(NSArray<UIImage *> *photos))completion;


/**
 拍照
 
 @param controller 控制器
 */
- (void)takePhoto:(UIViewController *)controller;

@end

//
//  TDImageViewController.m
//  TDImagePickerController
//
//  Created by linxinjia on 2017/4/27.
//  Copyright © 2017年 tuandaiwang. All rights reserved.
//

#import "TDImageViewManager.h"
#import "TZImagePickerController.h"
#import <Photos/Photos.h>
#import "TZImageManager.h"

@interface TDImageViewManager ()<TZImagePickerControllerDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
}
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@end

@implementation TDImageViewManager

+ (TDImageViewManager *)shareInstance {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

/**
 选择单张照片
 
 @param controller 控制器
 */
- (void)toSelectImage:(UIViewController *)controller completion:(void (^)(NSArray<UIImage *> *photos))completion{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    imagePickerVc.showSelectBtn = NO;//单选模式下此设置才会有效
    imagePickerVc.allowTakePicture = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.didFinishPickingPhotosHandle = ^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"获取到照片");
        _selectedPhotos = [NSMutableArray arrayWithArray:photos];
        _selectedAssets = [NSMutableArray arrayWithArray:assets];
        if (completion) {
            completion(photos);
        }
    };
    [controller presentViewController:imagePickerVc animated:YES completion:nil];
}

/**
 选择多张照片
 
 @param controller 控制器
 @param count 最多可选张数
 */
- (void)toSelectImages:(UIViewController *)controller maxImagesCount:(NSInteger)count completion:(void (^)(NSArray<UIImage *> *photos))completion{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:count delegate:self];
    
    imagePickerVc.allowTakePicture = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.didFinishPickingPhotosHandle = ^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"获取到照片");
        _selectedPhotos = [NSMutableArray arrayWithArray:photos];
        _selectedAssets = [NSMutableArray arrayWithArray:assets];
        if (completion) {
            completion(photos);
        }
    };
    [controller presentViewController:imagePickerVc animated:YES completion:nil];
}



/**
 查看照片,index表示图片开始显示位置 (这个方法只能用来查看照片类型的图，因为assets不能为空)
 
 @param photos 照片
 @param controller 控制器
 */
- (void)lookOverPhotos:(NSMutableArray *)photos index:(NSInteger)index controller:(UIViewController *)controller completion:(void (^)(NSArray<UIImage *> *photos))completion{
    //判断照片数据是否在管理器外进行了删减或重新排序（如果是增加，管理器里面的数据也会相应增加，所以不用做处理）
    if (photos == nil || photos.count == 0) {
        NSLog(@"请选择有效的照片进行查看");
        return;
    }
    if (photos.count < _selectedPhotos.count) {
        NSMutableArray *assets = [NSMutableArray new];
        for (NSInteger j=0; j<photos.count; j++) {
            for (NSInteger i=0; i<_selectedPhotos.count; i++) {
                if ([photos[j] isEqual:_selectedPhotos[i]]) {
                    [assets addObject:_selectedAssets[i]];
                }
            }
        }
        if (assets == nil || assets.count == 0) {
            NSLog(@"请选择有效的照片进行查看");
            return;
        }else{
            _selectedAssets = assets;
        }
    }
    
    
    
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:photos index:index];
//    imagePickerVc.maxImagesCount = photos.count; //当这个参数大于1时可以在查看页面对照片进行勾选操作
    imagePickerVc.allowPickingOriginalPhoto = NO;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        _selectedPhotos = [NSMutableArray arrayWithArray:photos];
        _selectedAssets = [NSMutableArray arrayWithArray:assets];
        if (completion) {
            completion(photos);
        }
    }];
    [controller presentViewController:imagePickerVc animated:YES completion:nil];
}


#pragma mark - 相机
/**
 拍照
 
 @param controller 控制器
 */
- (void)takePhoto:(UIViewController *)controller{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) && iOS7Later) {
        // 无相机权限 做一个友好的提示
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.delegate = self;
        [alert show];
        
        // 拍照之前还需要检查相册权限
    } else if ([TZImageManager authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.tag = 1;
        [alert show];
    } else if ([TZImageManager authorizationStatus] == 0) { // 正在弹框询问用户是否允许访问相册，监听权限状态
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            return [self takePhoto];
        });
    } else { // 调用相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerVc.sourceType = sourceType;
            if(iOS8Later) {
                _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            }
            [controller presentViewController:_imagePickerVc animated:YES completion:nil];
        } else {
            NSLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        [tzImagePickerVc showProgressHUD];
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image completion:^(NSError *error){
            if (error) {
                [tzImagePickerVc hideProgressHUD];
                NSLog(@"图片保存失败 %@",error);
            } else {
                //获取相册中的第一张照片（最新拍摄的那张）
                [[TZImageManager manager] getCameraRollAlbum:NO allowPickingImage:YES completion:^(TZAlbumModel *model) {
                    
                    [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:NO allowPickingImage:YES completion:^(NSArray<TZAssetModel *> *models) {
                        
                        [tzImagePickerVc hideProgressHUD];
                        TZAssetModel *assetModel = [models firstObject];
                        if (tzImagePickerVc.sortAscendingByModificationDate) {
                            assetModel = [models lastObject];
                        }
                        
                        _selectedPhotos = [NSMutableArray arrayWithObject:image];
                        _selectedAssets = [NSMutableArray arrayWithObject:assetModel.asset];
                        //用代理方法把照片传回
                        [self.delegate takePhotoSuccess:[NSMutableArray arrayWithObject:image]];
                    }];
                }];
            }
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

//alert
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0){
    if (buttonIndex == 1) { // 去设置界面，开启相机访问权限
        if (iOS8Later) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        } else {
            NSURL *privacyUrl;
            if (alertView.tag == 1) {
                privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"];
            } else {
                privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
            }
            if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                [[UIApplication sharedApplication] openURL:privacyUrl];
            } else {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alert show];
            }
        }
    }
}

#pragma mark - TZImagePickerControllerDelegate
//- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
//    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
//    _selectedAssets = [NSMutableArray arrayWithArray:assets];
//}


#pragma mark - getters
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        
//        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
//        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}


@end

//
//  PhotoPickerViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/5/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "TDImageViewManager.h"

@interface PhotoPickerViewController ()<TDImageViewManagerDelegate>
{
    CGFloat _itemWH;
    CGFloat _margin;
    NSMutableArray *_selectedPhotos;
    //    NSMutableArray *_selectedAssets;
}
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@end

@implementation PhotoPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    _selectedPhotos = [NSMutableArray array];
    //    _selectedAssets = [NSMutableArray array];
    [self configView];
}
- (BOOL)prefersStatusBarHidden {
    return NO;
}


- (void)configView{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 70, 150, 50)];
    button.backgroundColor  = [UIColor lightGrayColor];
    button.tag = 1;
    [button setTitle:@"选择单张照片" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(50, 170, 150, 50)];
    button2.backgroundColor  = [UIColor lightGrayColor];
    button2.tag = 2;
    [button2 setTitle:@"选择多张照片" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(50, 270, 150, 50)];
    button3.backgroundColor  = [UIColor lightGrayColor];
    button3.tag = 3;
    [button3 setTitle:@"拍照" forState:UIControlStateNormal];
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(50, 370, 150, 50)];
    button4.backgroundColor  = [UIColor lightGrayColor];
    button4.tag = 4;
    [button4 setTitle:@"查看大图" forState:UIControlStateNormal];
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
}

- (void)buttonClicked:(UIButton *)button{
    
    switch (button.tag) {
        case 1:{
            [[TDImageViewManager shareInstance] toSelectImage:self completion:^(NSArray<UIImage *> *photos) {
                _selectedPhotos = [NSMutableArray arrayWithArray:photos];
                NSLog(@"获取到单张照片");
            }];
            break;
            
        }case 2:{
            [[TDImageViewManager shareInstance] toSelectImages:self maxImagesCount:10 completion:^(NSArray<UIImage *> *photos) {
                _selectedPhotos = [NSMutableArray arrayWithArray:photos];
                NSLog(@"获取到照片");
            }];
            break;
            
        }case 3:{
            TDImageViewManager *manager = [TDImageViewManager shareInstance];
            manager.delegate = self;
            [manager takePhoto:self];
            break;
            
        }case 4:{
            [[TDImageViewManager shareInstance] lookOverPhotos:_selectedPhotos index:0 controller:self completion:^(NSArray<UIImage *> *photos) {
                _selectedPhotos = [NSMutableArray arrayWithArray:photos];
            }];
            break;
        }
        default:
            break;
    }
}

#pragma mark - TDImageViewManagerDelegate
- (void)takePhotoSuccess:(NSMutableArray *)photos{
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    //    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    NSLog(@"拍照完成");
}

@end


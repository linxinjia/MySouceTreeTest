//
//  PhotoPickerViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/5/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "TDPhotosManager.h"

@interface PhotoPickerViewController ()<TDPhotosManagerDelegate>
{
    CGFloat _itemWH;
    CGFloat _margin;
    NSMutableArray *_selectedPhotos;
    
    UIImageView *imageView;
}
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@end

@implementation PhotoPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    _selectedPhotos = [NSMutableArray array];
    [self configView];
}

- (void)buttonClicked:(UIButton *)button{
    switch (button.tag) {
        case 0:{
            //            [TDPhotosManager shareInstance].ifFitToNavigationBarColor = YES;
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager toSelectImageDelegate:self];
            break;
            
        }case 1:{
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager toSelectImageDelegate:self alowCrop:YES];
            break;
            
        }case 2:{
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager toSelectImageDelegate:self alowCrop:YES circleCrop:YES];
            break;
            
        }case 3:{
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager toSelectImagesDelegate:self selectedPhotos:_selectedPhotos maxImagesCount:5];
            break;
            
        }case 4:{
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager takePhoto:self];
            break;
            
        }case 5:{
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager checkPhotosDelegate:self photos:_selectedPhotos index:0];
            break;
        }case 6:{
            TDPhotosManager *manager = [TDPhotosManager shareInstance];
            manager.delegate = self;
            [manager checkPhotosDelegate:self photos:_selectedPhotos index:0 alowRemove:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark - TDImageViewManagerDelegate
- (void)getPhotosSuccess:(NSMutableArray *)photos{
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    imageView.image = photos.count>0 ? photos[0] : nil;
    NSLog(@"获取到照片");
}

- (void)reverseBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)configView{
    CGFloat interval = 60;
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 100, 40)];
    [self.view addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"back_red"] forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 80)];
    [backButton addTarget:self action:@selector(reverseBack) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, interval, 150, 50)];
    button.backgroundColor  = [UIColor lightGrayColor];
    button.tag = 0;
    [button setTitle:@"选择单张照片" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(170, interval+10, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(10, interval*2, 150, 50)];
    button1.backgroundColor  = [UIColor lightGrayColor];
    button1.tag = 1;
    [button1 setTitle:@"单张照片可剪切" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(10, interval*3, 150, 50)];
    button2.backgroundColor  = [UIColor lightGrayColor];
    button2.tag = 2;
    [button2 setTitle:@"圆形剪切照片" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(10, interval*4, 150, 50)];
    button3.backgroundColor  = [UIColor lightGrayColor];
    button3.tag = 3;
    [button3 setTitle:@"选择多张照片" forState:UIControlStateNormal];
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(10, interval*5, 150, 50)];
    button4.backgroundColor  = [UIColor lightGrayColor];
    button4.tag = 4;
    [button4 setTitle:@"拍照📷" forState:UIControlStateNormal];
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(10, interval*6, 150, 50)];
    button5.backgroundColor  = [UIColor lightGrayColor];
    button5.tag = 5;
    [button5 setTitle:@"查看大图" forState:UIControlStateNormal];
    [self.view addSubview:button5];
    [button5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button6 = [[UIButton alloc]initWithFrame:CGRectMake(10, interval*7, 150, 50)];
    button6.backgroundColor  = [UIColor lightGrayColor];
    button6.tag = 6;
    [button6 setTitle:@"查看大图可勾选" forState:UIControlStateNormal];
    [self.view addSubview:button6];
    [button6 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

@end


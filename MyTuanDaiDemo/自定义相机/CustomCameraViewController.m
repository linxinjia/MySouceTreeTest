//
//  CustomCameraViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/6/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CustomCameraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface CustomCameraViewController ()<UIGestureRecognizerDelegate>
{
    CGSize screenSize;
    BOOL isUsingFrontFacingCamera;
}

/**
 *  AVCaptureSession对象来执行输入设备和输出设备之间的数据传递
 */
@property (nonatomic, strong) AVCaptureSession* session;
/**
 *  输入设备
 */
@property (nonatomic, strong) AVCaptureDeviceInput* videoInput;
/**
 *  照片输出流
 */
@property (nonatomic, strong) AVCaptureStillImageOutput* stillImageOutput;
/**
 *  预览图层
 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer* previewLayer;
/**
 *  记录开始的缩放比例
 */
@property (nonatomic, assign) CGFloat beginGestureScale;
/**
 *  最后的缩放比例
 */
@property (nonatomic, assign) CGFloat effectiveScale;

@property (nonatomic, strong) UIView *backView;

@end

@implementation CustomCameraViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    if (self.session) {
        
        [self.session startRunning];
    }
    
    //监听相机的对焦事件
    AVCaptureDevice *camDevice =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    int flags =NSKeyValueObservingOptionNew;
    [camDevice addObserver:self forKeyPath:@"adjustingFocus" options:flags context:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:YES];
    
    if (self.session) {
        
        [self.session stopRunning];
    }
    
    //移除监听相机的对焦事件
    AVCaptureDevice*camDevice =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [camDevice removeObserver:self forKeyPath:@"adjustingFocus"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize = [UIScreen mainScreen].bounds.size;
    
    isUsingFrontFacingCamera = NO;
    [self initAVCaptureSession];
}

- (void)initAVCaptureSession{
    
    self.session = [[AVCaptureSession alloc] init];
    
    NSError *error;
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //更改这个设置的时候必须先锁定设备，修改完后再解锁，否则崩溃
    [device lockForConfiguration:nil];
    //设置闪光灯为自动
    [device setFlashMode:AVCaptureFlashModeAuto];
    [device unlockForConfiguration];
    
    self.videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    //输出设置。AVVideoCodecJPEG   输出jpeg格式图片
    NSDictionary * outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    
    if ([self.session canAddInput:self.videoInput]) {
        [self.session addInput:self.videoInput];
    }
    if ([self.session canAddOutput:self.stillImageOutput]) {
        [self.session addOutput:self.stillImageOutput];
    }
    
    //初始化预览图层
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
//    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];//该代码可能导致预览界面无法全屏（在frame正确的情况下）
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    NSLog(@"%f",screenSize.width);
    self.previewLayer.frame = CGRectMake(0, 0,screenSize.width, screenSize.height - 64);
    self.backView.layer.masksToBounds = YES;
    [self.backView.layer addSublayer:self.previewLayer];
}

//获取设备方向
-(AVCaptureVideoOrientation)avOrientationForDeviceOrientation:(UIDeviceOrientation)deviceOrientation{
    AVCaptureVideoOrientation result = (AVCaptureVideoOrientation)deviceOrientation;
    if ( deviceOrientation == UIDeviceOrientationLandscapeLeft )
        result = AVCaptureVideoOrientationLandscapeRight;
    else if ( deviceOrientation == UIDeviceOrientationLandscapeRight )
        result = AVCaptureVideoOrientationLandscapeLeft;
    return result;
}

//拍照按钮
//照片写入相册之前需要进行旋转(还没写)
//写入相册之前需要判断用户是否允许了程序访问相册，否则程序会崩溃
- (IBAction)takePhotoButtonClick:(UIBarButtonItem *)sender {
    
    AVCaptureConnection *stillImageConnection = [self.stillImageOutput        connectionWithMediaType:AVMediaTypeVideo];
    UIDeviceOrientation curDeviceOrientation = [[UIDevice currentDevice] orientation];
    AVCaptureVideoOrientation avcaptureOrientation = [self avOrientationForDeviceOrientation:curDeviceOrientation];
    [stillImageConnection setVideoOrientation:avcaptureOrientation];
    
//    [stillImageConnection setVideoScaleAndCropFactor:1];//控制焦距用的暂时先固定为1
    [stillImageConnection setVideoScaleAndCropFactor:self.effectiveScale];
    
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:stillImageConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        NSData *jpegData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        CFDictionaryRef attachments = CMCopyDictionaryOfAttachments(kCFAllocatorDefault,
                                                                    imageDataSampleBuffer,
                                                                    kCMAttachmentMode_ShouldPropagate);
        
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied){
            //无权限
            return ;
        }
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeImageDataToSavedPhotosAlbum:jpegData metadata:(__bridge id)attachments completionBlock:^(NSURL *assetURL, NSError *error) {
            
        }];
        
    }];
}

//闪光灯
//闪光灯的设置非常简单，只需要修改device的flashMode属性即可，这里需要注意的是，修改device时候需要先锁住，修改完成后再解锁，否则会崩溃，设置闪光灯的时候也需要做安全判断，验证设备是否支持闪光灯，有些iOS设备是没有闪光灯的，如果不做判断还是会crash掉
- (IBAction)flashButtonClick:(UIBarButtonItem *)sender {
    NSLog(@"flashButtonClick");
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //修改前必须先锁定
    [device lockForConfiguration:nil];
    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if ([device hasFlash]) {
        
        if (device.flashMode == AVCaptureFlashModeOff) {
            device.flashMode = AVCaptureFlashModeOn;
            
            [sender setTitle:@"flashOn"];
        } else if (device.flashMode == AVCaptureFlashModeOn) {
            device.flashMode = AVCaptureFlashModeAuto;
            [sender setTitle:@"flashAuto"];
        } else if (device.flashMode == AVCaptureFlashModeAuto) {
            device.flashMode = AVCaptureFlashModeOff;
            [sender setTitle:@"flashOff"];
        }
        
    } else {
        
        NSLog(@"设备不支持闪光灯");
    }
    [device unlockForConfiguration];
}

//切换镜头
//isUsingFrontFacingCamera这个属性是个BOOL值变量。用于防止重复切换统一摄像头，调用这个点击方法的控件是个segement
- (IBAction)switchCameraSegmentedControlClick:(UISegmentedControl *)sender {
    NSLog(@"%ld",(long)sender.selectedSegmentIndex);
    
    AVCaptureDevicePosition desiredPosition;
    if (isUsingFrontFacingCamera){
        desiredPosition = AVCaptureDevicePositionBack;
    }else{
        desiredPosition = AVCaptureDevicePositionFront;
    }
    
    for (AVCaptureDevice *d in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo]) {
        if ([d position] == desiredPosition) {
            [self.previewLayer.session beginConfiguration];
            AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:d error:nil];
            for (AVCaptureInput *oldInput in self.previewLayer.session.inputs) {
                [[self.previewLayer session] removeInput:oldInput];
            }
            [self.previewLayer.session addInput:input];
            [self.previewLayer.session commitConfiguration];
            break;
        }
    }
    
    isUsingFrontFacingCamera = !isUsingFrontFacingCamera;
}

//缩放手势 用于调整焦距
//相机支持的焦距是1.0~67.5，所以再控制器加载的时候分别给这两个属性附上一个初值 1.0。之后给view添加一个缩放手势
- (void)handlePinchGesture:(UIPinchGestureRecognizer *)recognizer{
    
    BOOL allTouchesAreOnThePreviewLayer = YES;
    NSUInteger numTouches = [recognizer numberOfTouches], i;
    for ( i = 0; i < numTouches; ++i ) {
        CGPoint location = [recognizer locationOfTouch:i inView:self.backView];
        CGPoint convertedLocation = [self.previewLayer convertPoint:location fromLayer:self.previewLayer.superlayer];
        if ( ! [self.previewLayer containsPoint:convertedLocation] ) {
            allTouchesAreOnThePreviewLayer = NO;
            break;
        }
    }
    
    if ( allTouchesAreOnThePreviewLayer ) {
        
        
        self.effectiveScale = self.beginGestureScale * recognizer.scale;
        if (self.effectiveScale < 1.0){
            self.effectiveScale = 1.0;
        }
        
        NSLog(@"%f-------------->%f------------recognizerScale%f",self.effectiveScale,self.beginGestureScale,recognizer.scale);
        
        CGFloat maxScaleAndCropFactor = [[self.stillImageOutput connectionWithMediaType:AVMediaTypeVideo] videoMaxScaleAndCropFactor];
        
        NSLog(@"%f",maxScaleAndCropFactor);
        if (self.effectiveScale > maxScaleAndCropFactor)
            self.effectiveScale = maxScaleAndCropFactor;
        
        [CATransaction begin];
        [CATransaction setAnimationDuration:.025];
        [self.previewLayer setAffineTransform:CGAffineTransformMakeScale(self.effectiveScale, self.effectiveScale)];
        [CATransaction commit];
    }
}

#pragma mark - UIGestureRecognizerDelegate
//在每次手势开始的时候把上一次实际缩放值赋给初始缩放值，如果不这么做的话你会发现每次手势开始的时候界面都会跳来跳去的
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ( [gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] ) {
        self.beginGestureScale = self.effectiveScale;
    }
    return YES;
}

//监听相机的对焦事件
-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
    
}




@end

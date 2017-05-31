//
//  AppDelegate.m
//  MyTuanDaiDemo
//
//  Created by Apple on 16/12/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "InvestViewController.h"
#import "FinedViewController.h"
#import "MineViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0){
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc]initWithFrame:frame];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //注册截屏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidTakeScreenshot:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
    
    
    HomeViewController *homeViewController = [HomeViewController new];
    homeViewController.title = @"团贷网";
    UINavigationController *navgController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
    navgController.navigationBar.barTintColor = [UIColor colorWithRed:251/255.0 green:208/255.0 blue:30/255.0 alpha:1];
    navgController.navigationBar.tintColor = [UIColor blackColor];
    
//    InvestViewController *investViewController = [InvestViewController new];
    SecondViewController *investViewController = [SecondViewController new];
    investViewController.title = @"投资";
    UINavigationController *navgController2 = [[UINavigationController alloc]initWithRootViewController:investViewController];
    navgController2.navigationBar.barTintColor = [UIColor colorWithRed:251/255.0 green:208/255.0 blue:30/255.0 alpha:1];
    navgController2.navigationBar.tintColor = [UIColor blackColor];

    FinedViewController *finedViewController = [FinedViewController new];
    finedViewController.title = @"发现";
    UINavigationController *navgController3 = [[UINavigationController alloc]initWithRootViewController:finedViewController];
    navgController3.navigationBar.barTintColor = [UIColor colorWithRed:251/255.0 green:208/255.0 blue:30/255.0 alpha:1];

    
    MineViewController *mineViewController = [MineViewController new];
    mineViewController.title = @"我";
    UINavigationController *navgController4 = [[UINavigationController alloc]initWithRootViewController:mineViewController];
    navgController4.navigationBar.barTintColor = [UIColor colorWithRed:251/255.0 green:208/255.0 blue:30/255.0 alpha:1];

    
    _maintabBarController = [UITabBarController new];
    _maintabBarController.viewControllers = @[navgController,navgController2,navgController3,navgController4];
    
    self.window.rootViewController = _maintabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UITabBar *tabbar = _maintabBarController.tabBar;
    tabbar.tintColor = [UIColor colorWithRed:255/255.0 green:188/255.0 blue:0/255.0 alpha:1];
    UITabBarItem *tabbarItem0 = [tabbar.items objectAtIndex:0];
    UITabBarItem *tabbarItem1 = [tabbar.items objectAtIndex:1];
    UITabBarItem *tabbarItem2 = [tabbar.items objectAtIndex:2];
    UITabBarItem *tabbarItem3 = [tabbar.items objectAtIndex:3];
    
    tabbarItem0.selectedImage = [UIImage imageNamed:@"tdlogo_selected"];
    tabbarItem0.image = [UIImage imageNamed:@"tdlogo_noselected"];
    tabbarItem0.title = @"团贷网";
    
    tabbarItem1.selectedImage = [UIImage imageNamed:@"invest_selected"];
    tabbarItem1.image = [UIImage imageNamed:@"invest_noselected"];
    tabbarItem1.title = @"投资";
    
    tabbarItem2.selectedImage = [UIImage imageNamed:@"fined_selected"];
    tabbarItem2.image = [UIImage imageNamed:@"fined_noselected"];
    tabbarItem2.title = @"发现";
    
    tabbarItem3.selectedImage = [UIImage imageNamed:@"mine_selected"];
    tabbarItem3.image = [UIImage imageNamed:@"mine_noselected"];
    tabbarItem3.title = @"我";
    return YES;
}

#pragma mark - 截屏
//截屏响应
- (void)userDidTakeScreenshot:(NSNotification *)notification{
    NSLog(@"检测到截屏");
    //人为截屏, 模拟用户截屏行为, 获取所截图片
    UIImage *image_ = [self imageWithScreenshot];
    
    //分享
    if (image_) {
        NSLog(@"弹出分享弹窗");
        
    }
}

// 截取当前屏幕
- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(image);
}

//返回截取到的图片
- (UIImage *)imageWithScreenshot
{
    NSData *imageData = [self dataWithScreenshotInPNGFormat];
    return [UIImage imageWithData:imageData];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

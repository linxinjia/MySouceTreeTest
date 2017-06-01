//
//  UIViewController+Debugging.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/6/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIViewController+Debugging.h"

@implementation UIViewController (Debugging)
- (void)showDebugger
{
#if DEBUG
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id debugClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    [debugClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
    
    id debugOverlayInstance = [debugClass performSelector:NSSelectorFromString(@"overlay")];
    [debugOverlayInstance performSelector:NSSelectorFromString(@"toggleVisibility")];
#pragma clang diagnostic pop
#endif
}
@end

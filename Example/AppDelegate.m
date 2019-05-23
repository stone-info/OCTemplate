//
//  AppDelegate.m
//  Example
//
//  Created by stone on 2019/5/23.
//  Copyright © 2019 stone. All rights reserved.
//

#import "AppDelegate.h"
#import "OCTemplateConsts.h"
#import "SNTabBarController.h"
#import "SNWindow.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  
  [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
  // init data
  [SNConst new];
  
  kAutoPush = YES;
  
  // key board
  {
    // 控制自动键盘功能启用与否
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable                     = YES;
    // 键盘弹出时，点击背景，键盘收回
    manager.shouldResignOnTouchOutside = YES;
    // 隐藏键盘上面的toolBar,默认是开启的
    manager.enableAutoToolbar          = NO;
    
    // 如果某一个文本框确实不需要键盘上面的toolBar
    // textField.inputAccessoryView = [[UIView alloc] init];
    
    // 如果某个页面不想让键盘弹出
    //
    // - (void) viewWillAppear: (BOOL)animated {
    //
    //   //关闭自动键盘功能
    //   [IQKeyboardManager sharedManager].enable = NO;
    //
    // }
    // - (void) viewWillDisappear: (BOOL)animated {
    //
    //   //开启自动键盘功能
    //   [IQKeyboardManager sharedManager].enable = YES;
    //
    // }
  }
  
  //====================================/
  
  if (@available(iOS 11.0, *)) {
    // 影响太大了, 还是在各个控制器自己设置吧 , 相册都不会自动缩进了...
    // [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
  }
  
  // 获取info字典
  NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
  NSString * mUIMainStoryboardFile = infoDictionary[@"UIMainStoryboardFile"];
  
  // NSLog(@"Main.storyboard is %@", mUIMainStoryboardFile);
  
  if (mUIMainStoryboardFile) {
    // Storyboar 有main
    return YES;
    
  } else {
    /** 创建 Window */
    self.window = [[SNWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SNTabBarController *tabBarController = [[SNTabBarController alloc] init];
    /** 设置根控制器 */
    [self.window setRootViewController:tabBarController];
    /** 延迟显示启动界面, 优点: 能多看会 LOGO */
    //  [NSThread sleepForTimeInterval:2.0];
    /** 显示window */
    [self.window makeKeyAndVisible];
    
    return YES;
  }
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

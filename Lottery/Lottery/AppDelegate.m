//
//  AppDelegate.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SNTabBarController.h"
#import "NewFeatureViewController.h"
#import "SNSaveTool.h"
#import "SNRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// app 启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];

  [SNConst new];

  /** 创建 Window */
  self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];

  // self.window.windowLevel = UIWindowLevelAlert;     // 优先级最高
  // self.window.windowLevel = UIWindowLevelStatusBar; // 其次
  // self.window.windowLevel = UIWindowLevelNormal;    // 最低

  __kindof UIViewController *rootViewController = [SNRootViewController chooseWindowRootViewController];
  
  /** 设置根控制器 */
  [self.window setRootViewController:rootViewController];
  /** 延迟显示启动界面, 优点: 能多看会 LOGO */
  //  [NSThread sleepForTimeInterval:2.0];
  /** 显示window */
  [self.window makeKeyAndVisible];

  return YES;
}

// app 将要失去焦点时调用
- (void)applicationWillResignActive:(UIApplication *)application {
  NSLog(@"%s", __func__);
}

// app 进入后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
  NSLog(@"%s", __func__);
}

// app 进入前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
  NSLog(@"%s", __func__);
}

// app 获取焦点时调用 (能否与用户进行交互, 就是用户能点击界面了)
- (void)applicationDidBecomeActive:(UIApplication *)application {
  NSLog(@"%s", __func__);

  // NSLog(@"self.window.subviews = %@", self.window.subviews);
}

// app 退出时调用
- (void)applicationWillTerminate:(UIApplication *)application {
  NSLog(@"%s", __func__);
}

// app 收到内存警告时调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  NSLog(@"%s", __func__);
}


@end


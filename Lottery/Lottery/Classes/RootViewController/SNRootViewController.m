//
//  SNRootViewController.m
//  Lottery
//
//  Created by stone on 2019/7/21.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNRootViewController.h"
#import "NewFeatureViewController.h"
#import "SNTabBarController.h"

@implementation SNRootViewController
+ (__kindof UIViewController *)chooseWindowRootViewController {

  NSString *currentVersion = NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"];

  NSString *lastVersion = [SNSaveTool objectForKey:@"version"];

  BOOL flag = ![currentVersion isEqualToString:lastVersion];

  // flag = YES;
  __kindof UIViewController *rootViewController;

  if (flag) {
    // 版本不相等 进入新特性页面
    NewFeatureViewController *newFeatureViewController = NewFeatureViewController.new;
    [SNSaveTool setObject:currentVersion forKey:@"version"];
    rootViewController = newFeatureViewController;
  } else {
    // 版本相等 进入 Home
    /** 创建 UITabBarController*/
    SNTabBarController *tabBarController = SNTabBarController.new;
    rootViewController = tabBarController;
  }

  return rootViewController;
}
@end

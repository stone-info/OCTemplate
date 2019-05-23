//
//  SNConst.m
//  007_ActualCombatTechnology
//
//  Created by stone on 2018/8/11.
//  Copyright © 2018年 stone. All rights reserved.
//

#import "SNConst.h"

CGFloat kSystemVersion;
CGFloat kStatusBarHeight           = 0;
CGFloat kStatusNavigationBarHeight = 0;
CGFloat kCurrentSystemVersionFloat = 0;

CGFloat kSafeAreaBottomHeight        = 0;
CGFloat kSafeAreaContainerViewHeight = 0;
CGFloat kScreenHeight                = 0;
CGFloat kScreenWidth                 = 0;
CGSize  kScreenSize;
/// 屏幕Scale
CGFloat kScreenScale;

const CGFloat kNavigationBarHeight = 44;
const CGFloat kTabBarHeight        = 49;

const CGFloat SNhHeaderHeight          = 0;
const CGFloat SNhFooterHeight          = 0;
const CGFloat SNhFastAnimationDuration = 0;
const CGFloat SNhSlowAnimationDuration = 0;

NSString *const SNhKeyPathContentOffset = @"contentOffset";
NSString *const SNhKeyPathContentInset  = @"contentInset";
NSString *const SNhKeyPathContentSize   = @"contentSize";
NSString *const SNhKeyPathPanState      = @"state";

@implementation SNConst

+ (void)initialize {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{

    kSystemVersion = [UIDevice currentDevice].systemVersion.doubleValue;
    kScreenScale   = [UIScreen mainScreen].scale;
    CGSize size = [UIScreen mainScreen].bounds.size;
    kScreenSize   = size;
    kScreenHeight = size.height;
    kScreenWidth  = size.width;

    kStatusBarHeight           = UIApplication.sharedApplication.statusBarFrame.size.height;
    kCurrentSystemVersionFloat = [[[UIDevice currentDevice] systemVersion] floatValue];
    kStatusNavigationBarHeight = kStatusBarHeight + kNavigationBarHeight;

    if (iPhoneXSeries) { kSafeAreaBottomHeight = 34.f; } else { kSafeAreaBottomHeight = 0.f; }

    kSafeAreaContainerViewHeight = kScreenHeight - kStatusBarHeight - kNavigationBarHeight - kSafeAreaBottomHeight;

    //    if (@available(iOS 11.0, *)) {
    //      UIEdgeInsets safeArea =
    //          [[UIApplication sharedApplication] keyWindow].safeAreaInsets;
    //      //  NSLog(@"%f",safeArea.bottom);
    //      kSafeAreaBottom = safeArea.bottom;
    //    } else {
    //      if (KIsiPhoneX) {
    //        kSafeAreaBottom = 34.0;
    //      } else {
    //        kSafeAreaBottom = 0.0;
    //      }
    //    }
  });
}
@end

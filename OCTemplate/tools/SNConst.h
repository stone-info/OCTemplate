//
//  SNConst.h
//  007_ActualCombatTechnology
//
//  Created by stone on 2018/8/11.
//  Copyright © 2018年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>



// UIKIT_EXTERN简单来说：就是将函数修饰为兼容以往C编译方式的、
// 具有extern属性(文件外可见性)、public修饰的方法或变量库外仍可见的属性
// https://www.jianshu.com/p/a6947375c52e

UIKIT_EXTERN CGFloat kStatusBarHeight;
UIKIT_EXTERN CGFloat kCurrentSystemVersionFloat;
UIKIT_EXTERN CGFloat kSafeAreaBottomHeight;
UIKIT_EXTERN CGFloat kSafeAreaContainerViewHeight;
UIKIT_EXTERN CGFloat kStatusNavigationBarHeight;

UIKIT_EXTERN const CGFloat kNavigationBarHeight;
UIKIT_EXTERN const CGFloat kTabBarHeight;

UIKIT_EXTERN CGFloat kScreenHeight;
UIKIT_EXTERN CGFloat kScreenWidth;
UIKIT_EXTERN CGSize kScreenSize;
/// 屏幕Scale
UIKIT_EXTERN CGFloat kScreenScale;
UIKIT_EXTERN CGFloat kSystemVersion;

UIKIT_EXTERN const CGFloat SNhHeaderHeight;
UIKIT_EXTERN const CGFloat SNhFooterHeight;
UIKIT_EXTERN const CGFloat SNhFastAnimationDuration;
UIKIT_EXTERN const CGFloat SNhSlowAnimationDuration;
UIKIT_EXTERN NSString *const SNhKeyPathContentOffset;
UIKIT_EXTERN NSString *const SNhKeyPathContentInset;
UIKIT_EXTERN NSString *const SNhKeyPathContentSize;
UIKIT_EXTERN NSString *const SNhKeyPathPanState;


/*当前机型是否iPhoneX或iPhoneXs*/
#define iPhoneX                                                      \
  ([UIScreen instancesRespondToSelector:@selector(currentMode)]      \
       ? CGSizeEqualToSize(CGSizeMake(1125, 2436),                   \
                           [[UIScreen mainScreen] currentMode].size) \
       : NO)
/*当前机型是否iPhoneXR*/
#define iPhoneXR                                                     \
  ([UIScreen instancesRespondToSelector:@selector(currentMode)]      \
       ? CGSizeEqualToSize(CGSizeMake(828, 1792),                    \
                           [[UIScreen mainScreen] currentMode].size) \
       : NO)
/*当前机型是否iPhoneXsMax*/
#define iPhoneXsMax                                                  \
  ([UIScreen instancesRespondToSelector:@selector(currentMode)]      \
       ? CGSizeEqualToSize(CGSizeMake(1242, 2688),                   \
                           [[UIScreen mainScreen] currentMode].size) \
       : NO)
/*当前机型是否iPhoneX系列*/
#define iPhoneXSeries (iPhoneX || iPhoneXR || iPhoneXsMax)

@interface SNConst : NSObject

@end

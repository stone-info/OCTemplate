//
//  SNNavigationController.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//


// 启发: https://stackoverflow.com/questions/33025239/remove-text-from-back-button-keeping-the-icon
// 使用 透明色 隐藏 title...

// 优点 : 保留系统navigationBar动画
// 缺点 : 只是隐藏了 文字, 改不了 返回按钮的图片, tab bar 返回动画 比较突兀

#import "SNNoTitleNavigationController.h"

@interface SNNoTitleNavigationController () <UINavigationControllerDelegate>
@end

@implementation SNNoTitleNavigationController

// 什么时候用, 当程序一启动的时候就会调用
// 作用: 将当前类加载进内存, 放在代码区, 比main 还先调用
+ (void)load {

}

// 什么时候调用, 当第一次初始这个类的时候调用
// 作用 初始化这个类
+ (void)initialize {

  // [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
  // [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];

  // 获取导航条标识
  //返回实现了此外观协议的UI控件实例，用这个返回的对象设置的属性只对ContainerClass内部包裹的对象有效。
  // (instancetype)appearanceWhenContainedInInstancesOfClasses:(NSArray<Class <UIAppearanceContainer>> *)containerTypes;
  // 即 在 SNNavigationController 有效 , UINavigationController 无效..., 正是想要的...
  UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];

  [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
  [navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];

  [navigationBar setTintColor:UIColor.whiteColor];

  UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];

  // [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 100) forBarMetrics:UIBarMetricsDefault];

  [item setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.clearColor} forState:UIControlStateNormal];
  [item setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.clearColor} forState:UIControlStateHighlighted];
  [item setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.clearColor} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

  if (self.viewControllers.count > 0) { viewController.hidesBottomBarWhenPushed = YES; }

  [super pushViewController:viewController animated:animated];
}


@end

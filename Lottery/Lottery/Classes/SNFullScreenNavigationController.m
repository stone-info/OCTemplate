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

#import "SNFullScreenNavigationController.h"

@interface SNFullScreenNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@end

@implementation SNFullScreenNavigationController {
  __weak __kindof UIViewController *_rtViewController;
}

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

  // 写法1:
  // {
  //   UIScreenEdgePanGestureRecognizer *recognizer = (UIScreenEdgePanGestureRecognizer *) self.interactivePopGestureRecognizer;
  //   NSLog(@"recognizer = %@", recognizer);
  //
  //   NSArray *targets = [recognizer valueForKeyPath:@"_targets"];
  //   id      target   = [targets[0] valueForKeyPath:@"_target"];
  //   {
  //     __kindof UIView        *view = self.view;
  //     UIPanGestureRecognizer *pan  = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
  //     [view addGestureRecognizer:pan];
  //     view.userInteractionEnabled = YES;
  //   }
  // }
  // // [self foo:recognizer];

  // 写法2:
  id <UIGestureRecognizerDelegate> target = self.interactivePopGestureRecognizer.delegate;

  self.interactivePopGestureRecognizer.enabled = NO;

  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];

  [self.view addGestureRecognizer:pan];

  pan.delegate = self;

}

#pragma mark - @override

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
  _rtViewController = rootViewController;
  return [super initWithRootViewController:rootViewController];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

  // NSLog(@"self.viewControllers = %@", self.viewControllers);
  // NSLog(@"self.viewControllers.count = %lu", self.viewControllers.count);
  // if (self.viewControllers.count > 1) { viewController.hidesBottomBarWhenPushed = YES; }
  // NSLog(@"self.snRootViewController = %@", self.snRootViewController);
  // NSLog(@"viewController = %@", viewController);

  if (_rtViewController != viewController) { viewController.hidesBottomBarWhenPushed = YES; }

  [super pushViewController:viewController animated:animated];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {

  return [super popViewControllerAnimated:animated];
}

#pragma mark - <UIGestureRecognizerDelegate>

// 唯一美中不足的是
// - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
// 会有冲突, 导致卡死... 使用还得小心... 蛋疼...
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
  return _rtViewController != self.viewControllers.lastObject;
  // return YES;
}

// - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//
//   NSLog(@"gestureRecognizer = %@", gestureRecognizer);
//   NSLog(@"otherGestureRecognizer = %@", otherGestureRecognizer);
//
//   if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
//
//     return NO;//和NavigationController自带的返回手势不能同时执行
//   } else {
//     return YES;
//   }
// }

- (void)foo:(UIScreenEdgePanGestureRecognizer *)recognizer {
  printProperties(UIGestureRecognizer.class, recognizer);
  printMethods(recognizer.class);
  //____________2019-07-21_________________________________________________▲△__.
  printf("\033[1;7;48m____________2019-07-21_________________________________________________▲△__.\033[0m\n");

  // ivar 好像和 获取属性名稍微不一样 , 私有属性和 私有方法 全都能获取... 配合kvc 使用的
  unsigned int count;
  Ivar         *pIvar = class_copyIvarList(UIGestureRecognizer.class, &count);
  for (int     i      = 0; i < count; i++) {
    Ivar     pObjcIvar = pIvar[i];
    NSString *string   = @(ivar_getName(pObjcIvar)); // C语言字符串 转 OC 字符串
    NSLog(@"string = %@", string);
  }
  NSArray      *array = [recognizer valueForKey:@"_targets"];
  for (id      o in array) {
    // 到了这一步 只能看到 action 和 类型 , 具体变量名叫什么, 还得使用 xcode 打断点的方式, 断点打在这 就能看见变量名了...
    NSLog(@"o = %@", o);
  }
}
@end

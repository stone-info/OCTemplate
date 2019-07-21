//
//  SNNavigationController.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNNavigationController.h"

// 优点 : tab bar 随着根控制器移动 , 能自定义返回按钮的 图片 文字等
// 缺点 : 要维护系统滑动返回的代理

@interface SNNavigationController () <UINavigationControllerDelegate>
@property (strong, nonatomic) id popGesture;
@end

@implementation SNNavigationController

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
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  self.popGesture = self.interactivePopGestureRecognizer.delegate;

  self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

  // NSLog(@"self.viewControllers.count = %lu", self.viewControllers.count);

  if (self.viewControllers.count > 0) {
    viewController.hidesBottomBarWhenPushed         = YES;
    // 如果在导航控制器统一设置返回按钮, 就没有滑动移除控制器的功能
    // 自定义 返回之后 , 底部 tab bar 不会显得那么突兀了...
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:kImageWithName(@"NavBack") style:UIBarButtonItemStylePlain target:self action:@selector(back)];
  }

  [super pushViewController:viewController animated:animated];
}

- (void)back {
  NSLog(@"%s", __func__);
  [self popViewControllerAnimated:YES];
}

#pragma mark - <UINavigationControllerDelegate>

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

  if (self.viewControllers[0] == viewController) {
    // 如果是根控制器 需要还原 系统滑动返回的代理, 不然 界面会卡死...
    self.interactivePopGestureRecognizer.delegate = self.popGesture;
  }else{
    // 清空代理 使得自定义返回具备 滑动返回功能.
    self.interactivePopGestureRecognizer.delegate = nil;
  }
}

@end

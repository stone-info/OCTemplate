//
//  SNTabBarController.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNTabBarController.h"
#import "HallViewController.h"
#import "ArenaViewController.h"
#import "DiscoverViewController.h"
#import "HistoryViewController.h"
#import "MyLotteryViewController.h"
#import "SNTabBar.h"
#import "SNNavigationController.h"
#import "SNNoTitleNavigationController.h"
#import "SNFullScreenNavigationController.h"

static const UITabBarSystemItem tabBarSystemItems[5] = {
  UITabBarSystemItemFavorites,
  UITabBarSystemItemSearch,
  UITabBarSystemItemHistory,
  UITabBarSystemItemDownloads,
  UITabBarSystemItemMore
};

@interface SNTabBarController () <SNTabBarDelegate>

@property (strong, nonatomic) NSMutableArray<UITabBarItem *> *items;

@property (weak, nonatomic) SNTabBar *snTabBar;

@end

@implementation SNTabBarController

- (NSMutableArray<UITabBarItem *> *)items {
  if (_items == nil) { _items = [NSMutableArray<UITabBarItem *> array]; }
  return _items;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self setupAllChildViewController];
  [self setupTabBar];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  // [self.tabBar removeFromSuperview];
  // [self.snTabBar setItems:self.items selectedIndex:0];
  for (__kindof UIView *subview in self.tabBar.subviews) {
    if (![subview isKindOfClass:[SNTabBar class]]) {
      [subview removeFromSuperview];
    }
  }
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)setupTabBar {

  SNTabBar *tabBar = SNTabBar.new;
  self.snTabBar          = tabBar;
  tabBar.backgroundColor = HexRGBA(@"#0D0D0D", 1.0);

  tabBar.delegate = self;

  // NSLog(@"self.tabBar = %@", self.tabBar);

  tabBar.frame = CGRectMake(0, 0, kScreenWidth, kTabBarHeight + kSafeAreaBottomHeight);
  [self.tabBar addSubview:tabBar];
  //
  // //  [tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
  // //    make.bottom.offset(0);
  // //    make.left.offset(0);
  // //    make.right.offset(0);
  // //    make.top.offset(0);
  // //    // make.height.mas_equalTo(kSafeAreaBottomHeight + kTabBarHeight);
  // //  }];
  //   // self.selectedIndex = 0;
  [self.snTabBar setItems:self.items selectedIndex:0];

  // UIView *mView = makeView(true);
  // mView.frame = CGRectMake(0, 0, 100, 100);
  // [self.tabBar addSubview:mView];
}

- (void)setupAllChildViewController {

  //  https://www.jianshu.com/p/6665c088bd01
  //  * API: Character Attributes , NSAttributedString 共有21个属性*
  //  NSFontAttributeName               ->设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
  //  NSParagraphStyleAttributeName     ->设置文本段落排版格式，取值为 NSParagraphStyle 对象(详情见下面的API说明)
  //  NSForegroundColorAttributeName    ->设置字体颜色，取值为 UIColor对象，默认值为黑色
  //  NSBackgroundColorAttributeName    ->设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
  //  NSLigatureAttributeName           ->设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符
  //  NSKernAttributeName               ->设置字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄
  //  NSStrikethroughStyleAttributeName ->设置删除线，取值为 NSNumber 对象（整数）
  //  NSStrikethroughColorAttributeName ->设置删除线颜色，取值为 UIColor 对象，默认值为黑色
  //  NSUnderlineStyleAttributeName     ->设置下划线，取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值，与删除线类似
  //  NSUnderlineColorAttributeName     ->设置下划线颜色，取值为 UIColor 对象，默认值为黑色
  //  NSStrokeWidthAttributeName        ->设置笔画宽度(粗细)，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果
  //  NSStrokeColorAttributeName        ->填充部分颜色，不是字体颜色，取值为 UIColor 对象
  //  NSShadowAttributeName             ->设置阴影属性，取值为 NSShadow 对象
  //  NSTextEffectAttributeName         ->设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用
  //  NSBaselineOffsetAttributeName     ->设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
  //  NSObliquenessAttributeName        ->设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
  //  NSExpansionAttributeName          ->设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
  //  NSWritingDirectionAttributeName   ->设置文字书写方向，从左向右书写或者从右向左书写
  //  NSVerticalGlyphFormAttributeName  ->设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本
  //  NSLinkAttributeName               ->设置链接属性，点击后调用浏览器打开指定URL地址
  //  NSAttachmentAttributeName         ->设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排

  // 购彩大厅
  {
    HallViewController *controller = HallViewController.new;
    controller.navigationItem.title = @"购彩大厅";
    SNFullScreenNavigationController *navigationController = [SNFullScreenNavigationController.alloc initWithRootViewController:controller];
    // [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // [navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];
    // controller.view.backgroundColor = UIColor.whiteColor;
    controller.view.backgroundColor = HexRGBA(@"#FFC1C1", 1.0);
    [self addChildViewController:navigationController];
    // controller.tabBarItem.image         = kImageWithName(@"TabBar_Hall_new");
    // controller.tabBarItem.selectedImage = kImageWithName(@"TabBar_Hall_selected_new");

    UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:tabBarSystemItems[0] tag:0];
    item.badgeValue       = @"10";
    controller.tabBarItem = item;

    UITabBarItem *tabBarItem = [UITabBarItem.alloc initWithTitle:@"" image:kImageWithName(@"TabBar_Hall_new") selectedImage:kImageWithName(@"TabBar_Hall_selected_new")];
    [self.items addObject:tabBarItem];
  }
  // 竞技场
  {
    ArenaViewController *controller = ArenaViewController.new;
    controller.navigationItem.title = @"竞技场";
    SNNavigationController *navigationController = [SNNavigationController.alloc initWithRootViewController:controller];
    // [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // [navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];
    // controller.view.backgroundColor = UIColor.whiteColor;
    controller.view.backgroundColor = HexRGBA(@"#4FB753", 1.0);
    [self addChildViewController:navigationController];

    // controller.tabBarItem.image         = kImageWithName(@"TabBar_Arena_new");
    // controller.tabBarItem.selectedImage = kImageWithName(@"TabBar_Arena_selected_new");

    UITabBarItem *tabBarItem = [UITabBarItem.alloc initWithTitle:@"" image:kImageWithName(@"TabBar_Arena_new") selectedImage:kImageWithName(@"TabBar_Arena_selected_new")];
    [self.items addObject:tabBarItem];
  }
  // 发现
  {
    DiscoverViewController *controller = DiscoverViewController.new;
    controller.navigationItem.title = @"发现";
    SNNavigationController *navigationController = [SNNavigationController.alloc initWithRootViewController:controller];
    // [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // [navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];
    // controller.view.backgroundColor = UIColor.whiteColor;
    controller.view.backgroundColor = HexRGBA(@"#EE82EE", 1.0);
    [self addChildViewController:navigationController];
    // controller.tabBarItem.image         = kImageWithName(@"TabBar_Discovery_new");
    // controller.tabBarItem.selectedImage = kImageWithName(@"TabBar_Discovery_selected_new");

    UITabBarItem *tabBarItem = [UITabBarItem.alloc initWithTitle:@"" image:kImageWithName(@"TabBar_Discovery_new") selectedImage:kImageWithName(@"TabBar_Discovery_selected_new")];
    [self.items addObject:tabBarItem];
  }

  // 开奖信息
  {
    HistoryViewController *controller = HistoryViewController.new;
    controller.navigationItem.title = @"开奖信息";
    SNNavigationController *navigationController = [SNNavigationController.alloc initWithRootViewController:controller];
    // [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // [navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];
    // controller.view.backgroundColor = UIColor.whiteColor;
    controller.view.backgroundColor = HexRGBA(@"#E0EEE0", 1.0);
    [self addChildViewController:navigationController];
    // controller.tabBarItem.image         = kImageWithName(@"TabBar_History_new");
    // controller.tabBarItem.selectedImage = kImageWithName(@"TabBar_History_selected_new");

    UITabBarItem *tabBarItem = [UITabBarItem.alloc initWithTitle:@"" image:kImageWithName(@"TabBar_History_new") selectedImage:kImageWithName(@"TabBar_History_selected_new")];
    [self.items addObject:tabBarItem];
  }

  // 我的彩票
  {
    MyLotteryViewController *controller = MyLotteryViewController.new;
    controller.navigationItem.title = @"我的彩票";
    SNNavigationController *navigationController = [SNNavigationController.alloc initWithRootViewController:controller];
    // [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // [navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: kPingFangSCMedium(22), NSForegroundColorAttributeName: UIColor.whiteColor,}];
    // controller.view.backgroundColor = UIColor.whiteColor;
    controller.view.backgroundColor = HexRGBA(@"#836FFF", 1.0);
    [self addChildViewController:navigationController];
    // controller.tabBarItem.image         = kImageWithName(@"TabBar_MyLottery_new");
    // controller.tabBarItem.selectedImage = kImageWithName(@"TabBar_MyLottery_selected_new");

    UITabBarItem *tabBarItem = [UITabBarItem.alloc initWithTitle:@"" image:kImageWithName(@"TabBar_MyLottery_new") selectedImage:kImageWithName(@"TabBar_MyLottery_selected_new")];
    [self.items addObject:tabBarItem];
  }
}

#pragma mark - <SNTabBarDelegate>

- (void)tabBar:(SNTabBar *)tabBar index:(NSUInteger)index {
  NSLog(@"index = %lu", index);

  self.selectedIndex = index;
}

@end

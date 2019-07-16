//
//  T091ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//


#import "T091ViewController.h"
#import "T091View.h"
#import "T091DrawImage.h"
#import "T091ClipView.h"

@interface T091ViewController ()

@end

@implementation T091ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self entry];
}

- (void)injected {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  // [self.views removeAllObjects];
  // self.views = nil;
  [self entry];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [self entry];
}

- (void)entry {
  //  T091View *view = T091View.new;
  //  T091DrawImage *view = T091DrawImage.new;
  T091ClipView *view = T091ClipView.new;

  view.backgroundColor = UIColor.whiteColor;

  kBorder(view);

  [self.view addSubview:view];

  CGFloat padding = 10;
  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    // make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight + padding, padding, kSafeAreaBottomHeight + padding, padding));
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
    make.left.offset(padding);
    make.right.offset(-padding);
    make.bottom.offset(-kSafeAreaBottomHeight - padding);
    // make.height.mas_greaterThanOrEqualTo(300);
    // make.height.mas_greaterThanOrEqualTo(300);
  }];

  NSString *string = @"你好吗 世界\nhello world";

  UILabel *label = makeLabel(true);
label.font = kPingFangSCRegular(30);
  [label setTextColor:HexRGBA(@"#FFC1C1", 1.0)];
  label.text = string;
  [view addSubview:label];

  kMasKey(label);
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX;
    make.centerY;
  }];
}
//
// - (void)viewWillAppear:(BOOL)animated {
//   [super viewWillAppear:animated];
//   NSLog(@"%s", __func__);
// }
//
// - (void)viewDidAppear:(BOOL)animated {
//   [super viewDidAppear:animated];
//   NSLog(@"%s", __func__);
// }
//
// - (void)viewWillLayoutSubviews {
//   [super viewWillLayoutSubviews];
//   NSLog(@"%s", __func__);
// }
//
// - (void)viewDidLayoutSubviews {
//   [super viewDidLayoutSubviews];
//   NSLog(@"%s", __func__);
// }
//
// - (void)viewWillDisappear:(BOOL)animated {
//   [super viewWillDisappear:animated];
//   NSLog(@"%s", __func__);
// }
//
// - (void)viewDidDisappear:(BOOL)animated {
//   [super viewDidDisappear:animated];
//   NSLog(@"%s", __func__);
// }

@end

    
    

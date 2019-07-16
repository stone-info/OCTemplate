//
//  T090ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T090ViewController.h"
#import "SNT090View.h"
#import "SNDownloadProgressView.h"

@interface T090ViewController ()

@end

@implementation T090ViewController

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
  //  SNT090View *view = SNT090View.new;
  SNDownloadProgressView *view = SNDownloadProgressView.new;

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
    make.height.mas_greaterThanOrEqualTo(300);
  }];

  UILabel *label = makeLabel(false);
  label.text     = @"0";
  [self.view addSubview:label];

  kMasKey(label);
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(view);
  }];

  UISlider *slider = UISlider.new;
  [slider setMinimumValue:0];
  [slider setMaximumValue:100];
  //  [slider setValue:50];

  [self.view addSubview:slider];

  kMasKey(slider);
  [slider mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(view.mas_bottom).offset(10);
    make.left.offset(padding * 4);
    make.right.offset(-padding * 4);
    // make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
  }];

  //  RACSignal *deallocSignal = [slider rac_signalForSelector:NSSelectorFromString(@"dealloc")];
  //
  //  [[[slider rac_signalForControlEvents:UIControlEventValueChanged] takeUntil:deallocSignal] subscribeNext:^(__kindof UISlider *x) {
  //    label.text = [NSString stringWithFormat:@"%0.2f%%", x.value];
  //  }];

  [[[slider rac_signalForControlEvents:UIControlEventValueChanged] takeUntil:slider.rac_willDeallocSignal] subscribeNext:^(__kindof UISlider *x) {
      label.text = [NSString stringWithFormat:@"%0.2f%%", x.value];

    view.progressValue = x.value / 100;
    [view setNeedsDisplay];

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

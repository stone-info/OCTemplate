//
//  NewFeatureViewController.m
//  Lottery
//
//  Created by stone on 2019/7/21.
//  Copyright © 2019 stone. All rights reserved.
//

#import "NewFeatureViewController.h"

@interface NewFeatureViewController ()

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = UIColor.whiteColor;

  UIView *view = makeView(true);
  [self.view addSubview:view];
  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center;
    make.width.mas_equalTo(200);
    make.height.mas_equalTo(view.mas_width).multipliedBy(1); // 高/宽
  }];
}


@end

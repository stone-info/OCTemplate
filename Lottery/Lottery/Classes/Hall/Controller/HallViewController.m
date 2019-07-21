//
//  HallViewController.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "HallViewController.h"
#import "PushWebViewController.h"

@interface HallViewController ()

@end

@implementation HallViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:kImageWithName(@"CS50_activity_image") style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked:)];

  // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"ADD" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked:)];


  UIButton *button = makeButton(true);
  [self.view addSubview:button];
  [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

  kMasKey(button);
  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
    make.left.offset(10);
    make.right.offset(-10);
    make.height.mas_greaterThanOrEqualTo(50);
  }];
}

- (void)buttonClicked:(UIButton *)sender {
  UIViewController *controller = UIViewController.new;
  controller.view.backgroundColor = UIColor.whiteColor;
  [self.navigationController pushViewController:controller animated:YES];
}

- (void)leftBarButtonItemClicked:(UIBarButtonItem *)sender {
  NSLog(@"%s", __func__);
}

- (void)rightBarButtonItemClicked:(UIBarButtonItem *)sender {
  NSLog(@"%s", __func__);
}

// - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//   // PushWebViewController *controller = [[PushWebViewController alloc] init];
//   // controller.urlString   = @"http://www.baidu.com";
//   // controller.titleString = @"百度一下, 你就知道";
//   //
//   // // NSLog(@"urlString = %@", urlString);
//   // // NSLog(@"title = %@", title);
//   // [self presentViewController:controller animated:YES completion:NULL pushStyle:YES];
// }
@end

//
//  ViewController.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "ViewController.h"
#import "PushWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  // PushWebViewController *controller = [[PushWebViewController alloc] init];
  // controller.urlString   = @"http://www.baidu.com";
  // controller.titleString = @"百度一下, 你就知道";
  //
  // // NSLog(@"urlString = %@", urlString);
  // // NSLog(@"title = %@", title);
  // [self presentViewController:controller animated:YES completion:NULL pushStyle:YES];


}

@end

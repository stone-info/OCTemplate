//
//  T096ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "T096ViewController.h"

@interface T096ViewController ()

@end

@implementation T096ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.

  UIImageView *belowImageView = makeImageView(true);
  belowImageView.image        = [UIImage imageNamed:@"2B"];
  [self.view addSubview:belowImageView];

  kMasKey(belowImageView);
  [belowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight, 0, kSafeAreaBottomHeight, 0));
  }];
  UIImageView *frontImageView = makeImageView(true);
  frontImageView.image = [UIImage imageNamed:@"2A"];
  [self.view addSubview:frontImageView];

  kMasKey(frontImageView);
  [frontImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight, 0, kSafeAreaBottomHeight, 0));
  }];

  frontImageView.userInteractionEnabled = YES;
  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
  [frontImageView addGestureRecognizer:pan];

}

- (void)panHandle:(UITapGestureRecognizer *)sender {
  NSLog(@"%s", __func__);

  UIImageView *frontImageView = (UIImageView *) sender.view;
  CGPoint     point           = [sender locationInView:frontImageView];

  CGFloat width  = 30;
  CGFloat height = 30;

  CGFloat x = point.x - width * 0.5;
  CGFloat y = point.y - height * 0.5;

  CGRect rect = CGRectMake(x, y, width, height);

  UIGraphicsBeginImageContextWithOptions(frontImageView.bounds.size, NO, 0);

  CGContextRef pContext = UIGraphicsGetCurrentContext();

  [frontImageView.layer renderInContext:pContext];

  CGContextClearRect(pContext, rect);

  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  frontImageView.image = newImage;

}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event {

}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event {
  NSString *title   = nil;
  NSString *message = @"确定要退出登录吗?";

  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];

  {
    NSString      *actionButtonTitle = @"确定";
    UIAlertAction *action            = [UIAlertAction actionWithTitle:actionButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *_Nonnull action) {
      // 确定之后需要 处理的code
      NSLog(@"%s", __func__);
    }];

    [alertController addAction:action];
  }

  {
    NSString      *actionButtonTitle = @"取消";
    UIAlertAction *action            = [UIAlertAction actionWithTitle:actionButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
      // 确定之后需要 处理的code
      NSLog(@"%s", __func__);
    }];

    [alertController addAction:action];
  }

  [self presentViewController:alertController animated:YES completion:nil];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event {



}


@end
    
    
    
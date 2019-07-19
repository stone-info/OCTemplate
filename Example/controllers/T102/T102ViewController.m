//
//  T102ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T102ViewController.h"

@interface T102ViewController ()

@end

@implementation T102ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self entry];
}

- (void)injected {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [self.view.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
  // [self.views removeAllObjects];
  // self.views = nil;
  [self entry];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [self.view.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];

  [self entry];
}

- (void)entry {

  {
    UIImageView *view = makeImageView(true);
    view.image = [UIImage imageNamed:@"headIcon"];
    [self.view addSubview:view];

    CGFloat  padding = 100;

    kMasKey(view);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.top.offset(10);
      make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
      make.left.offset(padding);
      make.right.offset(-padding);
      // make.height.mas_greaterThanOrEqualTo(50);
      make.height.mas_equalTo(view.mas_width).multipliedBy(view.image.size.height / view.image.size.width); // 高/宽
    }];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];

    animation.keyPath = @"transform.rotation";

    animation.values = @[@(kDegreesToRadian(-5)), @(kDegreesToRadian(5))];

    animation.repeatCount = 3;

    animation.duration = 0.1;

    // 自动翻转(怎么去 怎么回来)
    animation.autoreverses = YES;


    // [view.layer addAnimation:animation forKey:nil];

    setInterval(self, ^(dispatch_source_t timer) {
      [view.layer addAnimation:animation forKey:nil];
    }, 3000);
  }
  
  {
    UIView *view = makeView(true);
    view.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:view];

    kMasKey(view);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
      CGFloat padding = 100;
      // make.top.offset(10);
      make.top.offset(kStatusBarHeight + kNavigationBarHeight + 400);
      make.left.offset(padding);
      make.right.offset(-padding);
      // make.height.mas_greaterThanOrEqualTo(50);
      make.height.mas_equalTo(view.mas_width).multipliedBy(1); // 高/宽
    }];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];

    animation.keyPath = @"position";

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, kStatusBarHeight + kNavigationBarHeight + 400)];
    [path addLineToPoint:CGPointMake(375, kStatusBarHeight + kNavigationBarHeight + 400)];

    animation.path = path.CGPath;

    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    animation.duration = 10;
    // view.layer.anchorPoint = CGPointMake(0, 0);

    [view.layer addAnimation:animation forKey:nil];
  }
}

@end
    
    
    
//
//  T104ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T104ViewController.h"

@interface T104ViewController ()

@end

@implementation T104ViewController

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

  UIView *mView = makeView(true);
  [self.view addSubview:mView];

  kMasKey(mView);
  [mView mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 100;
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
    make.left.offset(padding);
    make.right.offset(-padding);
    // make.height.mas_greaterThanOrEqualTo(50);
    make.height.mas_equalTo(mView.mas_width).multipliedBy(1); // 高/宽
  }];

  CAAnimationGroup *group = [CAAnimationGroup animation];

  NSMutableArray<CAAnimation *> *arrM = [NSMutableArray array];

  {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.toValue = @400;
    [arrM addObject:animation];
    // [mView.layer addAnimation:animation forKey:nil];
  }

  {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.toValue = @0.5;
    [arrM addObject:animation];
    // [mView.layer addAnimation:animation forKey:nil];
  }

  group.animations = arrM;
  group.removedOnCompletion = NO;
  group.fillMode = kCAFillModeForwards;

  [mView.layer addAnimation:group forKey:nil];
}

@end
    
    
    
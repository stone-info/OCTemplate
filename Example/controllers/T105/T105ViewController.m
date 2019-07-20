//
//  T105ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

/**
  UIView与核心动画区别?(掌握)

   1.核心动画只作用在layer.
   2.核心动画看到的都是假像,它并没有去修改UIView的真实位置.

   什么时候使用核心动画?
   1.当不需要与用户进行交互,使用核心动画
   2.当要根据路径做动画时,使用核心动画
   3.当做转场动画时, 使用核心动画 (核心动画转场类型比较多)
 */

#import "T105ViewController.h"

@interface T105ViewController () <CAAnimationDelegate>

@end

@implementation T105ViewController { UIView *_mView; }

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

- (void)entry {

  UIButton *button1;
  {
    UIButton *button = makeButton(true);
    button1 = button;
    [button setTitle:@"核心动画" forState:UIControlStateNormal];
    [self.view addSubview:button];

    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.top.offset(10);
      make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];

    [button addTarget:self action:@selector(coreAnimationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

  }

  UIButton *button2;
  {
    UIButton *button = makeButton(true);
    button2 = button;
    [button setTitle:@"UIView动画" forState:UIControlStateNormal];
    [self.view addSubview:button];

    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.top.offset(10);
      make.top.mas_equalTo(button1.mas_bottom).offset(10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];

    [button addTarget:self action:@selector(viewAnimationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  }

  UIButton *button3;
  {
    UIButton *button = makeButton(true);
    button3 = button;
    [button setTitle:@"重置" forState:UIControlStateNormal];
    [self.view addSubview:button];

    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.top.offset(10);
      make.top.mas_equalTo(button2.mas_bottom).offset(10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];

    [button addTarget:self action:@selector(resetAnimationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  }

  //____________2019-07-19_________________________________________________▲△__.

  _mView = makeView(true);
  _mView.backgroundColor = UIColor.orangeColor;
  [self.view addSubview:_mView];

  kMasKey(_mView);
  [_mView mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 100;
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + 200);
    make.left.offset(padding);
    make.right.offset(-padding);
    // make.height.mas_greaterThanOrEqualTo(50);
    make.height.mas_equalTo(_mView.mas_width).multipliedBy(1); // 高/宽
  }];

  {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    // tap.delegate = self; // 多个手势同时,shouldRecognizeSimultaneouslyWithGestureRecognizer
    // tap.numberOfTapsRequired = 2; // 点几次
    // tap.numberOfTouchesRequired = 2; // 几根手指
    [_mView addGestureRecognizer:tap];
    _mView.userInteractionEnabled = YES;
  }
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  CALayer *layer = [CALayer layer];
  layer.borderWidth   = 1.0;
  layer.borderColor   = HexRGBA(@"#C0C0C0", 1.0).CGColor;
  // layer.backgroundColor = HexRGBA(@"0xFFE1FF", 1.0).CGColor;
  layer.cornerRadius  = 4.0;
  layer.masksToBounds = YES;
  layer.frame         = _mView.frame;

  [self.view.layer addSublayer:layer];
}
//                              /*轻触 UITapGestureRecognizer*/
/*****************************************************************************************/
- (void)tapHandle:(UITapGestureRecognizer *)sender {
  NSLog(@"%s", __func__);
}

- (void)coreAnimationButtonClicked:(UIButton *)sender {
  NSLog(@"%s", __func__);

  CABasicAnimation *animation = [CABasicAnimation animation];

  animation.keyPath = @"position.y";

  animation.toValue = @(kScreenHeight - 200);

  animation.removedOnCompletion = NO;

  animation.fillMode = kCAFillModeForwards;

  animation.duration = 2;

  animation.delegate = self;

  [_mView.layer addAnimation:animation forKey:nil];
}

- (void)viewAnimationButtonClicked:(UIButton *)sender {
  NSLog(@"%s", __func__);

  [UIView transitionWithView:_mView duration:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
    CGRect frame = _mView.frame;

    frame.origin.y = kScreenHeight - 200 - frame.size.height * 0.5;

    _mView.frame = frame;

  } completion:^(BOOL finished) {

  }];

}

- (void)resetAnimationButtonClicked:(UIButton *)sender {
  NSLog(@"%s", __func__);
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [self.view.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
  [self entry];
}

#pragma mark - <CAAnimationDelegate>

/* Called when the animation begins its active duration. */
- (void)animationDidStart:(CAAnimation *)anim {
  NSLog(@"%s", __func__);
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
  NSLog(@"%s", __func__);
}

@end
    
    
    
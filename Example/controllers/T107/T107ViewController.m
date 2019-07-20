//
//  T107ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T107ViewController.h"

@interface T107ViewController ()

@end

@implementation T107ViewController { UIView *_mView; }

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
  _mView = makeView(true);

  _mView.layer.contents = (id) [UIImage imageNamed:@"headIcon"].CGImage;

  [self.view addSubview:_mView];

  kMasKey(_mView);
  [_mView mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 100;
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
    make.left.offset(padding);
    make.right.offset(-padding);
    make.height.mas_equalTo(_mView.mas_width).multipliedBy(1); // 高/宽
  }];

  [self addButtons];
}

- (void)buttonClicked:(UIButton *)sender {

  // [self demo1:sender];
  NSString *key = sender.currentTitle;
  (
    (void (^)()) @{
      @"上移": ^{
        [UIView animateWithDuration:1.0 animations:^{
          _mView.transform = CGAffineTransformTranslate(_mView.transform, 0, -100);
          // _mView.transform = CGAffineTransformMakeTranslation(0, -100);
        } completion:^(BOOL finished) {
          // _mView.transform = CGAffineTransformIdentity;
        }];
      },
      @"下移": ^{
        [UIView animateWithDuration:1.0 animations:^{
          _mView.transform = CGAffineTransformTranslate(_mView.transform, 0, 100);
        } completion:^(BOOL finished) {
          // _mView.transform = CGAffineTransformIdentity;
        }];
      },
      @"旋转": ^{

        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
          _mView.transform = CGAffineTransformRotate(_mView.transform, kDegreesToRadian(30));
          _mView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        } completion:^(BOOL finished) {
          // _mView.transform = CGAffineTransformIdentity;
        }];
      },
      @"缩放": ^{
        // https://blog.csdn.net/youshaoduo/article/details/53203211
        // usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。
        // initialSpringVelocity则表示初始的速度，数值越大一开始移动越快。
        [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
          _mView.transform = CGAffineTransformScale(_mView.transform, 0.5, 0.5);
        } completion:^(BOOL finished) {
          // _mView.transform = CGAffineTransformIdentity;
        }];

      },
    }[key] ?: ^{

    }
  )();
}

- (void)demo1:(UIButton *)sender {
  NSString *key = sender.currentTitle;
  (
    (void (^)()) @{
      @"上移": ^{
        [UIView animateWithDuration:1.0 animations:^{
          _mView.transform = CGAffineTransformMakeTranslation(0, -100);
        }];
      },
      @"下移": ^{

        [UIView animateWithDuration:1.0 animations:^{
          _mView.transform = CGAffineTransformMakeTranslation(0, 100);
        }];
      },
      @"旋转": ^{

        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
          _mView.transform = CGAffineTransformMakeRotation(kDegreesToRadian(30));
        } completion:^(BOOL finished) {

        }];
      },
      @"缩放": ^{

        // https://blog.csdn.net/youshaoduo/article/details/53203211
        // usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。
        // initialSpringVelocity则表示初始的速度，数值越大一开始移动越快。
        [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
          _mView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        } completion:^(BOOL finished) {

        }];

      },
    }[key] ?: ^{

    }
  )();
}

- (void)addButtons {

  UIButton *button1;
  {
    UIButton *button = button1 = makeButton(true);
    [button setTitle:@"缩放" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.bottom.offset(-kSafeAreaBottomHeight - 10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];
  }

  UIButton *button2;
  {
    UIButton *button = button2 = makeButton(true);
    [button setTitle:@"旋转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.bottom.mas_equalTo(button1.mas_top).offset(-10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];
  }

  UIButton *button3;
  {
    UIButton *button = button3 = makeButton(true);
    [button setTitle:@"下移" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.bottom.mas_equalTo(button2.mas_top).offset(-10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];
  }

  {
    UIButton *button = makeButton(true);
    [button setTitle:@"上移" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.bottom.mas_equalTo(button3.mas_top).offset(-10);
      make.left.offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];
  }

}


@end
    
    
    
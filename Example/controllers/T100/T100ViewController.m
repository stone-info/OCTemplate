//
//  T100ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T100ViewController.h"

@interface T100ViewController ()

@end

@implementation T100ViewController { UIView *_mView; }

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

  _mView = makeView(true);
  kBorder(_mView);

  _mView.frame = CGRectMake(100, 100, 100, 100);
  [self.view addSubview:_mView];

  _mView.layer.contents = (id) [UIImage imageNamed:@"headIcon"].CGImage;

  _mView.userInteractionEnabled = YES;

  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];

  [_mView addGestureRecognizer:tap];

  {
    CALayer *layer = [CALayer layer];
    layer.borderWidth   = 1.0;
    layer.borderColor   = HexRGBA(@"#C0C0C0", 1.0).CGColor;
    // layer.backgroundColor = HexRGBA(@"0xFFE1FF", 1.0).CGColor;
    layer.cornerRadius  = 4.0;
    layer.masksToBounds = YES;
    layer.frame = CGRectMake(100, 100, 100, 100);

    [self.view.layer addSublayer:layer];
  }

  CABasicAnimation *animation = [CABasicAnimation animation];

  animation.keyPath = @"position.x";

  animation.toValue = @300;

  // 动画完成时, 会自动删除动画.
  animation.removedOnCompletion = NO;
  animation.fillMode            = kCAFillModeForwards;

  [_mView.layer addAnimation:animation forKey:@"mView"];
}

- (void)tapHandle:(UITapGestureRecognizer *)sender {
  NSLog(@"%s", __func__);
}

// - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//
//
// }

@end
    
    
    
//
//  T101ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T101ViewController.h"

@interface T101ViewController ()

@end

@implementation T101ViewController { UIView *_mView; }

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
  CABasicAnimation * anim = [CABasicAnimation animation];
  // 描述下修改哪个属性产生动画
  // anim.keyPath = @"position";
  // 只能是layer属性
  /** keyPath 关键路径 */
  anim.keyPath = @"transform.scale";
  /** anim.fromValue 可以不写, 不写得话是现在的状态 */
  anim.fromValue = @0.1;
  //--------------------
  anim.toValue = @1.0;
  
  anim.duration = 0.5;
  /**  设置动画执行次数 */
  anim.repeatCount = MAXFLOAT;
  
  // 自动翻转(怎么去 怎么回来)
  anim.autoreverses = YES;
  /** 给图层layer添加动画 */
  [_mView.layer addAnimation:anim forKey:nil];
}

- (void)entry {

  _mView = makeView(true);
  _mView.layer.contents = (id) [UIImage imageNamed:@"心"].CGImage;
  [self.view addSubview:_mView];

  kMasKey(_mView);
  [_mView mas_makeConstraints:^(MASConstraintMaker *make) {
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
    make.left.offset(10);
    make.right.offset(-10);
    make.height.mas_equalTo(_mView.mas_width).multipliedBy(1); // 高/宽
  }];
}

@end
    
    
    

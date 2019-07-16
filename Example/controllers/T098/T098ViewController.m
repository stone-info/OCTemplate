//
//  T098ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T098ViewController.h"
#import "CALayer+YYAdd.h"

@interface T098View : UIView

@end

@implementation T098View
// - (void)drawRect:(CGRect)rect {
//  
// }
@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface T098ViewController ()

@end

@implementation T098ViewController { CALayer *_layer; }

// anchorPoint 默认值是 0.5 0.5

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

// - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//   [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//   [self.view.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
//   [self entry];
// }

// 隐式动画
// ●每一个UIView内部都默认矣联着-一个CALayer，我们可用称这个Layer为Root Layer (根层)
// ●所有的非Root Layer, 也就是手动创建的CALayer对象，都存在着隐式动画
// ●什么是隐式动画?
// ➢当对非Root Layer的 部分属性进行修改时，默认会自动产生- -些动画效果
// ➢而这些属性称为Animatable Properties (可动画属性)
// ●列举几个常见的Animatable Properties :
// ➢bounds :用于设置CALayer的宽度和高度。修改这个属性会产生缩放动画
// ➢backgroundColor :用于设置CALayer的背景色。修改这个属性会产生背景色的渐变动画
// ➢position :用于设置CALayer的位置。修改这个属性会产生平移动画

// 注: 只有非根层 layer 才有隐式动画 , 即 自己创建的layer , 可以通过 动画 事务关闭
- (void)entry {

  // [self demo1];

  _layer = [CALayer layer];
  _layer.borderWidth     = 1.0;
  _layer.borderColor     = HexRGBA(@"0x000000", 1.0).CGColor;
  _layer.backgroundColor = HexRGBA(@"0xFFC1C1", 1.0).CGColor;
  _layer.bounds          = CGRectMake(0, 0, 100, 100);
  _layer.position        = self.view.center;
  _layer.anchorPoint     = CGPointMake(1.0, 1.0);
  _layer.anchorPoint     = CGPointMake(0.5, 0.5);
  _layer.anchorPoint     = CGPointMake(0, 0);

  [self.view.layer addSublayer:_layer];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {

  [CATransaction begin];
  // 取消隐式动画
  // [CATransaction setDisableActions:YES];
  [CATransaction setDisableActions:NO];
  [CATransaction setAnimationDuration:3];
  _layer.position = CGPointMake(arc4random_uniform((int)kScreenWidth), arc4random_uniform((int)kScreenHeight));
  _layer.bounds = CGRectMake(0, 0, arc4random_uniform((int)kScreenWidth), arc4random_uniform((int)kScreenWidth));
  [CATransaction commit];


}

- (void)demo1 {
  CALayer *layer = [CALayer layer];
  layer.borderWidth     = 1.0;
  layer.borderColor     = HexRGBA(@"0x000000", 1.0).CGColor;
  layer.backgroundColor = HexRGBA(@"0xFFC1C1", 1.0).CGColor;
  layer.bounds          = CGRectMake(0, 0, 100, 100);
  layer.position        = self.view.center;
  layer.anchorPoint     = CGPointMake(1.0, 1.0);
  layer.anchorPoint     = CGPointMake(0.5, 0.5);
  layer.anchorPoint     = CGPointMake(0, 0);

  [self.view.layer addSublayer:layer];

  //____________2019-07-16_________________________________________________▲△__.
  printf("\033[1;7;48m____________2019-07-16_________________________________________________▲△__.\033[0m\n");

  T098View *view = T098View.new;
  kBorder(view);
  view.bounds = CGRectMake(0, 0, 100, 100);

  view.center = self.view.center;

  [self.view addSubview:view];

  // __block CGFloat angle = 0;
  //
  // setInterval(self, ^(dispatch_source_t timer) {
  //
  //   CGFloat d = angle++;
  //   NSLog(@"d = %lf", d);
  //   ani.rotatiotion(layer, d);
  // }, 62.5);
}

@end
    
    
    
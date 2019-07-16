//
//  T099ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T099ViewController.h"

@interface ClockView : UIView

@end

@implementation ClockView
// - (void)drawRect:(CGRect)rect {
//
// }
@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface  T099ViewController ()

@end

@implementation T099ViewController {
  UIImageView *_clockView;
  CALayer     *_layer;
}

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

  _clockView = makeImageView(true);

  UIImage *image = [UIImage imageNamed:@"钟表"];

  _clockView.image = image;

  [self.view addSubview:_clockView];

  kMasKey(_clockView);
  [_clockView mas_makeConstraints:^(MASConstraintMaker *make) {

    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
    make.left.offset(10);
    make.right.offset(-10);
    // make.height.mas_greaterThanOrEqualTo(50);
    make.height.mas_equalTo(_clockView.mas_width).multipliedBy(_clockView.image.size.height / _clockView.image.size.width); // 高/宽
  }];

  _layer = [CALayer layer];
  _layer.borderWidth     = 1.0;
  _layer.borderColor     = HexRGBA(@"0x000000", 1.0).CGColor;
  _layer.backgroundColor = HexRGBA(@"0xFFC1C1", 1.0).CGColor;
  [_clockView.layer addSublayer:_layer];

  __block int angle = 0;
  setInterval(self, ^(dispatch_source_t timer) {

    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    ani.rotatiotion(_layer, angle++);
    [CATransaction commit];
  }, 60);

}

// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
// /在调用视图控制器的layoutSubview方法之后调用。子类可以根据需要实现。缺省值是NOP。
- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  NSLog(@"%s", __func__);

  _layer.bounds      = CGRectMake(0, 0, 1, _clockView.bounds.size.width * 0.5 * 0.5 + 10);
  _layer.anchorPoint = CGPointMake(0.5, 1);
  _layer.position    = CGPointMake(_clockView.bounds.size.width * 0.5, _clockView.bounds.size.height * 0.5);

}

@end
    
    
    
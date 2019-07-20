//
//  T108ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "T108ViewController.h"

@interface T108ViewController ()

@end

@implementation T108ViewController

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

  UIView *mView = makeView(true);
  mView.backgroundColor = HexRGBA(@"#FFC1C1", 1.0);
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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {


}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  UITouch *touch = touches.anyObject;

  UIView  *view        = touch.view;
  CGPoint currentPoint = [touch locationInView:view];
  CGPoint previousPoint = [touch previousLocationInView:view];

  CGFloat offsetX = currentPoint.x - previousPoint.x;
  CGFloat offsetY = currentPoint.y - previousPoint.y;

  view.transform = CGAffineTransformTranslate(view.transform, offsetX, offsetY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {

}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {

}

@end
    
    
    
//
//  T110ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T110ViewController.h"

@interface T110View : UIView

@end

@implementation T110View

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {

  NSLogPoint(point); // 坐标系是 当前view内,

  if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) { return [super hitTest:point withEvent:event]; }

  // 判断是否在父view中
  // if (![self pointInside:point withEvent:event]) { return [super hitTest:point withEvent:event]; }

  for (NSUInteger i = 0; i < self.subviews.count; ++i) {
    UIView  *view    = self.subviews[i];
    // 这么做倒也可以, 不过子view 即便隐藏了 也触发事件, 坑爹呐
    // if (CGRectContainsPoint(view.frame, point)) { return view; }
    CGPoint cgPoint  = [self convertPoint:point toView:view];
    NSLogPoint(cgPoint);
    UIView  *fitView = [view hitTest:cgPoint withEvent:event]; // 自己判断 是否能点击的各种判断
    if (fitView) { return fitView; }
  }

  return [super hitTest:point withEvent:event];
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {

    self.userInteractionEnabled = YES;

    {
      UIButton *mView = makeButton(YES);
      // mView.hidden = YES;
      mView.userInteractionEnabled = YES;
      mView.tag                    = 100;
      [self addSubview:mView];

      kMasKey(mView);
      [mView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_top).offset(-10);
        make.left.offset(20);
        make.right.offset(-20);
        // make.height.mas_greaterThanOrEqualTo(50);
        make.height.mas_equalTo(mView.mas_width).multipliedBy(1); // 高/宽
      }];
      [mView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }

    {
      UIButton *mView = makeButton(YES);
      mView.userInteractionEnabled = YES;
      mView.tag                    = 200;
      [self addSubview:mView];

      kMasKey(mView);
      [mView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_bottom).offset(10);
        make.left.offset(20);
        make.right.offset(-20);
        // make.height.mas_greaterThanOrEqualTo(50);
        make.height.mas_equalTo(mView.mas_width).multipliedBy(1); // 高/宽
      }];

      [mView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

    }
  }
  return self;
}

- (void)buttonClicked:(UIButton *)sender {
  NSLog(@"%s", __func__);
  NSInteger i = sender.tag;
  NSLog(@"i = %li", i);
}

//                              /*轻触 UITapGestureRecognizer*/
/*****************************************************************************************/
- (void)tapHandle:(UITapGestureRecognizer *)sender {
  // NSLog(@"%s", __func__);
  // UIView    *view = sender.view;
  // NSInteger i     = view.tag;
  // NSLog(@"i = %li", i);
}

@end

//sn_note:=========  ============================ stone 🐳 ===========/

@interface T110ViewController ()

@end

@implementation T110ViewController

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

  T110View *mView = T110View.new;
  mView.backgroundColor = UIColor.orangeColor;
  [self.view addSubview:mView];

  kMasKey(mView);
  [mView mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 100;
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + 250);
    make.left.offset(padding);
    make.right.offset(-padding);
    // make.height.mas_greaterThanOrEqualTo(50);
    make.height.mas_equalTo(mView.mas_width).multipliedBy(1); // 高/宽
  }];
}

@end
    
    
    

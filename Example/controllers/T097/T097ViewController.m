//
//  T097ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T097ViewController.h"

@interface T097ViewController ()
@property (weak, nonatomic) UIImageView *mImageView;
@end

@implementation T097ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self entry];
}

- (void)injected {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  // [self.views removeAllObjects];
  // self.views = nil;
  [self entry];
}

// - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//   [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//   [self entry];
// }

- (void)entry {

  UIImageView *view = makeImageView(true);
  self.mImageView = view;
  view.image      = [UIImage imageNamed:@"headIcon"];
  [self.view addSubview:view];

  CGFloat padding = 150;

  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
    make.left.offset(padding);
    make.right.offset(-padding); //
    // make.height.mas_greaterThanOrEqualTo(50);
    make.height.mas_equalTo(view.mas_width).multipliedBy(view.image.size.height / view.image.size.width); // 高/宽
  }];

  //____________2019-07-16_________________________________________________▲△__.
  printf("\033[1;7;48m____________2019-07-16_________________________________________________▲△__.\033[0m\n");

  {

    UIImage *image = [UIImage imageNamed:@"headIcon2"];

    CALayer *layer = [CALayer layer];
    layer.borderWidth     = 1.0;
    layer.borderColor     = HexRGBA(@"0x000000", 1.0).CGColor;
    layer.backgroundColor = HexRGBA(@"0xFFC1C1", 1.0).CGColor;
    layer.bounds          = CGRectMake(0, 0, 100, image.size.height / image.size.width * 100);
    layer.position        = self.view.center;

    [self.view.layer addSublayer:layer];

    layer.contents = (id) image.CGImage;
  }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  NSLog(@"%s", __func__);

  [UIView animateWithDuration:0.5 animations:^{
    // self.mImageView.layer.transform = CATransform3DMakeRotation(kDegreesToRadian(30), 0, 0, 1);
    //    ani.rotatiotion(self.mImageView.layer, 30);

    //    ani.scaleY(self.mImageView.layer, 1.5);
    //    ani.scaleX(self.mImageView.layer, 1.5);
    //     ani.scale(self.mImageView.layer, 1.5);
    // ani.translationX(self.mImageView.layer, 100);
    ani.translation(self.mImageView.layer, 100);

  } completion:^(BOOL finished) {}];
}

@end
    
    
    

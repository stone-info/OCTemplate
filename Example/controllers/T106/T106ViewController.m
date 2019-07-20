//
//  T106ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T106ViewController.h"
#import "WheelView.h"

@interface T106ViewController ()
@property (weak, nonatomic) WheelView *wheelView;
@end

@implementation T106ViewController

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
  [self addViews];
  [self testArea];
}

- (void)testArea {

  UIView *mView = makeView(true);
  [self.view addSubview:mView];

  kMasKey(mView);
  [mView mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 10;
    make.top.mas_equalTo(_wheelView.mas_bottom).offset(padding);
    make.bottom.offset(-kSafeAreaBottomHeight);
    make.left.offset(padding);
    make.right.offset(-padding);
  }];

  UIImage *image = [UIImage imageNamed:@"LuckyAstrology"];

  UIImageView *imageViewTop;
  {
    UIImageView *imageView = makeImageView(true);
    imageViewTop = imageView;
    imageView.image = image;
    [mView addSubview:imageView];

    kMasKey(imageView);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
      CGFloat padding = 10;
      // make.top.offset(10);
      make.top.offset(padding);
      make.left.offset(padding);
      make.right.offset(-padding);
      make.height.mas_equalTo(imageView.mas_width).multipliedBy(imageView.image.size.height / imageView.image.size.width); // 高/宽
    }];
  }

  // CGImageCreateWithImageInRect 像素坐标...
  // [UIScreen mainScreen].scale
  NSLog(@"[UIScreen mainScreen].scale = %lf", [UIScreen mainScreen].scale);
  
  CGFloat scale =  [UIScreen mainScreen].scale;
  scale = 2.0;
  CGImageRef pImage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, image.size.width / 12.0 *scale , image.size.height * scale));
  UIImage *uiImage = [UIImage imageWithCGImage:pImage];

  {
    UIImageView *imageView = makeImageView(true);
    imageView.image = uiImage;
    [mView addSubview:imageView];

    kMasKey(imageView);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
      CGFloat padding = 10;
      // make.top.offset(10);
      make.top.mas_equalTo(imageViewTop.mas_bottom).offset(padding);
      make.bottom.offset(-padding);
      make.left.offset(padding);
      make.width.mas_equalTo(imageView.mas_height).multipliedBy(imageView.image.size.width / imageView.image.size.height); // 高/宽
    }];
  }
}

- (void)rotationButtonClicked:(UIButton *)sender {
  NSLog(@"%s", __func__);
  [_wheelView rotation];
}

- (void)suspendButtonClicked:(UIButton *)sender {
  NSLog(@"%s", __func__);
  [_wheelView suspend];
}

- (void)addViews {
  UIButton *buttonLeft;
  {
    UIButton *button = makeButton(true);
    buttonLeft = button;

    [button setTitle:@"旋转" forState:UIControlStateNormal];

    [self.view addSubview:button];

    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.top.offset(10);
      make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
      make.left.offset(10);
      // make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
    }];

    [button addTarget:self action:@selector(rotationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  }

  {
    UIButton *button = makeButton(true);
    [button setTitle:@"暂停" forState:UIControlStateNormal];

    [self.view addSubview:button];

    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.top.offset(10);
      make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
      make.left.mas_equalTo(buttonLeft.mas_right).offset(10);
      make.right.offset(-10);
      make.height.mas_greaterThanOrEqualTo(50);
      make.width.mas_equalTo(buttonLeft.mas_width);
    }];

    [button addTarget:self action:@selector(suspendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  }

  WheelView *view = [WheelView wheelView];
  self.wheelView = view;
  [self.view addSubview:view];

  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 10;
    // make.top.offset(10);
    // make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
    make.centerY.offset(0);
    make.centerX.offset(0);
    make.width.mas_equalTo(286);
    // make.left.offset(padding);
    // make.right.offset(-padding);
    // make.height.mas_greaterThanOrEqualTo(50);
    make.height.mas_equalTo(view.mas_width).multipliedBy(1); // 高/宽
  }];
}

- (void)dealloc {
  NSLog(@"■■■■■■\t%@ is dead ☠☠☠\t■■■■■■", [self class]);
}

@end
    
    
    

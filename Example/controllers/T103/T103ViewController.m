//
//  T103ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T103ViewController.h"

@interface T103ViewController ()

@end

@implementation T103ViewController {
  NSString    *_imageName;
  UIImageView *_imageView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the imageView.
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
//   NSLog(@"%s", __func__);
//   [self.imageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//   [self.imageView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
//
//   [self entry];
// }

- (void)entry {
  _imageView = UIImageView.new;
  _imageView.userInteractionEnabled = YES;

  _imageName = @"1";
  _imageView.image = [UIImage imageNamed:_imageName];
  [self.view addSubview:_imageView];

  kMasKey(_imageView);
  [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    CGFloat padding = 10;
    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
    make.left.offset(padding);
    make.right.offset(-padding);
    // make.height.mas_greaterThanOrEqualTo(50);
    // make.height.mas_equalTo(imageView.mas_width).multipliedBy(1); // 高/宽
    make.height.mas_equalTo(_imageView.mas_width).multipliedBy(_imageView.image.size.height / _imageView.image.size.width); // 高/宽
  }];

  {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    // tap.delegate = self; // 多个手势同时,shouldRecognizeSimultaneouslyWithGestureRecognizer
    // tap.numberOfTapsRequired = 2; // 点几次
    // tap.numberOfTouchesRequired = 2; // 几根手指
    [_imageView addGestureRecognizer:tap];
  }
}

static int _i = 1;
//                              /*轻触 UITapGestureRecognizer*/
/*****************************************************************************************/
- (void)tapHandle:(UITapGestureRecognizer *)sender {

  NSLog(@"%s", __func__);

  int i = _imageName.intValue + 1;
  if (i == 4) { i = 1; }
  _imageName = kStringFormat(@"%d", i);
  _imageView.image = [UIImage imageNamed:_imageName];

  CATransition *transition = [CATransition animation];

  // | 类型字符串 | 效果说明 | 关键字 | 方向 |
  // | :------:  | :------: | :------: | :------: |
  // | fade       |   交叉淡化过渡 |  YES  |
  // | push        |   新视图把旧视图推出去 |  YES  |
  // | moveIn      |   新视图移到旧视图上面 |  YES  |
  // | reveal      |   将旧视图移开,显示下面的新视图  |  YES  |
  // | cube         |  立方体翻滚效果 |
  // | oglFlip     |  上下左右翻转效果 |
  // | suckEffect    |  收缩效果，如一块布被抽走 |  | NO|
  // | rippleEffect  |  水滴效果 |  | NO|
  // | pageCurl       |  向上翻页效果 |  | |
  // | pageUnCurl     |  向下翻页效果 |  | |
  // | cameraIrisHollowOpen    |  相机镜头打开效果 |  | NO |
  // | cameraIrisHollowClose    |  相机镜头关闭效果 |  | NO |

  // transition.type = @"cube";
  // transition.type = @"rippleEffect";
  // transition.type = @"push";
  transition.type = @"pageCurl";

  transition.duration = 2;

  // 设置动画的起始位置
  transition.startProgress = 0.3;
  // 设置动画的结束位置
  transition.endProgress   = 0.8;

  [_imageView.layer addAnimation:transition forKey:nil];
}

@end




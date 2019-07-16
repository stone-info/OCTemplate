//
//  T095ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T095ViewController.h"

@interface T095ViewController ()

@property (assign, nonatomic) CGPoint startPoint;

@property (strong, nonatomic) UIView      *coverView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation T095ViewController

- (UIView *)coverView {

  if (_coverView == nil) {
    _coverView = [UIView new];
    _coverView.backgroundColor = UIColor.blackColor;
    _coverView.alpha           = 0.2;
    // [self.view addSubview:_coverView];
    [self.imageView addSubview:_coverView];
  }
  return _coverView;
}

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
  self.imageView                        = makeImageView(true);
  self.imageView.userInteractionEnabled = YES;
  self.imageView.image                  = [UIImage imageNamed:@"bbb"];

  [self.view addSubview:self.imageView];

  CGFloat padding = 10;
  kMasKey(self.imageView);
  [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight + padding, padding, kSafeAreaBottomHeight + padding, padding));
  }];

  UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
  [self.imageView addGestureRecognizer:panGestureRecognizer];
}

- (void)panHandle:(UIPanGestureRecognizer *)sender {
  NSLog(@"%s", __func__);

  UIView *view = sender.view;
  NSLog(@"view = %@", view);

  CGPoint currentPoint = [sender locationInView:self.imageView];
  // CGPoint currentPoint = [sender translationInView:self.imageView];

  switch (sender.state) {
    case UIGestureRecognizerStateBegan: {
      self.startPoint = currentPoint;
      break;
    }

    case UIGestureRecognizerStateChanged: {

      CGFloat x      = self.startPoint.x;
      CGFloat y      = self.startPoint.y;
      CGFloat width  = currentPoint.x - self.startPoint.x;
      CGFloat height = currentPoint.y - self.startPoint.y;

      self.coverView.frame = CGRectMake(x, y, width, height);

      break;
    }

    case UIGestureRecognizerStateEnded: {

      CGRect rect = self.coverView.frame;
      [self.coverView removeFromSuperview];
      self.coverView = nil;

      UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
      UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
      [path addClip];

      CGContextRef pContext = UIGraphicsGetCurrentContext();

      [self.imageView.layer renderInContext:pContext];

      UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();

      self.imageView.image = newImage;

      break;
    }

    case UIGestureRecognizerStateCancelled: {
      break;

    }

    case UIGestureRecognizerStateFailed: {

      break;
    }

    default:

      break;
  }

}


@end
    
    
    
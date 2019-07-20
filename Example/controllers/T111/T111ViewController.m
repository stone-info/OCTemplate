//
//  T111ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T111ViewController.h"

@interface T111View : UIView

@end

@implementation T111View
- (void)drawRect:(CGRect)rect {

  CGFloat      centerX = rect.size.width * 0.5;
  CGFloat      centerY = rect.size.height * 0.5;
  CGFloat      height  = rect.size.height;
  CGFloat      width   = rect.size.width;
  UIBezierPath *path   = [UIBezierPath bezierPath];
  [HexRGBA(@"0xFFC1C1", 1.0) setStroke];
  [path moveToPoint:CGPointMake(centerX, 0)];
  [path addLineToPoint:CGPointMake(centerX, height)];
  [path moveToPoint:CGPointMake(0, centerY)];
  [path addLineToPoint:CGPointMake(width, centerY)];
  [path stroke];

}
@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface T111ViewController () <UIGestureRecognizerDelegate>

@end

@implementation T111ViewController

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
  mView.layer.contents = (id) [UIImage imageNamed:@"headIcon"].CGImage;
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

  {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    tap.delegate = self; // 多个手势同时,shouldRecognizeSimultaneouslyWithGestureRecognizer
    // tap.numberOfTapsRequired = 2; // 点几次
    // tap.numberOfTouchesRequired = 2; // 几根手指
    [mView addGestureRecognizer:tap];
    mView.userInteractionEnabled = YES;
  }

  [self.view layoutIfNeeded];

  {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = HexRGBA(@"#FFC1C1", 1.0).CGColor;
    CGPoint centerPoint = [self.view convertPoint:mView.center toView:mView];
    layer.bounds   = CGRectMake(0, 0, 1, mView.bounds.size.height);
    layer.position = centerPoint;
    [mView.layer addSublayer:layer];
  }
  {
    CALayer *layer        = [CALayer layer];
    layer.backgroundColor = HexRGBA(@"#FFC1C1", 1.0).CGColor;
    CGPoint centerPoint = [self.view convertPoint:mView.center toView:mView];
    layer.bounds   = CGRectMake(0, 0, mView.bounds.size.width, 1);
    layer.position = centerPoint;
    [mView.layer addSublayer:layer];
  }

  // {
  //   T111View *view = T111View.new;
  //   // view.layer.contents = (id) [UIImage imageNamed:@"headIcon"].CGImage;
  //   view.backgroundColor = UIColor.whiteColor;
  //   kBorder(view);
  //   [self.view addSubview:view];
  //   kMasKey(view);
  //   [view mas_makeConstraints:^(MASConstraintMaker *make) {
  //     CGFloat padding = 10;
  //     // make.top.offset(10);
  //     make.top.offset(kStatusBarHeight + kNavigationBarHeight + padding);
  //     make.left.offset(padding);
  //     make.right.offset(-padding);
  //     // make.height.mas_greaterThanOrEqualTo(50);
  //     make.height.mas_equalTo(view.mas_width).multipliedBy(1); // 高/宽
  //   }];
  // }

  {
    UIView *mView = makeView(true);

    mView.bounds = CGRectMake(0, 0, 150, 150);

    mView.center = CGPointMake(self.view.center.x, self.view.center.y + 100);

    [self.view addSubview:mView];

    CGRect rect = CGRectInset(mView.frame, 10, 10);

    NSLogRect(mView.frame);

    NSLogRect(rect);

    CALayer *layer = [CALayer layer];
    layer.borderWidth   = 1.0;
    layer.borderColor   = HexRGBA(@"#C0C0C0", 1.0).CGColor;
    // layer.backgroundColor = HexRGBA(@"0xFFE1FF", 1.0).CGColor;
    layer.cornerRadius  = 4.0;
    layer.masksToBounds = YES;
    layer.frame         = rect;

    [self.view.layer addSublayer:layer];

    {
      __kindof UIView              *view      = mView;
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandle:)];
      // longPress.delegate = self;
      // longPress.minimumPressDuration = 3; // 长按多长时间有反应
      // longPress.allowableMovement    = 100;  // 这是什么鬼????可能是从 按住的点那 100半径以内的区域 随便来回都能触发方法的东西吧
      [view addGestureRecognizer:longPress];
      view.userInteractionEnabled = YES;

    }
  }

  {
    UIView *mView = makeView(true);
    [self.view addSubview:mView];

    kMasKey(mView);
    [mView mas_makeConstraints:^(MASConstraintMaker *make) {
      CGFloat padding = 150;
      // make.top.offset(10);
      make.bottom.offset(-kSafeAreaBottomHeight - padding + 100);
      make.left.offset(padding);
      make.right.offset(-padding);
      // make.height.mas_greaterThanOrEqualTo(50);
      make.height.mas_equalTo(mView.mas_width).multipliedBy(1); // 高/宽
    }];

    {
      __kindof UIView        *view = mView;
      UIPanGestureRecognizer *pan  = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
      // pan.delegate = self;
      [view addGestureRecognizer:pan];
      view.userInteractionEnabled = YES;
    }
  }
}

//                              /*拖拽 UIPanGestureRecognizer*/
/*****************************************************************************************/
- (void)panHandle:(UIPanGestureRecognizer *)sender {
  SNPanDrag;
}

//                              /*长按 UILongPressGestureRecognizer*/
/*****************************************************************************************/
- (void)longPressHandle:(UILongPressGestureRecognizer *)sender {
  // NSLog(@"%s", __func__);
  SNLongPressDrag(sender);
  // do {
  //   UIGestureRecognizerState state = sender.state;
  //   static CGPoint           previousPoint;
  //   switch (state) {
  //     case UIGestureRecognizerStateBegan: {
  //       previousPoint = [sender locationInView:sender.view.superview];
  //       break;
  //     }
  //     case UIGestureRecognizerStateChanged: {
  //       CGPoint currentPoint = [sender locationInView:sender.view.superview];
  //       sender.view.transform = CGAffineTransformTranslate(sender.view.transform, currentPoint.x - previousPoint.x, currentPoint.y - previousPoint.y);
  //       previousPoint = currentPoint;
  //       break;
  //     }
  //     case UIGestureRecognizerStateEnded: {
  //       break;
  //     }
  //     case UIGestureRecognizerStateCancelled: {
  //       break;
  //     }
  //     default: {
  //       break;
  //     }
  //   }
  // } while (0);
}

/*轻触 UITapGestureRecognizer*/
/*****************************************************************************************/
- (void)tapHandle:(UITapGestureRecognizer *)sender {
  NSLog(@"%s", __func__);
}

#pragma mark - <UIGestureRecognizerDelegate>
// https://www.jianshu.com/p/c3aa07e33d33

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
// 处理一些同时进行的手势操作：
// 开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势，
// 用处：可以在控件指定的位置使用手势识别
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
  UIView  *view  = gestureRecognizer.view;
  CGRect  rect   = view.frame;
  CGPoint point  = [gestureRecognizer locationInView:view];
  CGRect  cgRect = CGRectMake(0, 0, CGRectGetWidth(rect) * 0.5, CGRectGetHeight(rect));

  if (CGRectContainsPoint(cgRect, point)) { return YES; }

  return NO;
}

// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
//
// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
// 是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
// 是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；
// 如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  // return YES; // 这不就是冒泡吗?
  return NO;  // 阻止冒泡
}

// called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
// return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
//
// note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES

// 这个两个方法也是用来控制手势的互斥执行的
// 这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return YES;
}

// 这个两个方法也是用来控制手势的互斥执行的
// 这个方法返回YES，第一个和第二个互斥时，第二个会失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return YES;
}

// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
// 手指触摸屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等
// 此方法在window对象在有触摸事件发生时，调用gesture recognizer的touchesBegan:withEvent:方法之前调用，如果返回NO,则gesture recognizer不会看到此触摸事件。(默认情况下为YES)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
  return YES;
}

// called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
// 手指按压屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
  return YES;
}
@end
    
    
    
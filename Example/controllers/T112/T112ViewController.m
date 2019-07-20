//
//  T112ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T112ViewController.h"

@interface T112ViewController () <UIGestureRecognizerDelegate>

@end

@implementation T112ViewController

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
  {
    UIImageView *mView = makeImageView(true);
    mView.image = [UIImage imageNamed:@"headIcon"];
    [self.view addSubview:mView];

    kMasKey(mView);
    [mView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.center;
    }];

    {
      __kindof UIView             *view     = mView;
      UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandle:)];
      rotation.delegate = self;
      [view addGestureRecognizer:rotation];
      view.userInteractionEnabled = YES;
    }

    {
      __kindof UIView          *view  = mView;
      UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandle:)];
      pinch.delegate = self;
      [view addGestureRecognizer:pinch];
      view.userInteractionEnabled = YES;
    }
  }
}
//                              /*缩放 UIPinchGestureRecognizer*/
/*****************************************************************************************/
- (void)pinchHandle:(UIPinchGestureRecognizer *)sender {
  // SNPinchScale;
  sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
  sender.scale          = 1.0;
}

//                              /*旋转 UIRotationGestureRecognizer*/
/*****************************************************************************************/
- (void)rotationHandle:(UIRotationGestureRecognizer *)sender {
  // SNRotationRotate;
  NSLog(@"%s", __func__);
  sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
  sender.rotation       = 0;
}

#pragma mark - <UIGestureRecognizerDelegate>
// https://www.jianshu.com/p/c3aa07e33d33

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
// 处理一些同时进行的手势操作：
// 开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势，
// 用处：可以在控件指定的位置使用手势识别
// - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//
//   return YES;
// }

// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
//
// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
// 是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
// 是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；
// 如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return YES;
}

// called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
// return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
//
// note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES

// 这个两个方法也是用来控制手势的互斥执行的
// 这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
// - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//   return YES;
// }
//
// // 这个两个方法也是用来控制手势的互斥执行的
// // 这个方法返回YES，第一个和第二个互斥时，第二个会失效
// - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//   return YES;
// }
//
// // called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
// // 手指触摸屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等
// // 此方法在window对象在有触摸事件发生时，调用gesture recognizer的touchesBegan:withEvent:方法之前调用，如果返回NO,则gesture recognizer不会看到此触摸事件。(默认情况下为YES)
// - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//   return YES;
// }
//
// // called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
// // 手指按压屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等
// - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
//   return YES;
// }

@end
    
    
    

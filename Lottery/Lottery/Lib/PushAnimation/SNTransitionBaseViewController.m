//
//  SNTransitionBaseViewController.m
//  present
//
//  Created by stone on 2019/7/11.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNTransitionBaseViewController.h"
#import "SNTransitionPresenPushStyleAnimator.h"
#import "SNTransitionDismissPopStyleAnimator.h"

@interface SNTransitionBaseViewController () <UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenTransition;

@end

@implementation SNTransitionBaseViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

//封装原presentViewController:animated:completion:接口
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^)(void))completion pushStyle:(BOOL)isPushStyle {

  if (animated && isPushStyle) {
    viewControllerToPresent.transitioningDelegate = self;

    //添加自定义的返回手势
    UIScreenEdgePanGestureRecognizer *screenGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)];
    screenGesture.delegate = self;
    screenGesture.edges    = UIRectEdgeLeft;

    [viewControllerToPresent.view addGestureRecognizer:screenGesture];

    if ([viewControllerToPresent isKindOfClass:[UINavigationController class]]) {
      [screenGesture requireGestureRecognizerToFail:((UINavigationController *) viewControllerToPresent).interactivePopGestureRecognizer];
    }
  }

  [self presentViewController:viewControllerToPresent animated:animated completion:completion];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
  return [SNTransitionPresenPushStyleAnimator new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  return [SNTransitionDismissPopStyleAnimator new];
}

//返回手势需要实现
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {

  if ([animator isKindOfClass:[SNTransitionDismissPopStyleAnimator class]]) {
    return self.percentDrivenTransition;
  }

  return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {

  if ([animator isKindOfClass:[SNTransitionPresenPushStyleAnimator class]]) {
    return self.percentDrivenTransition;
  }

  return nil;
}

#pragma mark - UIGestureRecognizer

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
  return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
    return NO;//和NavigationController自带的返回手势不能同时执行
  } else {
    return YES;
  }
}

- (void)onPanGesture:(UIScreenEdgePanGestureRecognizer *)gesture {

  float progress = [gesture translationInView:self.view].x / [UIScreen mainScreen].bounds.size.width;

  NSLog(@"progress = %f", progress);


  if (gesture.state == UIGestureRecognizerStateBegan) {

    self.percentDrivenTransition = [UIPercentDrivenInteractiveTransition new];

    [self dismissViewControllerAnimated:YES completion:NULL];

  } else if (gesture.state == UIGestureRecognizerStateChanged) {

    [self.percentDrivenTransition updateInteractiveTransition:progress];

  } else if (gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateEnded) {

    if (progress > 0.5) {
      [self.percentDrivenTransition finishInteractiveTransition];
    } else {
      [self.percentDrivenTransition cancelInteractiveTransition];
    }
    self.percentDrivenTransition = nil;
  }
}

@end

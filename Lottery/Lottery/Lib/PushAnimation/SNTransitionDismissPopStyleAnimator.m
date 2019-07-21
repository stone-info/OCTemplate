//
//  SNTransitionDismissPopStyleAnimator.m
//  present
//
//  Created by stone on 2019/7/11.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNTransitionDismissPopStyleAnimator.h"
#import <objc/message.h>

// #define kPPTransitionDismissPopStyleDuration 0.3
#define kPPTransitionDismissPopStyleDuration 0.25

@implementation SNTransitionDismissPopStyleAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
  return kPPTransitionDismissPopStyleDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
  UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIView *container = [transitionContext containerView];

  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  CGRect  fromVCRect  = fromVC.view.frame;
  fromVCRect.origin.x = 0;
  fromVC.view.frame   = fromVCRect;

  [container addSubview:toVC.view];

  CGRect toVCRect = toVC.view.frame;
  toVCRect.origin.x = -screenWidth / 2;
  toVC.view.frame   = toVCRect;

  [container addSubview:fromVC.view];

  fromVCRect.origin.x = screenWidth;
  toVCRect.origin.x   = 0;

  [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    fromVC.view.frame = fromVCRect;
    toVC.view.frame   = toVCRect;
  } completion:^(BOOL finished) {
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];//动画结束、取消必须调用
  }];
}
@end

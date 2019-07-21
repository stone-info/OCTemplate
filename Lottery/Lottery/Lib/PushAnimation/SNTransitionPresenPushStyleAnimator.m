//
//  SNTransitionPresenPushStyleAnimator.m
//  present
//
//  Created by stone on 2019/5/23.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNTransitionPresenPushStyleAnimator.h"

#define kPPTransitionPresenPushStyleDuration 0.25

@implementation SNTransitionPresenPushStyleAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
  return kPPTransitionPresenPushStyleDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
  UIViewController *fromVC    = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toVC      = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIView           *container = [transitionContext containerView];

  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  CGRect  fromVCRect  = fromVC.view.frame;
  fromVCRect.origin.x = 0; // -100
  fromVC.view.frame   = fromVCRect;
  [container addSubview:toVC.view];

  CGRect toVCRect = toVC.view.frame;
  toVCRect.origin.x = screenWidth;
  toVC.view.frame   = toVCRect;

  // fromVCRect.origin.x = -screenWidth;
  toVCRect.origin.x = 0;

  [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    fromVC.view.frame = fromVCRect;
    toVC.view.frame   = toVCRect;
  } completion:^(BOOL finished) {
    [fromVC.view removeFromSuperview];
    [transitionContext completeTransition:finished];//动画结束、取消必须调用
  }];
}
@end

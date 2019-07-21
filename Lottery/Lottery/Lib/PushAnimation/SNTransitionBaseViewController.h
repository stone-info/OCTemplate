//
//  SNTransitionBaseViewController.h
//  present
//
//  Created by stone on 2019/7/11.
//  Copyright © 2019 stone. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface SNTransitionBaseViewController : UIViewController

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^)(void))completion pushStyle:(BOOL)isPushStyle;

@end

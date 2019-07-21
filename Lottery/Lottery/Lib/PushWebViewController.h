//
//  PushWebViewController.h
//  VVZ
//
//  Created by stone on 2019/7/11.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNTransitionBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PushWebViewController : SNTransitionBaseViewController

@property (copy, nonatomic) NSString *urlString;
@property (copy, nonatomic) NSString *titleString;

@property (assign, nonatomic) NSTimeInterval duration;

@end

NS_ASSUME_NONNULL_END

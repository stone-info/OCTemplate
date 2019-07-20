//
//  WheelView.h
//  Example
//
//  Created by stone on 2019/7/19.
//  Copyright © 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WheelView : UIView

+ (instancetype)wheelView;

- (void)rotation;

- (void)suspend;
@end

NS_ASSUME_NONNULL_END

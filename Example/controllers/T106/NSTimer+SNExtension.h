//
//  NSTimer+SNExtension.h
//  Example
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SNExecuteTimerBlock) (NSTimer *timer);

@interface NSTimer (SNExtension)
+ (NSTimer *)sn_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval executeBlock:(SNExecuteTimerBlock)block repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END

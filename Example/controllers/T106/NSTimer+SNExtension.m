//
//  NSTimer+SNExtension.m
//  Example
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "NSTimer+SNExtension.h"

@implementation NSTimer (SNExtension)

+ (NSTimer *)sn_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval executeBlock:(SNExecuteTimerBlock)block repeats:(BOOL)repeats {
  NSTimer *timer = [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(sn_executeTimer:) userInfo:[block copy] repeats:repeats];
  return timer;
}

+ (void)sn_executeTimer:(NSTimer *)timer {
  SNExecuteTimerBlock block = timer.userInfo;
  if (block) { block(timer); }
}

@end

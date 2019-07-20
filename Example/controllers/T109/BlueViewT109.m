//
//  BlueViewT109.m
//  Example
//
//  Created by stone on 2019/7/19.
//  Copyright © 2019 stone. All rights reserved.
//

#import "BlueViewT109.h"

@implementation BlueViewT109
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
  NSLog(@"%s", __func__);
  return [super hitTest:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  NSLog(@"BlueViewT109 %s", __func__);
}

@end

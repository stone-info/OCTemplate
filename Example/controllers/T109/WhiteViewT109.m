//
//  WhiteViewT109.m
//  Example
//
//  Created by stone on 2019/7/19.
//  Copyright © 2019 stone. All rights reserved.
//

#import "WhiteViewT109.h"
#import "GreenViewT109.h"

@implementation WhiteViewT109

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  NSLog(@"WhiteViewT109 %s", __func__);
}

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {

  NSLog(@"%s", __func__);

  UIView *view = [super hitTest:point withEvent:event];
  //
  // for (NSUInteger i = 0; i < self.subviews.count; ++i) {
  //   UIView *uiView = self.subviews[i];
  //
  //   if ([uiView isKindOfClass:[GreenViewT109 class]]) {
  //     GreenViewT109 *greenViewT109 = (GreenViewT109 *) uiView;
  //     return greenViewT109;
  //   }
  // }

  return view;
}
@end

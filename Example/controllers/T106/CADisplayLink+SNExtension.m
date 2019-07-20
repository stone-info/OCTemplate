//
//  CADisplayLink+SNExtension.m
//  Example
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "CADisplayLink+SNExtension.h"

@implementation CADisplayLink (SNExtension)

- (void)setExecuteBlock:(SNExecuteDisplayLinkBlock)executeBlock {
  objc_setAssociatedObject(self, @selector(executeBlock), [executeBlock copy], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (SNExecuteDisplayLinkBlock)executeBlock {
  return objc_getAssociatedObject(self, @selector(executeBlock));
}

+ (CADisplayLink *)displayLinkWithExecuteBlock:(SNExecuteDisplayLinkBlock)block {

  CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(sn_executeDisplayLink:)];
  displayLink.executeBlock = [block copy];
  return displayLink;
}

+ (void)sn_executeDisplayLink:(CADisplayLink *)displayLink {

  if (displayLink.executeBlock) {
    displayLink.executeBlock(displayLink);
  }
}
@end

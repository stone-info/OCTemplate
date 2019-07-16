//
//  T091DrawImage.m
//  Example
//
//  Created by stone on 2019/7/14.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T091DrawImage.h"

@implementation T091DrawImage

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
  // Drawing code

  // UIImage *image = [UIImage imageNamed:@"headIcon"];
  UIImage *image = [UIImage imageNamed:@"pingpu"];

  // [image drawAtPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect))];
  // [image drawAtPoint:CGPointZero];
  // [image drawInRect:rect];
  [image drawAsPatternInRect:rect];
}

@end

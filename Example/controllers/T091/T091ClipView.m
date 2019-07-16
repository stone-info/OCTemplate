//
//  T091ClipView.m
//  Example
//
//  Created by stone on 2019/7/14.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T091ClipView.h"

@implementation T091ClipView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
  // Drawing code≤
  UIImage *image = [UIImage imageNamed:@"headIcon"];

  // UIRectClip(CGRectMake(0, 0, 350, 350));

  [image drawAtPoint:CGPointZero];


}

@end

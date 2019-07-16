//
//  SNDownloadProgressView.m
//  Example
//
//  Created by stone on 2019/7/14.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNDownloadProgressView.h"

@implementation SNDownloadProgressView

- (void)drawRect:(CGRect)rect {

  CGContextRef pContext = UIGraphicsGetCurrentContext();

  CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));

  CGFloat startAngle = -M_PI_2;

  CGFloat angle = self.progressValue * M_PI * 2;

  CGFloat endAngle = startAngle + angle;

  UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:MIN(CGRectGetWidth(rect), CGRectGetHeight(rect)) * 0.5 - 10 startAngle:startAngle endAngle:endAngle clockwise:YES];

  CGContextAddPath(pContext, path.CGPath);

  CGContextStrokePath(pContext);

}

- (void)setProgressValue:(CGFloat)progressValue {
  _progressValue = progressValue;

}


@end

//
//  SNT090View.m
//  Example
//
//  Created by stone on 2019/7/14.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNT090View.h"

@implementation SNT090View

- (void)drawRect:(CGRect)rect {
  NSLog(@"%s", __func__);

  NSLogRect(rect);

  // [self demo1];

  // [self quxian];

  //// Color Declarations
  UIColor* color = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
  UIColor* color3 = [UIColor colorWithRed: 0.982 green: 1 blue: 0 alpha: 1];
  UIColor* color4 = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];

  //// Rectangle Drawing
  UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 298, 145)];
  [color4 setFill];
  [rectanglePath fill];


  //// Star Drawing
  UIBezierPath* starPath = [UIBezierPath bezierPath];
  [starPath moveToPoint: CGPointMake(64.5, 13.75)];
  [starPath addLineToPoint: CGPointMake(67.23, 17.74)];
  [starPath addLineToPoint: CGPointMake(71.87, 19.11)];
  [starPath addLineToPoint: CGPointMake(68.92, 22.94)];
  [starPath addLineToPoint: CGPointMake(69.06, 27.77)];
  [starPath addLineToPoint: CGPointMake(64.5, 26.15)];
  [starPath addLineToPoint: CGPointMake(59.94, 27.77)];
  [starPath addLineToPoint: CGPointMake(60.08, 22.94)];
  [starPath addLineToPoint: CGPointMake(57.13, 19.11)];
  [starPath addLineToPoint: CGPointMake(61.77, 17.74)];
  [starPath closePath];
  [color3 setFill];
  [starPath fill];
  [UIColor.blackColor setStroke];
  starPath.lineWidth = 1;
  [starPath stroke];


  //// Star 2 Drawing
  UIBezierPath* star2Path = [UIBezierPath bezierPath];
  [star2Path moveToPoint: CGPointMake(38.25, 32.5)];
  [star2Path addLineToPoint: CGPointMake(45.39, 42.53)];
  [star2Path addLineToPoint: CGPointMake(57.51, 45.97)];
  [star2Path addLineToPoint: CGPointMake(49.81, 55.62)];
  [star2Path addLineToPoint: CGPointMake(50.15, 67.78)];
  [star2Path addLineToPoint: CGPointMake(38.25, 63.7)];
  [star2Path addLineToPoint: CGPointMake(26.35, 67.78)];
  [star2Path addLineToPoint: CGPointMake(26.69, 55.62)];
  [star2Path addLineToPoint: CGPointMake(18.99, 45.97)];
  [star2Path addLineToPoint: CGPointMake(31.11, 42.53)];
  [star2Path closePath];
  [color3 setFill];
  [star2Path fill];
  [color setStroke];
  star2Path.lineWidth = 1;
  [star2Path stroke];


  //// Star 3 Drawing
  UIBezierPath* star3Path = [UIBezierPath bezierPath];
  [star3Path moveToPoint: CGPointMake(78.5, 32.75)];
  [star3Path addLineToPoint: CGPointMake(81.23, 36.74)];
  [star3Path addLineToPoint: CGPointMake(85.87, 38.11)];
  [star3Path addLineToPoint: CGPointMake(82.92, 41.94)];
  [star3Path addLineToPoint: CGPointMake(83.06, 46.77)];
  [star3Path addLineToPoint: CGPointMake(78.5, 45.15)];
  [star3Path addLineToPoint: CGPointMake(73.94, 46.77)];
  [star3Path addLineToPoint: CGPointMake(74.08, 41.94)];
  [star3Path addLineToPoint: CGPointMake(71.13, 38.11)];
  [star3Path addLineToPoint: CGPointMake(75.77, 36.74)];
  [star3Path closePath];
  [color3 setFill];
  [star3Path fill];
  [UIColor.blackColor setStroke];
  star3Path.lineWidth = 1;
  [star3Path stroke];


  //// Star 4 Drawing
  UIBezierPath* star4Path = [UIBezierPath bezierPath];
  [star4Path moveToPoint: CGPointMake(71.5, 54.75)];
  [star4Path addLineToPoint: CGPointMake(74.23, 58.74)];
  [star4Path addLineToPoint: CGPointMake(78.87, 60.11)];
  [star4Path addLineToPoint: CGPointMake(75.92, 63.94)];
  [star4Path addLineToPoint: CGPointMake(76.06, 68.77)];
  [star4Path addLineToPoint: CGPointMake(71.5, 67.15)];
  [star4Path addLineToPoint: CGPointMake(66.94, 68.77)];
  [star4Path addLineToPoint: CGPointMake(67.08, 63.94)];
  [star4Path addLineToPoint: CGPointMake(64.13, 60.11)];
  [star4Path addLineToPoint: CGPointMake(68.77, 58.74)];
  [star4Path closePath];
  [color3 setFill];
  [star4Path fill];
  [UIColor.blackColor setStroke];
  star4Path.lineWidth = 1;
  [star4Path stroke];


  //// Star 5 Drawing
  UIBezierPath* star5Path = [UIBezierPath bezierPath];
  [star5Path moveToPoint: CGPointMake(56.5, 73.75)];
  [star5Path addLineToPoint: CGPointMake(58.88, 77.22)];
  [star5Path addLineToPoint: CGPointMake(62.92, 78.41)];
  [star5Path addLineToPoint: CGPointMake(60.35, 81.75)];
  [star5Path addLineToPoint: CGPointMake(60.47, 85.96)];
  [star5Path addLineToPoint: CGPointMake(56.5, 84.55)];
  [star5Path addLineToPoint: CGPointMake(52.53, 85.96)];
  [star5Path addLineToPoint: CGPointMake(52.65, 81.75)];
  [star5Path addLineToPoint: CGPointMake(50.08, 78.41)];
  [star5Path addLineToPoint: CGPointMake(54.12, 77.22)];
  [star5Path closePath];
  [color3 setFill];
  [star5Path fill];
  [UIColor.blackColor setStroke];
  star5Path.lineWidth = 1;
  [star5Path stroke];


}

- (void)quxian {
  CGContextRef pContext = UIGraphicsGetCurrentContext();
  UIBezierPath *path    = [UIBezierPath bezierPath];

  [path moveToPoint:CGPointMake(50, 250)];

  [path addQuadCurveToPoint:CGPointMake(250, 250) controlPoint:CGPointMake(50, 50)];

  CGContextAddPath(pContext, path.CGPath);
  CGContextStrokePath(pContext);
}

- (void)demo1 {
  CGContextRef pContext = UIGraphicsGetCurrentContext();

  UIBezierPath *path = [UIBezierPath bezierPath];

  [path moveToPoint:CGPointMake(50, 200)];
  [path addLineToPoint:CGPointMake(100, 100)];

  [path moveToPoint:CGPointMake(50, 280)];
  [path addLineToPoint:CGPointMake(100, 180)];

  [path addLineToPoint:CGPointMake(150, 280)];

  CGContextSetLineWidth(pContext, 10);
  //     kCGLineCapButt,
  //     kCGLineCapRound,
  //     kCGLineCapSquare
  CGContextSetLineCap(pContext, kCGLineCapRound); // 起点 , 重点 样式
  //     kCGLineJoinMiter,
  //     kCGLineJoinRound,
  //     kCGLineJoinBevel
  CGContextSetLineJoin(pContext, kCGLineJoinRound); // 连接处的样式

  // 设置颜色
  // [HexRGBA(@"#FFC1C1", 1.0) setStroke];
  [HexRGBA(@"#FFC1C1", 1.0) set];

  CGContextAddPath(pContext, path.CGPath);

  CGContextStrokePath(pContext);
}
@end

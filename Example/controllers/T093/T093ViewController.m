//
//  T093ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T093ViewController.h"

@interface T093View : UIView

@end

@implementation T093View
- (void)drawRect:(CGRect)rect {

  CGContextRef pContext = UIGraphicsGetCurrentContext();

  CGContextSaveGState(pContext);

  {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 300)];
    [path addLineToPoint:CGPointMake(300, 300)];
    CGContextSetLineWidth(pContext, 10);
    [HexRGBA(@"#FFC1C1", 1.0) set];
    CGContextAddPath(pContext, path.CGPath);
    CGContextStrokePath(pContext);
  }

  CGContextRestoreGState(pContext);

  {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 400)];
    [path addLineToPoint:CGPointMake(300, 400)];
    // CGContextSetLineWidth(pContext, 10);
    // [HexRGBA(@"#F5F5F5", 1.0) set];
    CGContextAddPath(pContext, path.CGPath);
    CGContextStrokePath(pContext);
  }
}

@end

//sn_note:=========  ============================ stone 🐳 ===========/


@interface T093ViewTranslate : UIView

@end

@implementation T093ViewTranslate
- (void)drawRect:(CGRect)rect {

  CGContextRef pContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(pContext);
  {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 50)];
    // CGContextTranslateCTM(pContext, 100, 50);
    CGContextRotateCTM(pContext, kDegreesToRadian(8));
    [HexRGBA(@"#FFC1C1", 1.0) set];
    CGContextAddPath(pContext, path.CGPath);
    // CGContextStrokePath(pContext);
    CGContextFillPath(pContext);
  }
  CGContextRestoreGState(pContext);
  {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 50)];
    [HexRGBA(@"#FFC1C1", 1.0) set];
    CGContextAddPath(pContext, path.CGPath);
    CGContextStrokePath(pContext);
    // CGContextFillPath(pContext);
  }
}
@end

//sn_note:=========  ============================ stone 🐳 ===========/

@interface T093ViewController ()

@end

@implementation T093ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self entry];
}

- (void)injected {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  // [self.views removeAllObjects];
  // self.views = nil;
  [self entry];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [self entry];
}

- (void)entry {

  // T093View *view = T093View.new;
  T093ViewTranslate *view = T093ViewTranslate.new;
  kBorder(view);

  view.backgroundColor = UIColor.whiteColor;

  [self.view addSubview:view];

  CGFloat padding = 10;

  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight + padding, padding, kSafeAreaBottomHeight + padding, padding));
  }];

}

@end
    
    
    
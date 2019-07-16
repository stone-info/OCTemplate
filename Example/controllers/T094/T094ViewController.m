//
//  T094ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T094ViewController.h"
#import "UIImage+ImageExtension.h"

@interface T094View : UIView

@end

@implementation T094View
- (void)drawRect:(CGRect)rect {

}
@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface  T094ViewController ()

@end

@implementation T094ViewController

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
  UIImage *image = [UIImage imageNamed:@"headIcon"];

  // UIImage *uiImage = kImageCutCircle(image);//

  // UIImage *uiImage = [image borderCircleImageWithBorderWidth:10 borderColor:HexRGBA(@"#FFC1C1", 1.0)];

  UIImage *uiImage = kImageCutCircleWithBorder(image, 20, HexRGBA(@"#FFA500", 1.0));
  
  // UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
  //
  // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
  // [path addClip];
  //
  // [image drawAtPoint:CGPointZero];
  // NSString *string = @"hello world";
  // [string drawAtPoint:CGPointMake(10, 20) withAttributes:nil];
  //
  // UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
  //
  // UIGraphicsEndImageContext();

  UIImageView *view = makeImageView(true);

  [self.view addSubview:view];

  view.image = uiImage;

  CGFloat padding = 10;

  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    // make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight + padding, padding, kSafeAreaBottomHeight + padding, padding));

    // make.top.offset(10);
    make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
    make.left.offset(10);
    make.right.offset(-10);
    make.height.mas_equalTo(view.mas_width).multipliedBy(image.size.height / image.size.width); // 高/宽
  }];

  UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);

  CGContextRef pContext = UIGraphicsGetCurrentContext();

  [self.view.layer renderInContext:pContext];

  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  NSData *representation = UIImagePNGRepresentation(newImage);

  // [representation writeToFile:@"/Users/stone/Desktop/abcbcbc.png" atomically:YES];
}

- (void)dealloc {
  NSLog(@"■■■■■■\t%@ is dead ☠☠☠\t■■■■■■", [self class]);
}

// - (UIImage *)imageCutCircle:(UIImage *)image {
//   // UIImage *image = [UIImage imageNamed:@"headIcon"];
//   UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//   UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//   [path addClip];
//   [image drawAtPoint:CGPointZero];
//   UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
//   UIGraphicsEndImageContext();
//   return uiImage;
// }
//
// + (UIImage *(^)(UIImage *))imageCutCircle {
//   return ^UIImage *(UIImage *image) {
//     UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//     UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//     [path addClip];
//     [image drawAtPoint:CGPointZero];
//     UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
//     UIGraphicsEndImageContext();
//     return uiImage;
//   };
// }
- (void)drawPictureWithCallback:(UIBezierPath *(^)(CGContextRef ctx, BOOL *strokePath, BOOL *fillPath))callback {
  BOOL         strokePath = YES;
  BOOL         fillPath   = NO;
  CGContextRef ctx        = UIGraphicsGetCurrentContext();
  UIBezierPath *path      = callback(ctx, &strokePath, &fillPath);
  CGContextAddPath(ctx, path.CGPath);
  if (strokePath && fillPath) {
    CGContextDrawPath(ctx, kCGPathFillStroke);
    return;
  }
  !strokePath ?: CGContextStrokePath(ctx);
  !fillPath ?: CGContextFillPath(ctx);

  // CGContextSaveGState(ctx); // 保存现场
  // CGContextRestoreGState(ctx); // 恢复现场
}

- (void)drawRect:(CGRect)rect {

  [self drawPictureWithCallback:^UIBezierPath *(CGContextRef ctx, BOOL *strokePath, BOOL *fillPath) {
    // *fillPath = YES;
    CGContextSetLineWidth(ctx, 1);
    CGContextSetFillColorWithColor(ctx, HexRGBA(@"0x008B8B", 1.0).CGColor);
    CGContextSetStrokeColorWithColor(ctx, HexRGBA(@"0x000000", 1.0).CGColor);

    UIBezierPath *path = [UIBezierPath bezierPath];

    return path;
  }];
}
@end
    
    
    
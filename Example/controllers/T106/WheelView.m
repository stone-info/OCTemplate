//
//  WheelView.m
//  Example
//
//  Created by stone on 2019/7/19.
//  Copyright © 2019 stone. All rights reserved.
//

#import "WheelView.h"
#import "CADisplayLink+SNExtension.h"
#import "NSTimer+SNExtension.h"

@interface WheelViewButton : UIButton

@end

@implementation WheelViewButton

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {

  // NSLogPoint(point); // 坐标系是 当前view内,

  if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) { return [super hitTest:point withEvent:event]; }
  if (![self pointInside:point withEvent:event]) { return [super hitTest:point withEvent:event]; }

  if (CGRectContainsPoint(CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5), point)) {
    return [super hitTest:point withEvent:event];
  }else{
    return nil;
  }


  // for (NSUInteger i = 0; i < self.subviews.count; ++i) {
  //   UIView  *view    = self.subviews[i];
  //   // 这么做倒也可以, 不过子view 即便隐藏了 也触发事件, 坑爹呐
  //   // if (CGRectContainsPoint(view.frame, point)) { return view; }
  //   CGPoint cgPoint  = [self convertPoint:point toView:view];
  //   UIView  *fitView = [view hitTest:cgPoint withEvent:event]; // 自己判断 是否能点击的各种判断
  //   if (fitView) { return fitView; }
  // }

  // return [super hitTest:point withEvent:event];
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    kBorder(self);
  }
  return self;
}

- (void)layoutSubviews {
  // 一定要调用super的layoutSubviews
  [super layoutSubviews];

  // kBorder(self.imageView);
}

- (void)setHighlighted:(BOOL)highlighted {

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {

  //       make.height.mas_equalTo(143);
  //       make.width.mas_equalTo(68);


  CGFloat width  = contentRect.size.width * 0.5;
  CGFloat height = width * 92 / 80.0;
  CGFloat x      = 34 - width * 0.5;
  CGFloat y      = 20;
  return CGRectMake(x, y, width, height);
}

@end

//sn_note:=========  ============================ stone 🐳 ===========/


@interface WheelView () <CAAnimationDelegate>

@property (strong, nonatomic) CADisplayLink *displayLink;

@end

@implementation WheelView {
  __weak IBOutlet UIImageView *_contentView;
  __weak  WheelViewButton     *_selectedButton;
}

- (CADisplayLink *)displayLink {

  if (_displayLink == nil) {
    _displayLink = [CADisplayLink displayLinkWithTarget:[SNWeakProxy proxyWithTarget:self] selector:@selector(executeDispalyLink:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

    // __weak typeof(self) weakSelf = self;
    //  _displayLink = [CADisplayLink displayLinkWithExecuteBlock:^(CADisplayLink *displayLink) {
    //   __weak typeof(weakSelf) strongSelf = weakSelf;
    //    NSLog(@"%s", __func__);
    //    kRotate(_contentView, 1);
    //  }];
    //  [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

  }
  return _displayLink;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  _contentView.userInteractionEnabled = YES;
}

- (void)addButtons {

  UIImage *image        = [UIImage imageNamed:@"LuckyAstrology"];
  UIImage *imagePressed = [UIImage imageNamed:@"LuckyAstrologyPressed"];

  for (NSInteger i = 0; i < 12; ++i) {

    UIImage *uiImage;
    UIImage *uiImagePressed;
    CGFloat scale = [UIScreen mainScreen].scale;
    scale = 2.0;
    {
      CGFloat    width  = image.size.width / 12.0 * scale;
      CGFloat    height = image.size.height * scale;
      CGImageRef pImage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(width * i, 0, width, height));
      uiImage           = [UIImage imageWithCGImage:pImage];
    }

    {
      CGFloat    width  = imagePressed.size.width / 12.0 * scale;
      CGFloat    height = imagePressed.size.height * scale;
      CGImageRef pImage = CGImageCreateWithImageInRect(imagePressed.CGImage, CGRectMake(width * i, 0, width, height));
      uiImagePressed = [UIImage imageWithCGImage:pImage];
    }

    // NSLogSize(uiImage.size);

    WheelViewButton *button = WheelViewButton.new;

    if (i == 0) {
      button.selected = YES;
      _selectedButton = button;
    }

    [button setTitle:@"" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
    [button setImage:uiImage forState:UIControlStateNormal];
    [button setImage:uiImagePressed forState:UIControlStateSelected];

    [_contentView addSubview:button];
    kMasKey(button);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.center;
      make.height.mas_equalTo(143);
      make.width.mas_equalTo(68);
    }];
    button.layer.anchorPoint = CGPointMake(0.5, 1);
    button.transform         = CGAffineTransformMakeRotation(kDegreesToRadian(30 * i));
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

    button.tag = 10 + i;
  }
}

- (void)buttonClicked:(WheelViewButton *)sender {
  NSLog(@"%s", __func__);
  NSLog(@"sender.tag = %li", sender.tag);

  if (_selectedButton != nil && _selectedButton.selected == YES) { _selectedButton.selected = NO; }

  sender.selected = YES;

  _selectedButton = sender;

  // CGAffineTransform transform = sender.transform;
  //
  // CGFloat a = kRadianToDegrees(transform.a);
  // CGFloat b = kRadianToDegrees(transform.b);
  // CGFloat c = kRadianToDegrees(transform.c);
  // CGFloat d = kRadianToDegrees(transform.d);
  //
  // NSLog(@"a = %lf", a);
  // NSLog(@"b = %lf", b);
  // NSLog(@"c = %lf", c);
  // NSLog(@"d = %lf", d);
  //
  // // struct CGAffineTransform {
  // //   CGFloat a, b, c, d;
  // //   CGFloat tx, ty;
  // // };
  //
  // NSString *string = NSStringFromCGAffineTransform(transform);
  // NSLog(@"string = %@", string);

}

- (void)injected {

  // SNAnimation.rotatiotion(button.layer, kDegreesToRadian(50));
}

+ (instancetype)wheelView {
  UINib     *nib       = [UINib nibWithNibName:@"WheelView" bundle:nil];
  WheelView *wheelView = [nib instantiateWithOwner:nil options:nil].lastObject;
  [wheelView addButtons];
  return wheelView;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    UINib *nib = [UINib nibWithNibName:@"WheelView" bundle:nil];
    self       = [nib instantiateWithOwner:nil options:nil].lastObject;
    self.frame = frame;
    [self addButtons];
  }
  return self;
}

- (void)rotation {

  // CABasicAnimation *animation = [CABasicAnimation animation];
  // animation.keyPath = @"transform.rotation";
  // animation.fromValue = @(kDegreesToRadian(0));
  // animation.toValue   = @(kDegreesToRadian(360));
  // animation.duration  = 3;
  // animation.repeatCount = MAXFLOAT;
  // [_contentView.layer addAnimation:animation forKey:nil];

  [self.displayLink setPaused:NO];

}

- (void)suspend {
  [self.displayLink setPaused:YES];
}

- (void)executeDispalyLink:(CADisplayLink *)sender {
  NSLog(@"%s", __func__);
  // kRotate(_contentView, 30);
  kRotate(_contentView, 1);
}

- (IBAction)startChoose:(UIButton *)sender {

  [self.displayLink setPaused:YES];

  CABasicAnimation *anim = [CABasicAnimation animation];
  anim.keyPath  = @"transform.rotation";
  anim.toValue  = @(M_PI * 4);
  anim.duration = 0.5;
  anim.delegate = self;
  [_contentView.layer addAnimation:anim forKey:nil];

}

#pragma mark - <CAAnimationDelegate>

- (void)animationDidStart:(CAAnimation *)anim {

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

  CGAffineTransform transform = _selectedButton.transform;

  //通过transform获取当前旋转的度数
  CGFloat angle = atan2(transform.b, transform.a);

  CGFloat d = kRadianToDegrees(angle);

  NSLog(@"d = %lf", d);

  NSLog(@"%f", angle);

  _contentView.transform = CGAffineTransformMakeRotation(-angle);
}

- (void)dealloc {
  NSLog(@"■■■■■■\t%@ is dead ☠☠☠\t■■■■■■", [self class]);
  if (_displayLink) {
    [_displayLink invalidate];
  }
}
@end

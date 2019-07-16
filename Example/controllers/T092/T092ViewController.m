//
//  T092ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T092ViewController.h"

@interface T092View : UIView

@property (weak, nonatomic) NSTimer         *timer;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) CGFloat       snowY;
@end

@implementation T092View
- (void)doSomeThing:(CADisplayLink *)sender {
  _snowY += 10;
  [self setNeedsDisplay];

  if (_snowY > kScreenHeight) {
    _snowY = 0;
  }
}

- (void)dosomething:(NSTimer *)timer {
  // NSLog(@"%s", __func__);
  _snowY += 10;
  [self setNeedsDisplay];

  if (_snowY > kScreenHeight) {
    _snowY = 0;

  }
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {

    // [self.timer invalidate];
    // self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dosomething:) userInfo:nil repeats:YES];
    // [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.displayLink invalidate];

    // 当每一次屏幕刷新的时候就会调用指定的方法(屏幕每一秒刷新60次)
    self.displayLink                          = [CADisplayLink displayLinkWithTarget:self selector:@selector(doSomeThing:)];

    // 每秒刷新的次数
    self.displayLink.preferredFramesPerSecond = 48;
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  UIImage *image = [UIImage imageNamed:@"snow"];
  [image drawAtPoint:CGPointMake(0, _snowY)];
}

- (void)dealloc {
  NSLog(@"■■■■■■\t%@ is dead ☠☠☠\t■■■■■■", [self class]);
  [self.timer invalidate];
}
@end

//sn_note:=========  ============================ stone 🐳 ===========/

@interface T092ViewController ()

@end

@implementation T092ViewController

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
  T092View *view = T092View.new;
  view.backgroundColor = UIColor.blackColor;
  kBorder(view);
  [self.view addSubview:view];

  CGFloat padding = 10;

  kMasKey(view);
  [view mas_makeConstraints:^(MASConstraintMaker *make) {

    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight + padding, padding, kSafeAreaBottomHeight + padding, padding));
  }];
}


@end
    
    
    
//
//  PushWebViewController.m
//  VVZ
//
//  Created by stone on 2019/7/11.
//  Copyright © 2019 stone. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import "PushWebViewController.h"

@interface PushWebViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation PushWebViewController

- (NSTimeInterval)duration {

  /** _duration lazy load */
  if (_duration == 0) {
    _duration = 60 * 60 * 24;
  }
  return _duration;
}

- (void)addTimer {
  if (self.timer == nil) {
    // 主动添加到RunLoop
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(working:) userInfo:@{@"username": @"stone"} repeats:YES];
  }
}

- (void)deleteTimer {
  [self.timer invalidate];
  self.timer = nil;
}

// 这个步骤最关键 , 从后台返回到前台时 只有当前页面没被销毁 才会接收通知....
- (void)dealloc {
  NSLog(@"■■■■■■\t%@ is dead ☠☠☠\t■■■■■■", [self class]);

  @try {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
  } @catch (NSException *exception) {
    NSLog(@"Exception occurred: %@, %@", exception, [exception userInfo]);
  }
}

- (void)applicationDidBecomeActive {
  NSLog(@"%s", __func__);

  [self addTimer];
}

- (void)applicationDidEnterBackground {
  NSLog(@"%s", __func__);

  [self deleteTimer];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  {
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];

    // 2.设置网络状态改变后的处理
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      // 当网络状态改变了, 就会调用这个block
      switch (status) {
        case AFNetworkReachabilityStatusUnknown:  // 未知网络
          NSLog(@"未知网络");
          break;

        case AFNetworkReachabilityStatusNotReachable:  // 没有网络(断网)
          NSLog(@"没有网络(断网)");

          [self deleteTimer];

          break;

        case AFNetworkReachabilityStatusReachableViaWWAN:  // 手机自带网络
          NSLog(@"手机自带网络");
          [self addTimer];
          break;

        case AFNetworkReachabilityStatusReachableViaWiFi:  // WIFI
          NSLog(@"WIFI");
          [self addTimer];
          break;
      }
    }];

    // 3.开始监控
    [manager startMonitoring];
  }
  {
    UILabel *label = [[UILabel alloc] init];
    /** GPU 优化 */
    label.opaque              = YES;
    label.backgroundColor     = [UIColor whiteColor];
    label.layer.masksToBounds = YES;
    //------------------------------
    label.numberOfLines       = 0;
    label.textColor           = [UIColor blackColor];
    label.textAlignment       = NSTextAlignmentCenter;
    // label.text                = @"百度一下, 你就知道";
    label.text                = self.titleString;
    label.font                = kPingFangSCMedium(16);

    [self.view addSubview:label];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.center.equalTo(label.superview);
      make.top.mas_equalTo(self.view.mas_top).offset(kStatusBarHeight);
      make.left.mas_equalTo(self.view.mas_left).offset(0);
      make.right.mas_equalTo(self.view.mas_right).offset(0);
      // make.width.mas_equalTo(50);
      make.height.mas_equalTo(kNavigationBarHeight);
    }];

    self.titleLabel = label;
  }

  self.view.backgroundColor = UIColor.whiteColor;

  UIWebView *webView = UIWebView.new;
  self.webView = webView;
  // webView.scalesPageToFit = YES;
  // NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
  // NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
  // NSURL *url = [NSURL URLWithString:@"http://192.168.1.110:8090"];
  NSURL *url = [NSURL URLWithString:self.urlString];

  // NSURL *url = self.urlString;

  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [webView loadRequest:request];
  webView.delegate = self;

  webView.scrollView.showsHorizontalScrollIndicator = NO;
  webView.scrollView.delegate                       = self;
  webView.scrollView.bounces                        = NO;
  [self.view addSubview:webView];

  kMasKey(webView);
  [webView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight, 0, kSafeAreaBottomHeight, 0));
  }];

  {
    // bi-back_button_black-ei
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];

    // button.layer.borderWidth   = 1.0;
    // button.layer.borderColor   = [UIColor orangeColor].CGColor;
    // button.layer.cornerRadius  = 4.0;
    // button.layer.masksToBounds = YES;

    [button setAdjustsImageWhenHighlighted:NO];

    [button setImage:kImageWithName(@"bi-back_button_black-ei") forState:UIControlStateNormal];

    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];

    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      // make.center.equalTo(label.superview);
      make.top.mas_equalTo(self.view.mas_top).offset(kStatusBarHeight);
      make.left.mas_equalTo(self.view.mas_left).offset(0);
      make.width.mas_equalTo(50);
      make.height.mas_equalTo(kNavigationBarHeight);
    }];
  }

  {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = HexRGBA(@"#c0c0c0", 1.0).CGColor;
    layer.frame           = CGRectMake(0, kStatusBarHeight + kNavigationBarHeight - 0.5, kScreenWidth, 0.5);
    [self.view.layer addSublayer:layer];
  }
}

- (void)btnClicked:(UIButton *)sender {
  [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - <UIWebViewDelegate>

- (void)webViewDidFinishLoad:(UIWebView *)webView {

  // NSString *htmlCodeString = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.example.com/connect.php"] encoding:NSUTF8StringEncoding error:nil];
  // NSLog(@"htmlCodeString = %@", htmlCodeString);
  // // NSString *currentURL = webView.request.URL.absoluteString;
  // setTimeout(self, ^(dispatch_source_t timer) {
  //   NSString *theTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
  //   self.titleLabel = theTitle;
  // }, 3000);
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y)];
}

//____________2019-07-12_________________________________________________▲△__.

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSLog(@"%s", __func__);
  //================================================/
  // [self.timer invalidate];
  // self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(working:) userInfo:nil repeats:YES];
  // [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
  //================================================/

  [self addTimer];
}

- (void)working:(NSTimer *)timer {
  // timer.userInfo
  NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  NSLog(@"%s", __func__);

  [self deleteTimer];
}

@end

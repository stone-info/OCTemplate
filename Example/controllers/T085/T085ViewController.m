//
//  T085ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T085ViewController.h"
#import "SNJSOCModel.h"

@interface T085ViewController () <UIWebViewDelegate, UIScrollViewDelegate>
@property (nonatomic, weak) UIWebView   *webView;
@property (nonatomic, strong) JSContext *jsContext;
@end

@implementation T085ViewController
- (void)catchJsLog {
  if (DEBUG) {
    JSContext *ctx = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    ctx[@"h5log"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color) {
      char *h5Template;
      switch ([color toUInt32]) {
        case 0:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
        case 1:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;41m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
        case 2:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;42m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
        case 3:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;34;49m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
        case 4:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
        case 5:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
        default:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n--------------------------------------------------------------------------------------------------\n";
          break;
      }
      printf(h5Template, LOG_TIME, filename.toString.UTF8String, lineNumber.toUInt32, key.toString.UTF8String, obj.toString.UTF8String);
    };

    ctx[@"h5GroupBegin"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color) {
      char *h5Template;
      switch ([color toUInt32]) {
        case 0:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;105m %s \n\033[0m";
          break;
        case 1:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;41m %s \n\033[0m";
          break;
        case 2:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;42m %s \033[0m\n";
          break;
        case 3:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;34;49m %s \033[0m\n";
          break;
        case 4:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n";
          break;
        case 5:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n";
          break;
        default:
          h5Template = "<%s %s:%d>-: \033[1;97;42m %s \033[0m ▼\n\033[1;97;100m %s \033[0m\n";
          break;
      }
      NSString *emoji;
      if ([key.toString containsString:@"req"]) { emoji = @"🦋"; }
      if ([key.toString containsString:@"res"]) { emoji = @"🐬"; }
      if ([key.toString containsString:@"error"]) { emoji = @"💊"; }
      printf(h5Template, LOG_TIME, filename.toString.UTF8String, lineNumber.toUInt32, key.toString.UTF8String, [NSString stringWithFormat:@"%@ %@", emoji, obj].UTF8String);
    };

    ctx[@"h5GroupEnd"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color) {
      char *h5Template;
      switch ([color toUInt32]) {
        case 0:
          h5Template = "\033[1;97;104m %s \n\033[0m";
          break;
        case 1:
          h5Template = "\033[1;97;41m %s \n\033[0m";
          break;
        case 2:
          h5Template = "\033[1;97;104m %s \033[0m\n";
          break;
        case 3:
          h5Template = "\033[1;97;104m %s \033[0m\n";
          break;
        case 4:
          h5Template = "\033[1;97;104m %s \033[0m\n";
          break;
        case 5:
          h5Template = "\033[1;97;104m %s \033[0m\n";
          break;
        default:
          h5Template = "\033[1;97;104m %s \033[0m\n";
          break;
      }
      NSString *emoji;
      if ([key.toString containsString:@"req"]) { emoji = @"🐝"; }
      if ([key.toString containsString:@"res"]) { emoji = @"🐳"; }
      if ([key.toString containsString:@"error"]) { emoji = @"☠"; }
      printf(h5Template, [NSString stringWithFormat:@"%@ %@", emoji, obj].UTF8String);
    };

    ctx[@"h5NormalLog"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color) {
      char *h5Template;
      switch ([color toUInt32]) {
        case 0:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;100m %s \n\033[0m";
          break;
        case 1:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;41m %s \n\033[0m";
          break;
        case 2:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;100m %s \033[0m\n";
          break;
        case 3:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;100m %s \033[0m\n";
          break;
        case 4:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;100m %s \033[0m\n";
          break;
        case 5:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;100m %s \033[0m\n";
          break;
        default:
          h5Template = "\033[1;97;42m %s \033[1;97;104m -> \033[0m\033[1;97;100m %s \033[0m\n";
          break;
      }
      printf(h5Template, key.toString.UTF8String, obj.toString.UTF8String);
    };
    ctx[@"console"][@"log"] = ^(JSValue *msg) {
      printf("\033[1;94;48m %s \n\033[0m", [NSString stringWithFormat:@"%@", msg].UTF8String);
    };

    ctx[@"console"][@"warn"] = ^(JSValue *msg) {
      printf("\033[1;94;48m %s \n\033[0m", [NSString stringWithFormat:@"%@", msg].UTF8String);
    };

    ctx[@"console"][@"error"] = ^(JSValue *msg) {
      printf("\033[1;94;48m %s \n\033[0m", [NSString stringWithFormat:@"%@", msg].UTF8String);
    };
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = UIColor.whiteColor;

  UIWebView *webView = UIWebView.new;
  self.webView = webView;
  // webView.scalesPageToFit = YES;
  // NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
  // NSURL        *url     = [NSURL URLWithString:@"http://www.baidu.com"];
  NSURL *url = [NSURL URLWithString:@"http://192.168.1.110:8090"];

  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [webView loadRequest:request];
  webView.delegate = self;

  webView.scrollView.showsHorizontalScrollIndicator = NO;
  webView.scrollView.delegate                       = self;
  webView.scrollView.bounces                        = NO;
  [self.view addSubview:webView];

  kMasKey(webView);
  [webView mas_makeConstraints:^(MASConstraintMaker *make) { make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight, 0, kSafeAreaBottomHeight, 0)); }];

  //  // 一个JSContext对象，就类似于Js中的window，只需要创建一次即可。
  //  self.jsContext = [[JSContext alloc] init];
  //
  //  // jscontext可以直接执行JS代码。
  //  [self.jsContext evaluateScript:@"var num = 10"];
  //  [self.jsContext evaluateScript:@"var squareFunc = function(value) { return value * 2 }"];
  //  // 计算正方形的面积
  //  JSValue *square = [self.jsContext evaluateScript:@"squareFunc(num)"];
  //
  //  // 也可以通过下标的方式获取到方法
  //  JSValue *squareFunc = self.jsContext[@"squareFunc"];
  //  JSValue *value = [squareFunc callWithArguments:@[@"20"]];
  //  NSLog(@"%@", square.toNumber);
  //  NSLog(@"%@", value.toNumber);

  [self catchJsLog];
}

#pragma mark - <UIWebViewDelegate>

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
  // 通过模型调用方法，这种方式更好些。
  SNJSOCModel *model = [[SNJSOCModel alloc] init];
  self.jsContext[@"OCModel"] = model;
  model.jsContext = self.jsContext;
  model.webView   = self.webView;

  self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
    context.exception = exceptionValue;
    NSLog(@"异常信息：%@", exceptionValue);
  };
}

- (void)webViewDidStartLoad:(UIWebView *)webView {

}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y)];
}

@end
    
    
    

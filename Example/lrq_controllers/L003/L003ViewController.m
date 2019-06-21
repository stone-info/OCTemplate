//
//  L003ViewController.m
//  objc_template
//
//  Created by LRQ on 2019/04/05.
//  Copyright © 2019 LRQ. All rights reserved.
//

#import "L003ViewController.h"

@interface L003ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation L003ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.imageView];
  UIImage *launchImg = [UIImage imageNamed:[self getLaunchImage]];
  NSLog(@"launchImg = %@", launchImg);
  self.imageView.image = launchImg;
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.imageView.frame = self.view.bounds;
}

- (UIImageView *)imageView {

  /** _imageView lazy load */

  if (_imageView == nil) {
    _imageView = [UIImageView new];
  }
  return _imageView;
}

- (NSString *)getLaunchImage {
  CGSize screenSize = [UIScreen mainScreen].bounds.size;
  NSArray *infoArr = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
  NSString *imgName;
  for (NSDictionary *dict in infoArr) {
    NSLog(@"dict = %@", dict);
    CGSize size = CGSizeFromString(dict[@"UILaunchImageSize"]);
    imgName = dict[@"UILaunchImageName"];
    //首先是竖向, 并且图片名必须由Portrait
    if (![dict[@"UILaunchImageOrientation"] isEqualToString:@"Portrait"]) {
      continue;
    }
    NSRange range = [imgName rangeOfString:@"-" options:NSBackwardsSearch];
    NSString *nameSuffix = [imgName substringFromIndex:range.location+range.length];
    nameSuffix = [nameSuffix substringToIndex:nameSuffix.length-1];
    NSInteger imgHeight = [nameSuffix integerValue];

    if ((screenSize.width == size.width)
        &&
        (screenSize.height == size.height)) {
      if ([dict[@"UILaunchImageMinimumOSVersion"] isEqualToString:@"12.0"]) {
        if ((imgHeight / @(screenSize.height).integerValue) == UIScreen.mainScreen.scale) {
          imgName = dict[@"UILaunchImageName"];
          break;
        } else {
          imgName = @"";
        }
      } else {
        imgName = dict[@"UILaunchImageName"];
        break;
      }
    } else {
      imgName = @"";
    }
  }
  return imgName;
}
@end
    
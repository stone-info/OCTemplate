//
//  T109ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

/**
 * hitTest 只检查 自己的view 和 儿子view , 孙子view 不管...
 * 会调用两次, 可能是为了确保 找到把...
 */

#import "T109ViewController.h"
#import "WhiteViewT109.h"

@interface T109View : UIView

@end

@implementation T109View

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
  NSLog(@"%s", __func__);
  return [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  NSLog(@"%s", __func__);
}
@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface T109ViewController ()

@end

@implementation T109ViewController
- (void)loadView {
  T109View *view = [T109View.alloc initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
  self.view = view;
}
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self entry];
}

- (void)injected {
  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [self.view.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
  // [self.views removeAllObjects];
  // self.views = nil;
  [self entry];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  NSLog(@"%s", __func__);
}

- (void)entry {

  self.view.backgroundColor = HexRGBA(@"#FFC1C1", 1.0);

  UINib         *nib     = [UINib nibWithNibName:@"WhiteViewT109" bundle:nil];
  WhiteViewT109 *carView = [nib instantiateWithOwner:nil options:nil].lastObject;
  kBorder(carView);
  [self.view addSubview:carView];

  kMasKey(carView);
  [carView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight + 10, 10, kSafeAreaBottomHeight + 200, 10));
  }];

}


@end
    
    
    
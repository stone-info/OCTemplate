//
//  T088ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T088ViewController.h"
//#import "VALValet.h"
@interface T088ViewController ()
// @property (weak, nonatomic) UIImageView *contentImageView;
// @property (weak, nonatomic) UILabel     *contentLabel;
// @property (strong, nonatomic) VALValet  *myValet;
@end

@implementation T088ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.


  // UIImageView *view = makeImageView(true);
  // view.image = [UIImage imageNamed:@"headIcon"];
  // self.contentImageView = view;
  // [self.view addSubview:view];
  // kMasKey(view);
  // [view mas_makeConstraints:^(MASConstraintMaker *make) {
  //   make.top.offset(kStatusBarHeight + kNavigationBarHeight + 10);
  //   make.left.offset(10);
  //   make.right.offset(-10);
  //   make.height.mas_equalTo(view.mas_width).multipliedBy(1 / 1); // 高/宽
  // }];
  //
  //
  // UILabel *label = makeLabel(true);
  // self.contentLabel = label;
  // [self.view addSubview:label];
  // kMasKey(label);
  // [label mas_makeConstraints:^(MASConstraintMaker *make) {
  //   make.top.mas_equalTo(view.mas_bottom).offset(10);
  //   make.left.offset(10);
  //   make.right.offset(-10);
  //   make.height.mas_greaterThanOrEqualTo(20);
  // }];
  //
  // UIButton *button1 = makeButton(true);
  // [self.view addSubview:button1];
  // [button1 setTitle:@"保存" forState:UIControlStateNormal];
  // [button1 addTarget:self action:@selector(clickSaveButton:) forControlEvents:UIControlEventTouchUpInside];
  // [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
  //   make.top.mas_equalTo(label.mas_bottom).offset(10);
  //   make.left.offset(10);
  //   make.right.offset(-10);
  //   make.height.mas_greaterThanOrEqualTo(30);
  // }];
  //
  // UIButton *button2 = makeButton(true);
  // [self.view addSubview:button2];
  // [button2 setTitle:@"获取" forState:UIControlStateNormal];
  // [button2 addTarget:self action:@selector(clickGetButton:) forControlEvents:UIControlEventTouchUpInside];
  // [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
  //   make.top.mas_equalTo(button1.mas_bottom).offset(10);
  //   make.left.offset(10);
  //   make.right.offset(-10);
  //   make.height.mas_greaterThanOrEqualTo(30);
  // }];
  //
  // UIButton *button3 = makeButton(true);
  // [self.view addSubview:button3];
  // [button3 setTitle:@"删除所有" forState:UIControlStateNormal];
  // [button3 addTarget:self action:@selector(clickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
  // [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
  //   make.top.mas_equalTo(button2.mas_bottom).offset(10);
  //   make.left.offset(10);
  //   make.right.offset(-10);
  //   make.height.mas_greaterThanOrEqualTo(30);
  // }];
  //
  // self.myValet = [[VALValet alloc] initWithSharedAccessGroupIdentifier:@"com.stone.common" accessibility:VALAccessibilityWhenPasscodeSetThisDeviceOnly];
}

// - (void)clickSaveButton:(id)sender {
//   BOOL isFisrtApp = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"] isEqualToString:@"com.stone.Example"];
//   if (isFisrtApp) {
//     UIImage *image = [UIImage imageNamed:@"headIcon"];
//     [self.myValet setObject:UIImageJPEGRepresentation(image, 1.0) forKey:@"myHeadIcon"];
//     [self.myValet setString:@"Dog" forKey:@"myName"];
//   } else {
//     UIImage *image = [UIImage imageNamed:@"headIcon2"];
//     [self.myValet setObject:UIImageJPEGRepresentation(image, 1.0) forKey:@"myHeadIcon"];
//     [self.myValet setString:@"Cat" forKey:@"myName"];
//   }
// }
//
// - (void)clickGetButton:(id)sender {
//   NSData *imageData = [self.myValet objectForKey:@"myHeadIcon"];
//   self.contentImageView.image = [UIImage imageWithData:imageData];
//   self.contentLabel.text      = [self.myValet stringForKey:@"myName"];
// }
//
// - (void)clickDeleteButton:(id)sender {
//   [self.myValet removeAllObjects];
// }

@end
    
    
    

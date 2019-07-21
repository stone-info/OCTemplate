//
//  SNTabBar.m
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNTabBar.h"

@interface SNTabBarButton : UIButton

@end

@implementation SNTabBarButton

- (void)setHighlighted:(BOOL)highlighted {}

@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface SNTabBar ()
@property (weak, nonatomic) SNTabBarButton                   *selectedButton;
// @property (assign, nonatomic) NSUInteger count;
@property (strong, nonatomic) NSMutableArray<UITabBarItem *> *items;

@property (assign, nonatomic) NSUInteger selectedIndex;

@end

@implementation SNTabBar

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    // self.userInteractionEnabled = YES;
  }
  return self;
}

// - (void)setItems:(NSMutableArray<UITabBarItem *> *)items selectedIndex:(NSUInteger)selectedIndex {
//
//   _items         = items;
//   _selectedIndex = selectedIndex;
//
//   if (!(items && items.count > 0)) { return; }
//
//   UIView  *lastView = nil;
//   CGFloat width     = [UIScreen mainScreen].bounds.size.width / items.count;
//
//   for (NSUInteger i = 0; i < items.count; ++i) {
//
//     UITabBarItem *item = items[i];
//
//     SNTabBarButton *button = [SNTabBarButton buttonWithType:UIButtonTypeCustom];
//     button.tag = i;
//     [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//     [button setImage:item.image forState:UIControlStateNormal];
//     [button setImage:item.selectedImage forState:UIControlStateSelected];
//
//     // [button setBackgroundImage:item.image forState:UIControlStateNormal];
//     // [button setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
//
//     [self addSubview:button];
//
//     kMasKey(button);
//     [button mas_makeConstraints:^(MASConstraintMaker *make) {
//       // make.top.offset(10);
//       make.left.mas_equalTo(lastView ? lastView.mas_right : self.mas_left).offset(0);
//       make.top.offset(0);
//       make.width.mas_equalTo(width);
//       make.height.mas_equalTo(kTabBarHeight);
//     }];
//
//     lastView = button;
//
//     if (i == selectedIndex) {
//       // [self buttonClicked:button];
//       button.selected = YES;
//       _selectedButton = button;
//     }
//   }
// }
//
- (void)setItems:(NSMutableArray<UITabBarItem *> *)items selectedIndex:(NSUInteger)selectedIndex {

  _items         = items;
  _selectedIndex = selectedIndex;

  if (!(items && items.count > 0)) { return; }

  for (NSUInteger i = 0; i < items.count; ++i) {
    UITabBarItem   *item   = items[i];
    SNTabBarButton *button = [SNTabBarButton buttonWithType:UIButtonTypeCustom];
    button.tag = i;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:item.image forState:UIControlStateNormal];
    [button setImage:item.selectedImage forState:UIControlStateSelected];
    [self addSubview:button];

    if (i == selectedIndex) {
      // [self buttonClicked:button];
      button.selected = YES;
      _selectedButton = button;
    }
  }
}

- (void)layoutSubviews {
  [super layoutSubviews];

  CGFloat width = [UIScreen mainScreen].bounds.size.width / _items.count;
  for (NSUInteger i = 0; i < self.subviews.count; ++i) {
    SNTabBarButton *button = self.subviews[i];
    button.frame = CGRectMake(width * i, 0, width, kTabBarHeight);
  }
}

- (void)buttonClicked:(SNTabBarButton *)sender {

  if (sender == _selectedButton) { return; }

  NSLog(@"%s", __func__);

  if (_selectedButton != nil && _selectedButton.selected == YES) { _selectedButton.selected = NO; }

  sender.selected = YES;

  _selectedButton = sender;

  if ([_delegate respondsToSelector:@selector(tabBar:index:)]) {
    [_delegate tabBar:self index:(NSUInteger) sender.tag];
  }
}

@end

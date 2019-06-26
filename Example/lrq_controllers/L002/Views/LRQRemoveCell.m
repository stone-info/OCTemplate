//
// Created by Maskkkk on 2019-06-26.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQRemoveCell.h"

@interface LRQRemoveCell ()
@property (nonatomic, strong) UILabel  *label;
@property (nonatomic, strong) UIButton *button;
@end

@implementation LRQRemoveCell {}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.button];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  self.contentView.backgroundColor = [UIColor whiteColor];
  CGRect bounds = [[self contentView] bounds];
  CGRect slice;
  CGRect remainder;

  CGRectDivide(bounds, &slice, &remainder, 100, CGRectMaxXEdge);
  [[self label] setFrame:slice];
  [[self button] setFrame:remainder];
}

#pragma mark - <private method>
- (void)onButton:(UIButton *)button {
  if ([[self delegate] respondsToSelector:@selector(removeCellDidTapButton:)]) {
    [[self delegate] removeCellDidTapButton:self];
  }
}

#pragma mark - <setter & getter>

- (UILabel *)label {

  /** _label lazy load */

  if (_label == nil) {
    _label = [UILabel new];
    _label.backgroundColor = UIColor.clearColor;
  }
  return _label;
}

- (UIButton *)button {

  /** _button lazy load */

  if (_button == nil) {
    _button = [UIButton new];
    [_button setTitle:@"Remove" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _button.backgroundColor = UIColor.clearColor;
    [_button addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _button;
}

- (void)setText:(NSString *)text {
  _text = text;
  [self.label setText:text];
}


@end
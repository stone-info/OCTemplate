//
// Created by Maskkkk on 2019-05-29.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQLabelCell.h"
#import "UIView+Common.h"

@interface LRQLabelCell ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CALayer *separator;
@end

@implementation LRQLabelCell {
  UIEdgeInsets _insets;
  UIFont *_font;
  CGFloat _singleLineHeight;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _insets = UIEdgeInsetsMake(8, 15, 8, 15);
    _font = [UIFont systemFontOfSize:17];
    _singleLineHeight = _font.lineHeight + _insets.top + _insets.bottom;
  }
  return self;
}


- (UILabel *)label {

  /** _label lazy load */

  if (_label == nil) {
    _label = [UILabel new];
    _label.backgroundColor = [UIColor clearColor];
    _label.numberOfLines = 0;
    _label.font = _font;

    [self.contentView addSubview:self.label];
    [self.contentView.layer addSublayer:self.separator];
    self.contentView.backgroundColor = UIColor.whiteColor;
  }
  return _label;
}

#pragma mark - <IGListBindable>
- (void)bindViewModel:(id)viewModel {
  if ([viewModel isKindOfClass:NSString.class]) {
    self.label.text = viewModel;
  }
  return;
}


- (void)layoutSubviews {
  // 一定要调用super的layoutSubviews
  [super layoutSubviews];

  CGRect bounds = self.contentView.bounds;
  self.label.frame = UIEdgeInsetsInsetRect(bounds, _insets);
  CGFloat height = 0.5;
  CGFloat left = _insets.left;
  self.separator.frame = CGRectMake(left, self.height-height, self.width-left, height);
}

- (void)setHighlighted:(BOOL)highlighted {
  self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1.0];
}

- (CALayer *)separator {

  /** _separator lazy load */

  if (_separator == nil) {
    _separator = [CALayer layer];
    _separator.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199/255.0 blue:204/255.0 alpha:1.0].CGColor;
  }
  return _separator;
}

- (void)setText:(NSString *)text {
  _text = text;
  self.label.text = text;
}


@end
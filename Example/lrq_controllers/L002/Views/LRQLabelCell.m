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
UIEdgeInsets _insets;
UIFont       *_font;
@implementation LRQLabelCell {

}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _insets           = UIEdgeInsetsMake(8, 15, 8, 15);
    _font             = [UIFont systemFontOfSize:17];

    [self.contentView addSubview:self.label];
    [self.contentView.layer addSublayer:self.separator];
    self.contentView.backgroundColor = [UIColor whiteColor];
  }
  return self;
}

- (void)layoutSubviews {
  // 一定要调用super的layoutSubviews
  [super layoutSubviews];

  CGRect bounds = self.contentView.bounds;
  self.label.frame = UIEdgeInsetsInsetRect(bounds, _insets);
  CGFloat height = 0.5;
  CGFloat left   = _insets.left;
  self.separator.frame = CGRectMake(left, self.height - height, self.width - left, height);
}

#pragma mark - <private method>

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width {
  CGSize constrainedSize = CGSizeMake(width - _insets.left - _insets.right, CGFLOAT_MAX);

  NSDictionary                *attributes = @{NSFontAttributeName: _font};
  enum NSStringDrawingOptions options     = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
  CGRect                      bounds      = [text boundingRectWithSize:constrainedSize options:options attributes:attributes context:nil];
  return ceil(bounds.size.height) + _insets.top + _insets.bottom;
}

#pragma mark - <IGListBindable>

- (void)bindViewModel:(id)viewModel {
  if ([viewModel isKindOfClass:NSString.class]) {
    self.label.text = viewModel;
  }
  return;
}

#pragma mark - <setter & getter>

- (void)setHighlighted:(BOOL)highlighted {
  self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1.0];
}

+ (CGFloat)singleLineHeight {
  return _font.lineHeight + _insets.top + _insets.bottom;
}

- (UILabel *)label {

  /** _label lazy load */

  if (_label == nil) {
    _label = [UILabel new];
    _label.backgroundColor = [UIColor clearColor];
    _label.numberOfLines   = 0;
    _label.font            = _font;

    [self.contentView addSubview:self.label];
    [self.contentView.layer addSublayer:self.separator];
    self.contentView.backgroundColor = UIColor.whiteColor;
  }
  return _label;
}

- (CALayer *)separator {

  /** _separator lazy load */

  if (_separator == nil) {
    _separator = [CALayer layer];
    _separator.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1.0].CGColor;
  }
  return _separator;
}

- (void)setText:(NSString *)text {
  _text = text;
  self.label.text = text;
}


@end
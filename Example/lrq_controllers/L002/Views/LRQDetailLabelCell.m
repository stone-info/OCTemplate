//
// Created by Maskkkk on 2019-06-25.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQDetailLabelCell.h"

CGFloat _padding = 15.0;

@interface LRQDetailLabelCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@end

@implementation LRQDetailLabelCell {

}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  CGRect frame = CGRectInset([[self contentView] bounds], _padding, 0);

  [[self titleLabel] setFrame:frame];
  [[self detailLabel] setFrame:frame];
}

#pragma mark - <setter & getter>

- (void)setTitle:(NSString *)title {
  _title = title;
  [self.titleLabel setText:title];
}

- (void)setDetail:(NSString *)detail {
  _detail = detail;
  [[self detailLabel] setText:detail];
}

- (UILabel *)titleLabel {

  /** _titleLabel lazy load */

  if (_titleLabel == nil) {
    _titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [_titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    [_titleLabel setTextColor:[UIColor darkTextColor]];
  }
  return _titleLabel;
}

- (UILabel *)detailLabel {

  /** _detailLabel lazy load */

  if (_detailLabel == nil) {
    _detailLabel = [UILabel new];
    _detailLabel.backgroundColor = [UIColor clearColor];
    [_detailLabel setTextAlignment:NSTextAlignmentRight];
    [_detailLabel setFont:[UIFont systemFontOfSize:17.0]];
    [_detailLabel setTextColor:[UIColor lightGrayColor]];
  }
  return _detailLabel;
}


@end
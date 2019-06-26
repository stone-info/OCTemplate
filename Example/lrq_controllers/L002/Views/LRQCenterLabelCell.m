//
//  LRQCenterLabelCell.m
//  Example
//
//  Created by Maskkkk on 2019/6/21.
//  Copyright © 2019 stone. All rights reserved.
//

#import "LRQCenterLabelCell.h"

@implementation LRQCenterLabelCell

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.contentView addSubview:self.label];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.label.frame = self.contentView.bounds;
}

#pragma mark - <setter & getter>
- (UILabel *)label {

  /** _label lazy load */

  if (_label == nil) {
    _label = [UILabel new];
    [_label setBackgroundColor:[UIColor clearColor]];
    [_label setTextAlignment:NSTextAlignmentCenter];
    [_label setTextColor:[UIColor whiteColor]];
    [_label setFont:[UIFont boldSystemFontOfSize:18]];
  }
  return _label;
}

- (void)setText:(NSString *)text {
  _text = text;
  [self.label setText:text];
}


@end

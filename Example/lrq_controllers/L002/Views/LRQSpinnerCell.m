//
// Created by Maskkkk on 2019-05-31.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQSpinnerCell.h"

@interface LRQSpinnerCell ()

@end

@implementation LRQSpinnerCell {}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.contentView addSubview:self.activityIndicatorView];
    [self.activityIndicatorView setBounds:self.contentView.bounds];
    [self.activityIndicatorView setCenter:self.contentView.center];
  }
  return self;
}

- (UIActivityIndicatorView *)activityIndicatorView {

  /** _activityIndicatorView lazy load */

  if (_activityIndicatorView == nil) {
    _activityIndicatorView = [UIActivityIndicatorView new];
    _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
  }
  return _activityIndicatorView;
}


@end
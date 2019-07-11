//
// Created by Maskkkk on 2019-07-04.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQImageCell.h"

@interface LRQImageCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@end

@implementation LRQImageCell {}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.activityView];
  }
  return self;
}

- (void)layoutSubviews {
  // 一定要调用super的layoutSubviews
  [super layoutSubviews];

  CGRect bounds = self.contentView.bounds;
  self.activityView.center = CGPointMake(bounds.size.width / 2.0, bounds.size.height / 2.0);
  self.imageView.frame = bounds;
}


#pragma mark - <setter & getter>

- (UIImageView *)imageView {

  /** _imageView lazy load */

  if (_imageView == nil) {
    _imageView = [UIImageView new];
    [_imageView setContentMode:UIViewContentModeScaleAspectFill];
    [_imageView setClipsToBounds:YES];
    _imageView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
  }
  return _imageView;
}

- (UIActivityIndicatorView *)activityView {

  /** _activityView lazy load */

  if (_activityView == nil) {
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_activityView startAnimating];
  }
  return _activityView;
}

- (void)setImage:(UIImage *)image {
  _image = image;
  [self.imageView setImage:image];

  if (image) {
    [[self activityView] stopAnimating];
  } else {
    [[self activityView] startAnimating];
  }
}


@end
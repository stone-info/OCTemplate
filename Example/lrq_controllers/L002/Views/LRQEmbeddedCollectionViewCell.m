//
// Created by Maskkkk on 2019-06-26.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQEmbeddedCollectionViewCell.h"

@interface LRQEmbeddedCollectionViewCell ()
@end

@implementation LRQEmbeddedCollectionViewCell {}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [[self contentView] addSubview:[self collectionView]];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [[self collectionView] setFrame:[[self contentView] frame]];
}

- (UICollectionView *)collectionView {

  /** _collectionView lazy load */

  if (_collectionView == nil) {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    // [layout setMinimumInteritemSpacing:10];
    // [layout setMinimumLineSpacing:10];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView setAlwaysBounceHorizontal:YES];
    [_collectionView setAlwaysBounceVertical:NO];
  }
  return _collectionView;
}


@end
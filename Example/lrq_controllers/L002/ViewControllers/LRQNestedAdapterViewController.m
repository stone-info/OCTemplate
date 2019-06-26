//
// Created by Maskkkk on 2019-06-26.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQNestedAdapterViewController.h"
#import <IGListKit/IGListKit.h>
#import "LRQLabelSectionController.h"
#import "LRQHorizontalSectionController.h"

@interface LRQNestedAdapterViewController () <IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter    *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray          *data;
@end

@implementation LRQNestedAdapterViewController {}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view addSubview:self.collectionView];
  self.adapter.collectionView = [self collectionView];
  [[self adapter] setDataSource:self];

}

- (void)viewWillLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.collectionView.frame = self.view.bounds;
}

#pragma mark - <IGListAdapterDataSource>

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
  if ([object isKindOfClass:[NSNumber class]]) {
    return [LRQHorizontalSectionController new];
  } else {
    return [LRQLabelSectionController new];
  }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return nil;
}

#pragma mark - <setter & getter>

- (IGListAdapter *)adapter {

  /** _adapter lazy load */

  if (_adapter == nil) {
    _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
  }
  return _adapter;
}

- (UICollectionView *)collectionView {

  /** _collectionView lazy load */

  if (_collectionView == nil) {
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];;
    _collectionView.backgroundColor = [UIColor whiteColor];
  }
  return _collectionView;
}

- (NSArray *)data {

  /** _data lazy load */

  if (_data == nil) {
    _data = @[
      @"我17岁的人生像白开水一样，虽然平淡，但很健康",
      @"虚伪的是人性而非网络。",
      @(14),
      @"上了戏台、画了花脸，就由不得你不唱戏。",
      @"下雨时，不要只注意我脸上的水滴，要看到我不变的笑容。",
      @(6),
      @"原来人在黑暗中，最容易感受到的，就是孤单。",
      @(2),
      ];
  }
  return _data;
}

@end
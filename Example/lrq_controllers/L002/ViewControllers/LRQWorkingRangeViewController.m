//
//  LRQWorkingRangeViewController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-07-04.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQWorkingRangeViewController.h"
#import <IGListKit/IGListKit.h>
#import "LRQWorkingRangeSectionController.h"

@interface LRQWorkingRangeViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter    *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray          *data;
@property (nonatomic, strong) UILabel          *emptyLabel;
@end

@implementation LRQWorkingRangeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.


  {
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = [self collectionView];
    [[self adapter] setDataSource:self];
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
  }
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
  return [LRQWorkingRangeSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return [self emptyLabel];
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
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    _collectionView.backgroundColor = [UIColor whiteColor];
  }
  return _collectionView;
}

- (UILabel *)emptyLabel {

  /** _emptyLabel lazy load */

  if (_emptyLabel == nil) {
    _emptyLabel = [UILabel new];
    [_emptyLabel setNumberOfLines:0];
    [_emptyLabel setTextAlignment:NSTextAlignmentCenter];
    [_emptyLabel setText:@"No more data!"];
    _emptyLabel.backgroundColor = UIColor.clearColor;
  }
  return _emptyLabel;
}

- (NSArray *)data {

  /** _data lazy load */

  if (_data == nil) {
    NSMutableSet   *mutableSet = [NSMutableSet set];
    for (NSInteger i           = 0; i < 20; ++i) {
      [mutableSet addObject:@(arc4random_uniform(200) + 200)];
    }
    _data = [mutableSet allObjects];
    return _data;
  }
  return _data;
}


@end

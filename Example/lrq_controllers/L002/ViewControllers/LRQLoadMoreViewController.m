//
// Created by Maskkkk on 2019-05-30.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQLoadMoreViewController.h"
#import <IGListKit/IGListKit.h>
#import "LRQLabelSectionController.h"
#import "LRQSpinnerSectionController.h"
#import "LRQSpinnerCell.h"
#import "CustomCollectionView.h"

NSString                                             *spinner = @"spinner";

@interface LRQLoadMoreViewController ()
@property (nonatomic, strong) IGListAdapter          *adapter;
@property (nonatomic, strong) NSArray                *datas;
@property (nonatomic, strong) UICollectionView       *collectionView;
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@end

@implementation LRQLoadMoreViewController {}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

}

#pragma mark - <IGListAdapterDataSource>

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  NSMutableArray *mutableData = [self.datas mutableCopy];
  if (_loading) {
    [mutableData addObject:spinner];
  }
  return [self datas];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
  NSLog(@"listAdapter = %@", listAdapter);

  if ([object isKindOfClass:[NSString class]]) {

    return [[IGListSingleSectionController alloc] initWithCellClass:[LRQSpinnerCell class] configureBlock:^(id item, __kindof LRQSpinnerCell *cell) {
      [cell.activityIndicatorView startAnimating];
    } sizeBlock:^CGSize(id item, id <IGListCollectionContext> collectionContext) {
      return CGSizeMake(kScreenWidth, 100);
    }];
  } else {
    return [LRQLabelSectionController new];
  }
  // return [LRQLabelSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return nil;
}

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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
  }
  return _collectionView;
}

- (NSArray *)datas {

  /** _datas lazy load */

  if (_datas == nil) {
    NSMutableArray *mutableData = [NSMutableArray array];
    for (NSInteger i            = 0; i < 20; ++i) {
      [mutableData addObject:@(i)];
    }
    _datas = [mutableData copy];
  }
  return _datas;
}

@end

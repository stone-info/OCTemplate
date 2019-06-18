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
#import "UIView+Common.h"

NSString                                             *spinner = @"spinner";

@interface LRQLoadMoreViewController () <IGListAdapterDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) IGListAdapter          *adapter;
@property (nonatomic, strong) NSArray                *datas;
@property (nonatomic, strong) UICollectionView       *collectionView;
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@end

@implementation LRQLoadMoreViewController {}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.collectionView];
  self.adapter.collectionView = self.collectionView;
  self.adapter.dataSource = self;
  self.adapter.scrollViewDelegate = self;
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  self.collectionView.frame = self.view.bounds;
}

- (void)dealloc {
  NSLog(@"----------- dealloc -------------- ");
}

#pragma mark - <IGListAdapterDataSource>

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  NSMutableArray *mutableData = [self.datas mutableCopy];
  if (_loading) {
    [mutableData addObject:spinner];
  }
  return mutableData;
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

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  NSLog(@"scrollView = %@", scrollView);
  CGFloat distance = (scrollView.contentSize.height - scrollView.height - targetContentOffset->y);
  if (distance < 200 && !_loading) {

    _loading = YES;

    [self.adapter performUpdatesAnimated:YES completion:nil];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{

      [NSThread sleepForTimeInterval:5.0];

      dispatch_async(dispatch_get_main_queue(), ^{
        self.loading = false;
        [self increaseData];
        [self.adapter performUpdatesAnimated:YES completion:nil];
      });

    });
  }
}

#pragma mark - <private method>
- (void)increaseData {
  NSInteger count = self.datas.count;
  NSMutableArray *mutableData = [NSMutableArray array];
  for (NSInteger i            = 0; i < count+5; ++i) {
    [mutableData addObject:@(i)];
  }
  self.datas = [mutableData copy];
}

#pragma mark - <getter & setter>
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

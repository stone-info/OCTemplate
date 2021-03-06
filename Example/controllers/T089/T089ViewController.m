//
//  T089ViewController.m
//  objc_template
//
//  Created by stone on 2019-07-03.
//  Copyright © 2019 stone. All rights reserved.
//
#import "T089ViewController.h"
#import <IGListKit/IGListKit.h>
#import "T089SectionController.h"
@interface T089ViewController () <IGListAdapterDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) IGListAdapter    *adapter;
@property (strong, nonatomic) NSMutableArray   *data;
@property (strong, nonatomic) UILabel          *emptyLabel;
@end

@implementation T089ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = UIColor.whiteColor;
  // make layout
  [self.view addSubview:self.collectionView];

  //  在 iOS 10 中, 引入了一种新的细胞预取 API.在 Instagam, 启用此功能会显著降低滚动性能。
  if ([self.collectionView respondsToSelector:@selector(setPrefetchingEnabled:)]) { [self.collectionView setPrefetchingEnabled:NO]; }
  if ([self.collectionView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) { [self.collectionView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever]; }
  if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) { [self setAutomaticallyAdjustsScrollViewInsets:NO]; }

  [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight, 0, kSafeAreaBottomHeight, 0));
  }];
  self.adapter.collectionView = self.collectionView;
}

// - (void)viewDidLayoutSubviews {
//   [super viewDidLayoutSubviews];
//
//   CGFloat y      = kStatusBarHeight + kNavigationBarHeight;
//   CGFloat height = kScreenHeight - y - kSafeAreaBottomHeight;
//   self.collectionView.frame = CGRectMake(0, y, kScreenWidth, height);
// }

#pragma mark - <IGListAdapterDataSource>

// 返回遵守IGListDiffable协议的 对象数组, @(1) number类型和 字符串 好像默认遵守了该协议, 待研究
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {

  return self.data;
}

// 绑定 model和cell的 viewModel
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {

  return T089SectionController.new;

  return [IGListSingleSectionController.alloc

    initWithCellClass:UICollectionViewCell.class

    configureBlock:^(id item, __kindof UICollectionViewCell *cell) {
      cell.contentView.backgroundColor = sn.randomColor;
    }
    sizeBlock:^CGSize(id item, id <IGListCollectionContext> collectionContext) {
      if (collectionContext) {
        // 横向滚动的时候用
        // return CGSizeMake(collectionContext.containerSize.width, collectionContext.containerSize.height);

        return CGSizeMake(collectionContext.containerSize.width, 55);

      } else {
        return CGSizeZero;
      }
    }];
}

// 无数据时 显示用的View;
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return self.emptyLabel;
}

/** lazy load */
- (NSMutableArray *)data {

  if (_data == nil) {
    _data = [NSMutableArray array];
    // [_data addObject:[TopModel modelWithIdentifier:@"0" dataList:@[]]];
    [_data addObject:@"hello"];
    // [_data addObject:@"world"];
    // [_data addObject:@"你好吗"];
    // [_data addObject:@"世界"];
  }
  return _data;
}

- (UILabel *)emptyLabel {

  if (_emptyLabel == nil) {
    _emptyLabel = [UILabel new];
    _emptyLabel.numberOfLines   = 0;
    _emptyLabel.textAlignment   = NSTextAlignmentCenter;
    _emptyLabel.text            = @"No more data!";
    _emptyLabel.backgroundColor = UIColor.clearColor;
  }
  return _emptyLabel;
}

- (UICollectionView *)collectionView {

  if (_collectionView == nil) {
    UICollectionViewFlowLayout *flowLayout = UICollectionViewFlowLayout.new;
    // flowLayout.sectionHeadersPinToVisibleBounds = YES;
    // flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = UIColor.whiteColor;
    // _collectionView.alwaysBounceVertical   = YES;
    // _collectionView.alwaysBounceHorizontal = YES;
    // _collectionView.pagingEnabled          = YES;
  }
  return _collectionView;
}

- (IGListAdapter *)adapter {

  if (_adapter == nil) {
    _adapter = [[IGListAdapter alloc] initWithUpdater:IGListAdapterUpdater.new viewController:self workingRangeSize:2];
    _adapter.dataSource = self;
  }
  return _adapter;
}

@end

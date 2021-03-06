//
//  EmptyViewController.m
//  objc_template
//
//  Created by stone on 2019-05-03.
//  Copyright © 2019 stone. All rights reserved.
//
#import "EmptyViewController.h"
#import "RemoveSectionController.h"
#import <IGListKit/IGListKit.h>

@interface EmptyViewController () <IGListAdapterDataSource, RemoveSectionControllerDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) IGListAdapter    *adapter;
@property (strong, nonatomic) NSArray          *data;
@property (strong, nonatomic) UILabel          *emptyLabel;
/** tally : 计数器 */
@property (strong, nonatomic) NSNumber         *tally;
@end

@implementation EmptyViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.tally = @4;
  }
  return self;
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

- (NSArray *)data {

  if (_data == nil) {
    _data = @[@1, @2, @3, @4,];
  }
  return _data;
}

- (UICollectionView *)collectionView {

  if (_collectionView == nil) {
    UICollectionViewFlowLayout *flowLayout = UICollectionViewFlowLayout.new;
    // flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    // _collectionView.alwaysBounceVertical   = YES;
    // _collectionView.alwaysBounceHorizontal = YES;
    _collectionView.pagingEnabled   = YES;

  }
  return _collectionView;
}

- (IGListAdapter *)adapter {

  if (_adapter == nil) {
    _adapter = [[IGListAdapter alloc] initWithUpdater:IGListAdapterUpdater.new viewController:self];
    _adapter.dataSource = self;
  }
  return _adapter;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = UIColor.whiteColor;
  // make layout
  [self.view addSubview:self.collectionView];

  [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.insets(UIEdgeInsetsMake(kStatusBarHeight + kNavigationBarHeight, 0, kSafeAreaBottomHeight, 0));
  }];
  self.adapter.collectionView = self.collectionView;

  self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd:)];

}

- (void)onAdd:(UIBarButtonItem *)sender {

  NSMutableArray *tempArrM = self.data.mutableCopy;

  [tempArrM addObject:@(self.tally.integerValue + 1)];

  self.tally = @(self.tally.integerValue + 1);

  self.data = tempArrM.copy;

  [self.adapter performUpdatesAnimated:YES completion:nil];

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

  RemoveSectionController *sectionController = RemoveSectionController.new;

  sectionController.delegate = self;

  return sectionController;
}

// 无数据时 显示用的View;
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return self.emptyLabel;
}

- (void)removeSectionControllerWantsRemoved:(RemoveSectionController *)sectionController {
  NSInteger  section = [self.adapter sectionForSectionController:sectionController];
  id         object  = [self.adapter objectAtSection:section];
  NSUInteger index   = [self.data indexOfObject:object];

  NSMutableArray *arrM = self.data.mutableCopy;
  [arrM removeObjectAtIndex:index];
  self.data = arrM;
  [self.adapter performUpdatesAnimated:YES completion:nil];
}


@end

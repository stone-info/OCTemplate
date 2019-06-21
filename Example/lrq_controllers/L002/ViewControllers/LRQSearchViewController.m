//
// Created by Maskkkk on 2019-06-19.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQSearchViewController.h"
#import "NSArray+ES6.h"
#import <IGListKit/IGListKit.h>
#import "LRQSearchSectionController.h"
#import "LRQLabelSectionController.h"

@interface LRQSearchViewController () <IGListAdapterDataSource, LRQSearchSectionControllerDelegate>
@property (nonatomic, strong) NSArray                    *words;
@property (nonatomic, strong) IGListAdapter              *adapter;
@property (nonatomic, strong) UICollectionView           *collectionView;
@property (nonatomic, strong) NSNumber                   *searchToken;
@property (nonatomic, copy) NSString                     *filterString;
@property (nonatomic, strong) LRQSearchSectionController *searchSectionController;

@end

@implementation LRQSearchViewController {}

- (void)viewDidLoad {
  [super viewDidLoad];
  _searchToken = @(42);
  // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.collectionView];
  self.adapter.collectionView = self.collectionView;
  self.adapter.dataSource     = self;

}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  self.collectionView.frame = self.view.bounds;
}

#pragma mark - <IGListAdapterDataSource>

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  NSMutableArray *mutableArray = [NSMutableArray array];
  [mutableArray addObject:_searchToken];
  if (_filterString.length == 0) {

    [mutableArray addObjectsFromArray:self.words];
    return [mutableArray copy];

  } else {

    for (NSString *word in self.words) {
      if ([word.lowercaseString containsString:_filterString.lowercaseString]) {
        [mutableArray addObject:word];
      }
    }
    return [mutableArray copy];
  }
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
  if ([object isKindOfClass:[NSNumber class]] && object == _searchToken) {
    return self.searchSectionController;
  } else {
    return [LRQLabelSectionController new];
  }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return nil;
}

#pragma mark - <LRQSearchSectionControllerDelegate>
- (void)searchSectionController:(LRQSearchSectionController *)sectionController changedText:(NSString *)text {
  self.filterString = text;
  [self.adapter performUpdatesAnimated:YES completion:nil];
}

#pragma mark - <setter & getter>

- (NSArray *)words {

  /** _words lazy load */

  if (_words == nil) {
    NSString       *wordsString = @"周杰伦 桂纶镁 曾恺玹 黄秋生 苏明明 林迈可 周耀中(周杰伦爸爸) 黄俊郎 吴清俊 弹头(南拳妈妈) 宇豪(南拳妈妈) 张杰(南拳妈妈) 杜国璋(化妆师) 雪糕(舞蹈老师)";
    NSRange        range        = NSMakeRange(0, wordsString.length);
    NSMutableSet   *unique      = [NSMutableSet set];
    NSMutableArray *words       = [NSMutableArray array];
    _words = [[wordsString componentsSeparatedByString:@" "] mutableCopy];
  }
  return _words;
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
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    _collectionView.backgroundColor = UIColor.whiteColor;
  }
  return _collectionView;
}

- (LRQSearchSectionController *)searchSectionController {

  /** _searchSectionController lazy load */

  if (_searchSectionController == nil) {
    _searchSectionController = [LRQSearchSectionController new];
    _searchSectionController.searchDelegate = self;
  }
  return _searchSectionController;
}


@end
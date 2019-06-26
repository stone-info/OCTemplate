//
//  LRQHorizontalSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-26.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQHorizontalSectionController.h"
#import "SN.h"
#import "LRQEmbeddedCollectionViewCell.h"
#import "LRQEmbeddedSectionController.h"

@interface LRQHorizontalSectionController () <IGListAdapterDataSource>

@property (strong, nonatomic) id            object;
@property (nonatomic, assign) NSInteger     number;
@property (nonatomic, strong) IGListAdapter *adapter;
@end

@implementation LRQHorizontalSectionController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.inset = UIEdgeInsetsMake(0, 0, 0, 0);
  }
  return self;
}

- (NSInteger)numberOfItems {

  return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  return CGSizeMake(self.collectionContext.containerSize.width, 100);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQEmbeddedCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQEmbeddedCollectionViewCell.class forSectionController:self atIndex:index];
  self.adapter.collectionView = [cell collectionView];
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  // self.object = object;
  self.number = [object integerValue];
}

#pragma mark - <IGListAdapterDataSource>
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  NSMutableArray *mutableArray = [NSMutableArray array];
  for (NSInteger i = 0; i < self.number; ++i) {
    [mutableArray addObject:@(i)];
  }
  return mutableArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
  return [LRQEmbeddedSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return nil;
}

#pragma mark - <setter & getter>

- (IGListAdapter *)adapter {

  /** _adapter lazy load */

  if (_adapter == nil) {
    _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:[self viewController]];
    [_adapter setDataSource:self];
  }
  return _adapter;
}

@end

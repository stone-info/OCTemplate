//
// Created by Maskkkk on 2019-06-26.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQEmptyViweController.h"
#import <IGListKit/IGListKit.h>
#import "LRQRemoveSectionController.h"

@interface LRQEmptyViweController () <IGListAdapterDataSource, LRQRemoveSectionControllerDelegate>
@property (nonatomic, strong) IGListAdapter    *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel          *emptyLabel;
@property (nonatomic, assign) NSInteger        tally;
@property (nonatomic, strong) NSMutableArray   *data;
@end

@implementation LRQEmptyViweController {}

- (void)viewDidLoad {
  [super viewDidLoad];
  {
    self.tally = 4;
    self.data  = [@[@1, @2, @3, @4] mutableCopy];
  }

  {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd)];
  }

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
  LRQRemoveSectionController *sectionController = [LRQRemoveSectionController new];
  [sectionController setDelegate:self];
  return sectionController;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return [self emptyLabel];
}

#pragma mark - <LRQRemoveSectionControllerDelegate>

- (void)removeSectionCOntrollerWantsRemoved:(LRQRemoveSectionController *)sectionController {
  NSInteger  section = [self.adapter sectionForSectionController:sectionController];
  NSInteger  object  = [[[self adapter] objectAtSection:section] integerValue];
  NSUInteger index   = [[self data] indexOfObject:@(object)];
  [[self data] removeObjectAtIndex:index];
  [[self adapter] performUpdatesAnimated:YES completion:nil];
}

#pragma mark - <private method>

- (void)onAdd {
  [self.data addObject:@(self.tally + 1)];
  self.tally += 1;
  [self.adapter performUpdatesAnimated:YES completion:nil];
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


@end
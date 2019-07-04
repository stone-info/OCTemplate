//
//  L002ViewController.m
//  objc_template
//
//  Created by LRQ on 2019/04/05.
//  Copyright © 2019 LRQ. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "L002ViewController.h"
#import "LRQDemoSectionController.h"
#import "LRQNestedAdapterViewController.h"

@interface L002ViewController () <IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter    *adapter;
@property (nonatomic, strong) NSArray          *datas;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation L002ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.collectionView];
  self.adapter.dataSource   = self;
  [self.adapter setCollectionView:[self collectionView]];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  [[self collectionView] setFrame:self.view.bounds];
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
    _datas = @[
      [[LRQDemoItem alloc] initWithName:@"Tail Loading" controllerClass:NSClassFromString(@"LRQLoadMoreViewController") controllerIdentifier:nil],
      [[LRQDemoItem alloc] initWithName:@"Search Autocomplete" controllerClass:NSClassFromString(@"LRQSearchViewController") controllerIdentifier:nil],
      [[LRQDemoItem alloc] initWithName:@"Mixed Data" controllerClass:NSClassFromString(@"LRQMixedDataViewController") controllerIdentifier:nil],
      [[LRQDemoItem alloc] initWithName:@"Nested Adapter" controllerClass:NSClassFromString(@"LRQNestedAdapterViewController") controllerIdentifier:nil],
      [[LRQDemoItem alloc] initWithName:@"Empty View" controllerClass:NSClassFromString(@"LRQEmptyViweController") controllerIdentifier:nil],
      [[LRQDemoItem alloc] initWithName:@"Single Section Controller" controllerClass:NSClassFromString(@"LRQSingleSectionViewController") controllerIdentifier:nil],
      [[LRQDemoItem alloc] initWithName:@"Storyboard" controllerClass:NSClassFromString(@"LRQStoryboardViewController") controllerIdentifier:@"demo"],
      [[LRQDemoItem alloc] initWithName:@"Single Section Storyboard" controllerClass:NSClassFromString(@"LRQSingleSectionStoryboardViewController") controllerIdentifier:@"singleSectionDemo"],
      [[LRQDemoItem alloc] initWithName:@"Working Range" controllerClass:NSClassFromString(@"LRQWorkingRangeViewController") controllerIdentifier:nil],
    ];
  }
  return _datas;
}

#pragma mark - <IGListAdapterDataSource>

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  return [self datas];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
  return [LRQDemoSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return nil;
}



@end
    

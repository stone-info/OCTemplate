//
//  LRQSingleSectionViewController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-27.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQSingleSectionViewController.h"
#import <IGListKit/IGListKit.h>
#import "LRQNibCell.h"

@interface LRQSingleSectionViewController () <IGListAdapterDataSource, IGListSingleSectionControllerDelegate>

@property (nonatomic, strong) IGListAdapter    *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray          *data;
@property (nonatomic, strong) UILabel          *emptyLabel;
@end

@implementation LRQSingleSectionViewController

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
  void (^configureBlock)(id, __kindof UICollectionViewCell *) = ^(id item, __kindof LRQNibCell *cell) {
    [cell setText:[NSString stringWithFormat:@"%zd", ([item integerValue] + 1)]];
  };

  CGSize (^sizeBlock)(id, id <IGListCollectionContext>) = ^CGSize(id item, id <IGListCollectionContext> collectionContext) {
    return CGSizeMake(collectionContext.containerSize.width, 44);
  };

  IGListSingleSectionController *sectionController = [[IGListSingleSectionController alloc] initWithNibName:@"LRQNibCell" bundle:[NSBundle mainBundle] configureBlock:configureBlock sizeBlock:sizeBlock];
  sectionController.selectionDelegate = self;
  return sectionController;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return [self emptyLabel];
}

#pragma mark - <IGListSingleSectionControllerDelegate>
- (void)didSelectSectionController:(IGListSingleSectionController *)sectionController withObject:(id)object {
  NSInteger section = [self.adapter sectionForSectionController:sectionController] + 1;
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Section %zd was selected 🎉", section] message:[NSString stringWithFormat:@"call Object: %@", object] preferredStyle:UIAlertControllerStyleAlert];
  [alert addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil]];
  [self presentViewController:alert animated:YES completion:nil];
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

    NSMutableArray *mutableArray = [NSMutableArray new];
    for (NSInteger i             = 0; i < 20; ++i) {
      [mutableArray addObject:@(i)];
    }
    _data = [mutableArray copy];
  }
  return _data;
}


@end

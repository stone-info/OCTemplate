//
//  LRQStoryboardViewController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-27.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQStoryboardViewController.h"
#import <IGListKit/IGListKit.h>
#import "LRQPerson.h"
#import "LRQStoryboardLabelSectionController.h"
#import "NSArray+ES6.h"

@interface LRQStoryboardViewController () <IGListAdapterDataSource, LRQStoryboardLabelSectionControllerDelegate>

@property (nonatomic, strong) IGListAdapter         *adapter;
@property (nonatomic, strong) UICollectionView      *collectionView;
@property (nonatomic, strong) NSMutableArray        *data;
@property (nonatomic, strong) UILabel               *emptyLabel;
@property (nonatomic, strong) NSArray <LRQPerson *> *people;
@end

@implementation LRQStoryboardViewController

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
  return self.people;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
  LRQStoryboardLabelSectionController *sectionController = [LRQStoryboardLabelSectionController new];
  [sectionController setDelegate:self];
  return sectionController;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return [self emptyLabel];
}

#pragma mark - <LRQStoryboardLabelSectionControllerDelegate>
- (void)removeSectionControllerWantsRemoved:(LRQStoryboardLabelSectionController *)sectionController {
  NSInteger section = [self.adapter sectionForSectionController:sectionController];

  NSArray *array = [self.people filter:^BOOL(id obj, NSUInteger idx) { return idx != section; }];
  self.people = array;

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

- (NSArray<LRQPerson *> *)people {

  /** _people lazy load */

  if (_people == nil) {
    // _people = [NSArray<LRQPerson *> new];
    _people = @[
      [[LRQPerson alloc] initWithPK:1 name:@"张无忌"],
      [[LRQPerson alloc] initWithPK:2 name:@"赵敏"],
      [[LRQPerson alloc] initWithPK:3 name:@"周芷若"],
      [[LRQPerson alloc] initWithPK:4 name:@"殷离"],
      [[LRQPerson alloc] initWithPK:5 name:@"小昭"],
      [[LRQPerson alloc] initWithPK:6 name:@"金毛狮王"],
      [[LRQPerson alloc] initWithPK:7 name:@"谢逊"],
      [[LRQPerson alloc] initWithPK:8 name:@"张三丰"],
      [[LRQPerson alloc] initWithPK:9 name:@"杨不悔"],
      [[LRQPerson alloc] initWithPK:10 name:@"张翠山"],
      [[LRQPerson alloc] initWithPK:11 name:@"殷素素"],
      [[LRQPerson alloc] initWithPK:12 name:@"阳顶天"],
      [[LRQPerson alloc] initWithPK:13 name:@"杨逍"],
      [[LRQPerson alloc] initWithPK:14 name:@"范遥"],
      [[LRQPerson alloc] initWithPK:15 name:@"黛绮丝"],
      [[LRQPerson alloc] initWithPK:16 name:@"紫衫龙王"],
      [[LRQPerson alloc] initWithPK:17 name:@"殷天正"],
      [[LRQPerson alloc] initWithPK:18 name:@"白眉鹰王"],
      [[LRQPerson alloc] initWithPK:19 name:@"谢逊"],
      [[LRQPerson alloc] initWithPK:20 name:@"金毛狮王"],
      [[LRQPerson alloc] initWithPK:21 name:@"韦一笑"],
      [[LRQPerson alloc] initWithPK:22 name:@"青翼蝠王"],
      [[LRQPerson alloc] initWithPK:23 name:@"冷谦"],
      [[LRQPerson alloc] initWithPK:24 name:@"说不得"],
      [[LRQPerson alloc] initWithPK:25 name:@"张中"],
      [[LRQPerson alloc] initWithPK:26 name:@"彭莹玉"],
      [[LRQPerson alloc] initWithPK:27 name:@"周颠"],
      [[LRQPerson alloc] initWithPK:28 name:@"庄铮"],
      [[LRQPerson alloc] initWithPK:29 name:@"吴劲草"],
      [[LRQPerson alloc] initWithPK:30 name:@"颜垣"],
      [[LRQPerson alloc] initWithPK:31 name:@"唐洋"],
      [[LRQPerson alloc] initWithPK:32 name:@"闻苍松"],
    ];
  }
  return _people;
}


@end

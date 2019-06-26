//
// Created by Maskkkk on 2019-06-21.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQMixedDataViewController.h"
#import "LRQGrideSectionController.h"
#import "LRQUser.h"
#import "SN.h"
#import "NSArray+ES6.h"
#import "LRQExpandableSectionController.h"
#import "LRQUserSectionController.h"

@interface LRQMixedDataViewController () <IGListAdapterDataSource, IGListAdapterMoveDelegate>
@property (nonatomic, strong) UISegmentedControl  *segmentedControl;
@property (nonatomic, strong) NSArray <NSArray *> *segments;
@property (nonatomic, strong) IGListAdapter       *adapter;
@property (nonatomic, strong) UICollectionView    *collectionView;
@property (nonatomic, strong) NSArray             *data;
@property (nonatomic, strong) Class               selectedClass;
@end

@implementation LRQMixedDataViewController {}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.selectedClass = [NSNull class];
  if (@available(iOS 9.0, *)) {
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongGesture:)];
    [self.collectionView addGestureRecognizer:longPressGestureRecognizer];
  }

  [self.view addSubview:self.collectionView];
  self.adapter.collectionView = self.collectionView;
  self.adapter.dataSource     = self;



  if (@available(iOS 9.0, *)) {
    self.adapter.moveDelegate = self;
  }

}

- (void)viewWillLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.collectionView.frame = self.view.bounds;
  self.segmentedControl                      = [[UISegmentedControl alloc] initWithItems:[self.segments map:^id(NSArray *obj, NSUInteger idx) { return obj[0]; }]];
  self.segmentedControl.selectedSegmentIndex = 0;
  self.navigationItem.titleView              = self.segmentedControl;
  [self.segmentedControl addTarget:self action:@selector(onControl:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - <IGListAdapterDataSource>

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
  if (self.selectedClass == NSNull.class) {
    NSLog(@"是 NSNull.class");
    return self.data;
  } else {
    return [self.data filter:^BOOL(id obj, NSUInteger idx) {
      return [obj isKindOfClass:self.selectedClass];
    }];
  }
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {

  if ([object isKindOfClass:[NSString class]]) {
    return [[LRQExpandableSectionController alloc] init];
  }

  if ([object isKindOfClass:[LRQGrideItem class]]) {
    return [[LRQGrideSectionController alloc] initWithReorderable:YES];
  }

  // if ([object isKindOfClass:[LRQUser class]]) {
    return [[LRQUserSectionController alloc] initWithReorderable:YES];
  // }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
  return nil;
}

#pragma mark - <ListAdapterMoveDelegate>
- (void)listAdapter:(IGListAdapter *)listAdapter moveObject:(id)object from:(NSArray *)previousObjects to:(NSArray *)objects {
  self.data = objects;
}



#pragma mark - <private method>

- (void)onControl:(UISegmentedControl *)control {
  self.selectedClass = self.segments[(NSUInteger)control.selectedSegmentIndex][1];

  [self.adapter performUpdatesAnimated:YES completion:nil];

}

- (void)handleLongGesture:(UILongPressGestureRecognizer *)gesture {
  switch (gesture.state) {
    case UIGestureRecognizerStateBegan: {
      CGPoint     point = [gesture locationInView:self.collectionView];
      NSIndexPath *path = [self.collectionView indexPathForItemAtPoint:point];
      if (path) {
        [self.collectionView beginInteractiveMovementForItemAtIndexPath:path];
      }
    }
      break;
    case UIGestureRecognizerStateChanged: {
      UIView *view = gesture.view;
      if (view) {
        CGPoint position = [gesture locationInView:view];
        [self.collectionView updateInteractiveMovementTargetPosition:position];
      }
    }
      break;
    case UIGestureRecognizerStateEnded:
      [self.collectionView endInteractiveMovement];
      break;

    default:
      [self.collectionView cancelInteractiveMovement];
      break;
  }
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

- (NSArray *)data {

  /** _data lazy load */

  if (_data == nil) {
    _data = @[
      @"咱们从前曾有婚姻之约，我丈夫此刻却是命在垂危，加之今日我没伤你性命，旁人定然说我对你旧情犹存。若再邀你相助，天下英雄人人要骂我不知廉耻、水性杨花。",
      [[LRQGrideItem alloc] initWithColor:[UIColor colorWithRed:237 / 255.0 green:73 / 255.0 blue:86 / 255.0 alpha:1] itemCount:6],
      [[LRQUser alloc] initWithPK:2 name:@"周芷若" handle:@"峨眉掌门"],
      @"你姓杨，那我便姓柳吧。",
      [[LRQUser alloc] initWithPK:4 name:@"小龙女" handle:@"古墓派掌门"],
      [[LRQGrideItem alloc] initWithColor:[UIColor colorWithRed:56 / 255.0 green:151 / 255.0 blue:240 / 255.0 alpha:1] itemCount:5],
      @"孩儿，你长大了之后，要提防女人骗你，越是好看的女人越会骗人。",
      [[LRQUser alloc] initWithPK:3 name:@"殷素素" handle:@"白眉鹰王之女"],
      [[LRQGrideItem alloc] initWithColor:[UIColor colorWithRed:112 / 255.0 green:192 / 255.0 blue:80 / 255.0 alpha:1] itemCount:3],
      @"我轻轻的舞着，在拥挤的人群之中，你投射过来异样的眼神。诧异也好，欣赏也罢，并不曾使我的舞步凌乱。因为令我飞扬的，不是你注视的目光，而是我年轻的心。",
      [[LRQGrideItem alloc] initWithColor:[UIColor colorWithRed:163 / 255.0 green:42 / 255.0 blue:186 / 255.0 alpha:1] itemCount:3],
      [[LRQUser alloc] initWithPK:1 name:@"轻舞飞扬" handle:@"网路美女"],
    ];
  }
  return _data;
}

- (UISegmentedControl *)segmentedControl {

  /** _segmentedControl lazy load */

  if (_segmentedControl == nil) {
    _segmentedControl = [UISegmentedControl new];
  }
  return _segmentedControl;
}

- (NSArray<NSArray *> *)segments {

  /** _segments lazy load */

  if (_segments == nil) {
    _segments = @[
      @[@"All", [NSNull class]],
      @[@"colors", [LRQGrideItem class]],
      @[@"Text", NSString.class],
      @[@"Users", LRQUser.class],
    ];
  }
  return _segments;
}


@end
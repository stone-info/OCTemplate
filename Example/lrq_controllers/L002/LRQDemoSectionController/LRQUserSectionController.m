//
//  LRQUserSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-25.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQUserSectionController.h"
#import "LRQUser.h"
#import "LRQDetailLabelCell.h"

@interface LRQUserSectionController ()

@property (nonatomic, strong) LRQUser *user;
@property (nonatomic, assign, getter=isReorderable) BOOL reorderable;
@property (strong, nonatomic) id object;

@end

@implementation LRQUserSectionController

- (instancetype)initWithReorderable:(BOOL)reorderable {
  self = [super init];
  if (self) {
    self.inset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.reorderable = reorderable;
  }
  return self;
}

- (NSInteger)numberOfItems {

  return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQDetailLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQDetailLabelCell.class forSectionController:self atIndex:index];
  [cell setTitle:[[self user] name]];
  [cell setDetail:[NSString stringWithFormat:@"@%@", [[self user] handle]]];
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  [self setUser:(LRQUser *)object];
}



- (void)didSelectItemAtIndex:(NSInteger)index {
  // NSLog(@"%s", __func__);
}

- (void)didDeselectItemAtIndex:(NSInteger)index {
  // NSLog(@"%s", __func__);
}

- (void)didHighlightItemAtIndex:(NSInteger)index {
  // NSLog(@"%s", __func__);
}

- (void)didUnhighlightItemAtIndex:(NSInteger)index {
  // NSLog(@"%s", __func__);
}

- (BOOL)canMoveItemAtIndex:(NSInteger)index {
  return [self isReorderable];
}

- (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
  // NSLog(@"%s", __func__);
}

@end

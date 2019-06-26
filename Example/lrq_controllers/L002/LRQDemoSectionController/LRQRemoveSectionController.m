//
//  LRQRemoveSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-26.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQRemoveSectionController.h"
#import "LRQRemoveCell.h"

@interface LRQRemoveSectionController () <LRQRemoveCellDelegate>

@property (assign, nonatomic) NSInteger number;

@end

@implementation LRQRemoveSectionController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.inset = UIEdgeInsetsMake(0, 0, 10, 0);
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
  LRQRemoveCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQRemoveCell.class forSectionController:self atIndex:index];
  [cell setText:[NSString stringWithFormat:@"Cell: %zd", ([self number] + 1)]];
  [cell setDelegate:self];
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  self.number = [object integerValue];
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
  return NO;
}

- (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
  // NSLog(@"%s", __func__);
}

#pragma mark - <LRQRemoveCellDelegate>
- (void)removeCellDidTapButton:(LRQRemoveCell *)cell {
  if ([[self delegate] respondsToSelector:@selector(removeSectionCOntrollerWantsRemoved:)]) {
    [[self delegate] removeSectionCOntrollerWantsRemoved:self];
  }
}

@end

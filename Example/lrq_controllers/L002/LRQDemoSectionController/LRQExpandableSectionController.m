//
//  LRQExpandableSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-25.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import <IGListKit/IGListSectionControllerInternal.h>
#import "LRQExpandableSectionController.h"
#import "LRQLabelCell.h"

@interface LRQExpandableSectionController ()

@end

@implementation LRQExpandableSectionController {
  BOOL     _expandable;
  NSString *_object;
}

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
  CGFloat width  = self.collectionContext.containerSize.width;
  CGFloat height = _expandable ? [LRQLabelCell textHeight:_object width:width] : [LRQLabelCell singleLineHeight];
  return CGSizeMake(width, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQLabelCell.class forSectionController:self atIndex:index];
  cell.text = _object;
  return cell;
}



- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  _object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
  // NSLog(@"%s", __func__);
  _expandable = !_expandable;

  [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:nil animations:^{
    [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
  } completion:nil];
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

@end

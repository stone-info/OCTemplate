//
//  LRQStoryboardLabelSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-27.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQStoryboardLabelSectionController.h"
#import "LRQPerson.h"
#import "LRQNibCell.h"

@interface LRQStoryboardLabelSectionController ()

@property (strong, nonatomic) LRQPerson *object;

@end

@implementation LRQStoryboardLabelSectionController

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
  return CGSizeMake(self.object.name.length * 7, self.object.name.length);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  // UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:UICollectionViewCell.class forSectionController:self atIndex:index];
  LRQNibCell *cell = [[self collectionContext] dequeueReusableCellWithNibName:@"LRQNibCell" bundle:[NSBundle mainBundle] forSectionController:self atIndex:index];
  [cell setText:self.object.name];
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
  if ([self.delegate respondsToSelector:@selector(removeSectionControllerWantsRemoved:)]) {
    [self.delegate removeSectionControllerWantsRemoved:self];
  }
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

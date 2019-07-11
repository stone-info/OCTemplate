//
//  T089SectionController.m
//  objc_template
//
//  Created by stone on 2019-07-03.
//  Copyright © 2019 stone. All rights reserved.

#import "T089SectionController.h"
#import "SN.h"
#import "T089Cell.h"
#import <OCTemplate/SNLog.h>

@interface T089SectionController () <IGListWorkingRangeDelegate>

@property (strong, nonatomic) id object;

@end

@implementation T089SectionController

- (void)dealloc {
  NSLog(@"■■■■■■\t%@ is dead ☠☠☠\t■■■■■■", [self class]);
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.inset                   = UIEdgeInsetsMake(0, 0, 0, 0);
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing      = 0;
    self.workingRangeDelegate    = self;
  }
  return self;
}

- (NSInteger)numberOfItems {

  return 100;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {

  NSUInteger col   = 1;
  CGFloat    width = (self.collectionContext.containerSize.width - self.inset.left - self.inset.right - (col - 1) * self.minimumInteritemSpacing) / col;

  // NSUInteger row = (NSUInteger) ceil(self.viewModels.count / col);
  // CGFloat height = (self.collectionContext.containerSize.height - self.inset.top - self.inset.bottom - (row - 1) * self.minimumLineSpacing) / row;

  // SNUserCell.cellHeight

  return CGSizeMake(width, 169);

}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  // UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:UICollectionViewCell.class forSectionController:self atIndex:index];
  T089Cell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"T089Cell" bundle:nil forSectionController:self atIndex:index];
  cell.contentView.backgroundColor = sn.randomColor;
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
  NSLog(@"%s", __func__);
}
//
// - (void)didDeselectItemAtIndex:(NSInteger)index {
//   // NSLog(@"%s", __func__);
// }
//
// - (void)didHighlightItemAtIndex:(NSInteger)index {
//   // NSLog(@"%s", __func__);
// }
//
// - (void)didUnhighlightItemAtIndex:(NSInteger)index {
//   // NSLog(@"%s", __func__);
// }
//
// - (BOOL)canMoveItemAtIndex:(NSInteger)index {
//   return NO;
// }

// - (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
//   // NSLog(@"%s", __func__);
// }


#pragma mark - <IGListWorkingRangeDelegate>

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerWillEnterWorkingRange:(IGListSectionController *)sectionController {

}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerDidExitWorkingRange:(IGListSectionController *)sectionController {

}

@end

//
//  LRQGrideSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-21.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import <IGListKit/IGListSectionControllerInternal.h>
#import "LRQGrideSectionController.h"
#import "../../../../../../Library/Caches/AppCode2019.1/DerivedData/OCTemplate-cpciolpkulmulrcehvdtlfvkigih/Build/Products/Debug-iphonesimulator/MJExtension/MJExtension.framework/Headers/MJExtension.h"
#import "LRQCenterLabelCell.h"

@interface LRQGrideSectionController ()

@property (strong, nonatomic) LRQGrideItem *object;
@property (nonatomic, assign, getter=isReorderable) BOOL reorderable;
@end

@implementation LRQGrideSectionController

- (instancetype)initWithReorderable:(BOOL)reorderable {
  self = [super init];
  if (self) {
    self.reorderable             = reorderable;
    self.minimumInteritemSpacing = 1;
    self.minimumLineSpacing      = 1;
  }
  return self;
}

- (NSInteger)numberOfItems {

  return self.object.itemCount;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  CGFloat width = self.collectionContext.containerSize.width;
  double  itemSize = floor(width / 4);
  return CGSizeMake(itemSize, itemSize);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQCenterLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQCenterLabelCell.class forSectionController:self atIndex:index];
  cell.text = self.object.items[index];
  cell.backgroundColor = self.object.color;
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  self.object = (LRQGrideItem *)object;
}

- (BOOL)canMoveItemAtIndex:(NSInteger)index {
  return self.isReorderable;
}

- (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
  NSMutableArray *items = [self.object.items mutableCopy];
  NSString *item = items[sourceIndex];
  [items removeObjectAtIndex:sourceIndex];
  [items insertObject:item atIndex:destinationIndex];
  self.object.items = items;
}

@end

@implementation LRQGrideItem
- (instancetype)initWithColor:(UIColor *)color itemCount:(NSInteger)itemCount {
  self = [super init];
  if (self) {
    self.color     = color;
    self.itemCount = itemCount;
    self.items     = [self computeItems];
  }
  return self;
}

- (NSArray <NSString *> *)computeItems {
  NSMutableArray *computes = [NSMutableArray array];
  for (NSInteger i         = 0; i < self.itemCount; ++i) {
    [computes addObject:@(i).stringValue];
  }
  return computes;
}

#pragma mark - <IGListDiffable>

- (nonnull id <NSObject>)diffIdentifier {
  return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)object {

  return self == object ? YES : [self isEqual:object];
}

@end

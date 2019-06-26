//
//  LRQEmbeddedSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-26.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQEmbeddedSectionController.h"
#import "SN.h"
#import "LRQCenterLabelCell.h"

@interface LRQEmbeddedSectionController ()

@property (strong, nonatomic) id object;
@property (nonatomic, assign) NSInteger number;

@end

@implementation LRQEmbeddedSectionController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.inset = UIEdgeInsetsMake(0, 0, 0, 10);
  }
  return self;
}

- (NSInteger)numberOfItems {

  return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  CGFloat height = self.collectionContext.containerSize.height;
  return CGSizeMake(height, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQCenterLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQCenterLabelCell.class forSectionController:self atIndex:index];
  [cell setText:@(self.number).stringValue];
  cell.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:73 / 255.0 blue:86 / 255.0 alpha:1.0];
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  self.number = [object integerValue];
}


@end

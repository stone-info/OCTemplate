//
// Created by Maskkkk on 2019-05-30.
// Copyright (c) 2019 stone. All rights reserved.
//

#import <IGListKit/IGListSectionControllerInternal.h>
#import "LRQLabelSectionController.h"
#import "LRQLabelCell.h"

@interface LRQLabelSectionController ()
@property (nonatomic, copy) id object;
@end

@implementation LRQLabelSectionController {}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQLabelCell *labelCell = [self.collectionContext
                             dequeueReusableCellOfClass:LRQLabelCell.class
                             forSectionController:self
                             atIndex:index];
  if ([self.object isKindOfClass:NSNumber.class]) {
    labelCell.text = [self.object stringValue];
  } else {
    labelCell.text = self.object;
  }

  return labelCell;
}

- (void)didUpdateToObject:(id)object {
  self.object = object;
}

@end

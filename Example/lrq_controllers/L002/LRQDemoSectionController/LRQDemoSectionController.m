//
// Created by Maskkkk on 2019-05-29.
// Copyright (c) 2019 stone. All rights reserved.
//

#import "LRQDemoSectionController.h"
#import "LRQLabelCell.h"

@implementation LRQDemoItem

- (instancetype)initWithName:(NSString *)name controllerClass:(Class)controllerClass controllerIdentifier:(NSString *)controllerIdentifier {
  self = [super init];
  if (self) {
    self.name = name;
    self.controllerClass = controllerClass;
    self.controllerIdentifier = controllerIdentifier;

  }
  return self;
}

#pragma mark - <IGListDiffable>
// 拿两个模型进行对比, 如果发现不一致的话, 说明两个对象是不一样的, 就意味着IGListKit需要刷新了.
- (nonnull id <NSObject>)diffIdentifier {
  // 如果连个控制器的名称一样, 我们就可以认定为这两个控制器是一样的.
  return self.name;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)object {
  // 如果两个对象完全相等就不用再比较了.
  if (self == object) {
    return YES;
  }

  if (!object) {
    return NO;
  }
  LRQDemoItem *item = (LRQDemoItem *)object;
  return (self.controllerClass == item.controllerClass) && (self.controllerIdentifier = item.controllerIdentifier);
}

@end

@interface LRQDemoSectionController ()
@property (nonatomic, strong) LRQDemoItem *object;
@end

@implementation LRQDemoSectionController {}

- (instancetype)init {
  self = [super init];
  if (self) {

  }
  return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  LRQLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:LRQLabelCell.class forSectionController:self atIndex:index];
  cell.text = self.object.name;
  return cell;
}

- (void)didUpdateToObject:(id)object {
  self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
  if (self.object.controllerIdentifier.length > 0) {
    UIStoryboard *storyboard              = [UIStoryboard storyboardWithName:@"Demo" bundle:nil];
    __kindof UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:[self object].controllerIdentifier];
    [[self viewController].navigationController pushViewController:controller animated:YES];
  } else {
    UIViewController *controller = (UIViewController *)[[[self.object controllerClass] alloc] init];
    [[self viewController].navigationController pushViewController:controller animated:YES];
  }
}

@end
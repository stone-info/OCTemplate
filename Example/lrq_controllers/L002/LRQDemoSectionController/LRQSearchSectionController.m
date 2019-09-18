//
//  LRQSearchSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-21.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import "LRQSearchSectionController.h"

@interface LRQSearchSectionController () <IGListScrollDelegate, UISearchBarDelegate>

@property (strong, nonatomic) id object;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation LRQSearchSectionController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.inset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.scrollDelegate = self;
    self.searchBar.delegate = self;
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
  UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:UICollectionViewCell.class forSectionController:self atIndex:index];
  [cell.contentView addSubview:self.searchBar];
  [self.searchBar setFrame:CGRectMake(0, 0, self.collectionContext.containerSize.width, 55)];
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  NSLog(@"object = %@", object);
  self.object = object;
}

#pragma mark - <UISearchBarDelegate>

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
  [self textChange:searchBar.text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
  [self textChange:searchText];
}

- (void)textChange:(NSString *)text {

  if ([self.searchDelegate respondsToSelector:@selector(searchSectionController:changedText:)]) {
    [self.searchDelegate searchSectionController:self changedText:text];
  }
}

#pragma mark - <IGListScrollDelegate>
- (void)listAdapter:(IGListAdapter *)listAdapter didScrollSectionController:(IGListSectionController *)sectionController {
  [self.searchBar resignFirstResponder];
}

- (void)listAdapter:(IGListAdapter *)listAdapter willBeginDraggingSectionController:(IGListSectionController *)sectionController {
    
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDraggingSectionController:(IGListSectionController *)sectionController willDecelerate:(BOOL)decelerate {

}
@end

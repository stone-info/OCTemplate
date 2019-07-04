//
//  LRQWorkingRangeSectionController.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-07-04.
//  Copyright © 2019 lirenqiang2. All rights reserved.

#import <IGListKit/IGListSectionControllerInternal.h>
#import "LRQWorkingRangeSectionController.h"
#import "LRQLabelCell.h"
#import "LRQImageCell.h"

@interface LRQWorkingRangeSectionController () <IGListWorkingRangeDelegate>

@property (strong, nonatomic) id                   object;
@property (nonatomic, assign) NSInteger            height;
@property (nonatomic, strong) UIImage              *downloadedImage;
@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, strong) NSString             *urlString;
@end

@implementation LRQWorkingRangeSectionController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.inset                = UIEdgeInsetsMake(0, 0, 0, 0);
    self.workingRangeDelegate = self;
  }
  return self;
}

- (void)dealloc {
  [self.task cancel];
}

- (NSInteger)numberOfItems {

  return 2;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
  NSInteger height = index == 0 ? 55 : self.height;
  return CGSizeMake(self.collectionContext.containerSize.width, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
  // UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:UICollectionViewCell.class forSectionController:self atIndex:index];

  Class cellClass = index == 0 ? [LRQLabelCell class] : [LRQImageCell class];
  UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
  if ([cell isMemberOfClass:[LRQLabelCell class]]) {
    LRQLabelCell *labelCell = (LRQLabelCell *)cell;
    [labelCell setText:self.urlString];
  } else if ([cell isMemberOfClass:[LRQImageCell class]]) {
    LRQImageCell *imageCell = (LRQImageCell *)cell;
    [imageCell setImage:[self downloadedImage]];
  }
  return cell;
}

- (void)didUpdateToObject:(id)object {
  // 官方推荐 , 追踪错误宏
  // NSParameterAssert([object isKindOfClass:[LabelsItem class]]);
  self.height = [object integerValue];
}

#pragma mark - <IGListWorkingRangeDelegate>

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerWillEnterWorkingRange:(IGListSectionController *)sectionController {
  NSLog(@"downloading image %@ for section %zd", self.urlString, self.section);
  NSURL *url = [NSURL URLWithString:self.urlString];
  self.task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    dispatch_async(dispatch_get_main_queue(), ^{
      UIImage *image = [UIImage imageWithData:data];
      [self setDownloadedImage:image];

      __kindof UICollectionViewCell *cell = [self.collectionContext cellForItemAtIndex:1 sectionController:self];
      if ([cell isMemberOfClass:[LRQImageCell class]]) {
        LRQImageCell *imageCell = cell;
        [imageCell setImage:image];
      }
    });
  }];
  [self.task resume];
}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerDidExitWorkingRange:(IGListSectionController *)sectionController {}

#pragma mark - <setter & getter>

- (NSString *)urlString {
  return [NSString stringWithFormat:@"https://unsplash.it/%@/%@", @(self.collectionContext.containerSize.width).stringValue, @(self.height).stringValue];
}


@end

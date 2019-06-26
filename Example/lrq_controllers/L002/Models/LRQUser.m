//
//  LRQUser.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-25.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import "LRQUser.h"

@interface LRQUser ()

@end

@implementation LRQUser

- (instancetype)initWithPK:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle {
  self = [super init];
  if (self) {
    self.pk = pk;
    self.name = name;
    self.handle = handle;
  }
  return self;
}

- (nonnull id <NSObject>)diffIdentifier {
  return @(self.pk);
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)other {
  // YES 表示相等 , 不更新 即便 0 != 1 , 手动告诉diff算法 这是相等的

  // other 不存在
  if (!other) { return NO; }
  // other 存在 且 全等
  if (self == other) { return YES; }
  // other 存在 指针不同, 使用diff算法
  LRQUser *model = (LRQUser *) other;
  return self.name == model.name && self.handle == model.handle;
}


@end

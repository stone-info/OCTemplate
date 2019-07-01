//
//  LRQPerson.m
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-27.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import "LRQPerson.h"

@interface LRQPerson ()

@end

@implementation LRQPerson

- (instancetype)initWithPK:(NSInteger)pk name:(NSString *)name {
  self = [super init];
  if (self) {
    self.pk = pk;
    self.name = name;
  }
  return self;
}


- (nonnull id <NSObject>)diffIdentifier {
  return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)other {
  // YES 表示相等 , 不更新 即便 0 != 1 , 手动告诉diff算法 这是相等的

  // other 不存在
  if (!other) { return NO; }
  // other 存在 且 全等
  if (self == other) { return YES; }
  // other 存在 指针不同, 使用diff算法
  LRQPerson *model = (LRQPerson *) other;
  return [self isEqual:other];
  // return [self.user isEqualToDiffableObject:other.user] && [self.comments isEqualToArray:other.comments];
  // return [self.name isEqualToString:[other name]] && [self.handle isEqualToString:[other handle]];
}


@end

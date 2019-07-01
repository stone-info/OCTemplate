//
//  LRQPerson.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-27.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRQPerson : NSObject <IGListDiffable>
@property (nonatomic, assign) NSInteger pk;
@property (nonatomic, copy) NSString    *name;
- (instancetype)initWithPK:(NSInteger)pk name:(NSString *)name;
@end

NS_ASSUME_NONNULL_END

//
//  LRQUser.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-25.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRQUser : NSObject <IGListDiffable>
@property (nonatomic, assign) NSInteger pk;
@property (nonatomic, copy) NSString    *name;
@property (nonatomic, copy) NSString    *handle;

- (instancetype)initWithPK:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle;
@end

NS_ASSUME_NONNULL_END

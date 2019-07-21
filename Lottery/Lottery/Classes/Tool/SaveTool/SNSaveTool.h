//
//  SNSaveTool.h
//  Lottery
//
//  Created by stone on 2019/7/21.
//  Copyright © 2019 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNSaveTool : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;
@end

NS_ASSUME_NONNULL_END

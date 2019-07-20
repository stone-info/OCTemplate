//
//  CADisplayLink+SNExtension.h
//  Example
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SNExecuteDisplayLinkBlock)(CADisplayLink *displayLink);

@interface CADisplayLink (SNExtension)

@property (nonatomic, copy) SNExecuteDisplayLinkBlock executeBlock;

+ (CADisplayLink *)displayLinkWithExecuteBlock:(SNExecuteDisplayLinkBlock)block;

@end

NS_ASSUME_NONNULL_END

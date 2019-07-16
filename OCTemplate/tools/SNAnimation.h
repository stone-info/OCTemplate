//
//  SNAnimation.h
//  OCTemplate
//
//  Created by stone on 2019/7/15.
//  Copyright © 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ani SNAnimation

NS_ASSUME_NONNULL_BEGIN

@interface SNAnimation : NSObject

// 默认是z轴
+ (void (^)(__kindof CALayer *, CGFloat))rotatiotion;

+ (void (^)(__kindof CALayer *, CGFloat))rotatiotionX;

+ (void (^)(__kindof CALayer *, CGFloat))rotatiotionY;

+ (void (^)(__kindof CALayer *, CGFloat))rotatiotionZ;

// 默认是 x,y,z 轴 同时a改变
+ (void (^)(__kindof CALayer *, CGFloat))scale;

+ (void (^)(__kindof CALayer *, CGFloat))scaleX;

+ (void (^)(__kindof CALayer *, CGFloat))scaleY;

+ (void (^)(__kindof CALayer *, CGFloat))scaleZ;

// x,y 同时改变
+ (void (^)(__kindof CALayer *, CGFloat))translation;

+ (void (^)(__kindof CALayer *, CGFloat))translationX;

+ (void (^)(__kindof CALayer *, CGFloat))translationY;

+ (void (^)(__kindof CALayer *, CGFloat))translationZ;
@end

NS_ASSUME_NONNULL_END

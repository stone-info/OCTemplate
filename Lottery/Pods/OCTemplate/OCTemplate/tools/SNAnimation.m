//
//  SNAnimation.m
//  OCTemplate
//
//  Created by stone on 2019/7/15.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNAnimation.h"
#import "SNGlobalFunctions.h"

@implementation SNAnimation

// 默认是 rotation.z
+ (void (^)(__kindof CALayer *, CGFloat))rotatiotion {
  return ^void(__kindof CALayer *layer, CGFloat angle) {
    // 写法1:
    // layer.transform = CATransform3DMakeRotation(kDegreesToRadian(angle), 0, 0, 1);

    // 写法2:
    [layer setValue:@(kDegreesToRadian(angle)) forKeyPath:@"transform.rotation"];
    // [self.layer setValue:@(kDegreesToRadian(angle)) forKeyPath:@"transform.rotation"]; //默认z轴
    // [self.layer setValue:@(kDegreesToRadian(angle)) forKeyPath:@"transform.rotation.z"];
    // [self.layer setValue:@(kDegreesToRadian(angle)) forKeyPath:@"transform.rotation.x"];
    // [self.layer setValue:@(kDegreesToRadian(angle)) forKeyPath:@"transform.rotation.y"];
  };
}

+ (void (^)(__kindof CALayer *, CGFloat))rotatiotionX { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(kDegreesToRadian(v)) forKeyPath:@"transform.rotation.x"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))rotatiotionY { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(kDegreesToRadian(v)) forKeyPath:@"transform.rotation.y"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))rotatiotionZ { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(kDegreesToRadian(v)) forKeyPath:@"transform.rotation.z"]; }; }

// x, y , z 同时缩放
+ (void (^)(__kindof CALayer *, CGFloat))scale { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.scale"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))scaleX { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.scale.x"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))scaleY { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.scale.y"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))scaleZ { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.scale.z"]; }; }

// x, y 影响
+ (void (^)(__kindof CALayer *, CGFloat))translation {
  return ^void(__kindof CALayer *layer, CGFloat v) {
    layer.transform = CATransform3DMakeTranslation(v, v, v);
    // [layer setValue:@(v) forKeyPath:@"transform.translation"]; };
  };
}

+ (void (^)(__kindof CALayer *, CGFloat))translationX { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.translation.x"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))translationY { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.translation.y"]; }; }

+ (void (^)(__kindof CALayer *, CGFloat))translationZ { return ^void(__kindof CALayer *layer, CGFloat v) { [layer setValue:@(v) forKeyPath:@"transform.translation.z"]; }; }

//____________2019-07-15_________________________________________________▲△__.

@end

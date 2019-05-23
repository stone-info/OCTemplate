//
//  ExampleConsts.m
//  Example
//
//  Created by stone on 2019/5/23.
//  Copyright © 2019 stone. All rights reserved.
//

#import "ExampleConsts.h"

BOOL kAutoPush = YES;

@implementation ExampleConsts

+ (void)initialize {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{

  });
}

@end

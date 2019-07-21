//
//  SNSaveTool.m
//  Lottery
//
//  Created by stone on 2019/7/21.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNSaveTool.h"

@implementation SNSaveTool
+ (id)objectForKey:(NSString *)defaultName {
  return [NSUserDefaults.standardUserDefaults objectForKey:defaultName];
}

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName {

  if (defaultName) {
    [NSUserDefaults.standardUserDefaults setObject:value forKey:defaultName];
    [NSUserDefaults.standardUserDefaults synchronize];
  }
}

@end

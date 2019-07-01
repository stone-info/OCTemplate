//
//  LRQNibCell.m
//  Example
//
//  Created by Maskkkk on 2019/6/27.
//  Copyright © 2019 stone. All rights reserved.
//

#import "LRQNibCell.h"

@implementation LRQNibCell

- (void)setText:(NSString *)text {
  _text = text;

  [[self textLabel] setText:text];
}


@end

//
//  T089Cell.m
//  Example
//
//  Created by stone on 2019/7/3.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T089Cell.h"

@interface T089Cell ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;


@end

@implementation T089Cell

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code

  UITapGestureRecognizer *leftTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftViewTapHandle:)];
  UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewTapHandle:)];
  [self.leftView addGestureRecognizer:leftTap];
  [self.rightView addGestureRecognizer:rightTap];

}

- (void)leftViewTapHandle:(UITapGestureRecognizer *)sender {
  NSLog(@"%s", __func__);
}

- (void)rightViewTapHandle:(UITapGestureRecognizer *)sender {
  NSLog(@"%s", __func__);
}


@end

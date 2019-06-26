//
// Created by Maskkkk on 2019-05-29.
// Copyright (c) 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit/IGListKit.h>

@interface LRQLabelCell : UICollectionViewCell <IGListBindable>
+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width;
+ (CGFloat)singleLineHeight;
@property (nonatomic, copy) NSString  *text;
@end
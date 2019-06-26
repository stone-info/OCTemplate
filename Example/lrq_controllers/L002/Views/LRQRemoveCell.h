//
// Created by Maskkkk on 2019-06-26.
// Copyright (c) 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LRQRemoveCell;

@protocol LRQRemoveCellDelegate <NSObject>
- (void)removeCellDidTapButton:(LRQRemoveCell *)cell;
@end

@interface LRQRemoveCell : UICollectionViewCell
@property (nonatomic, weak) id <LRQRemoveCellDelegate> delegate;
@property (nonatomic, copy) NSString   *text;
@end
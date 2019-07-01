//
//  LRQNibCell.h
//  Example
//
//  Created by Maskkkk on 2019/6/27.
//  Copyright © 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRQNibCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (nonatomic, copy) NSString *text;
@end

NS_ASSUME_NONNULL_END

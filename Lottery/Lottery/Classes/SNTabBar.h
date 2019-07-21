//
//  SNTabBar.h
//  Lottery
//
//  Created by stone on 2019/7/20.
//  Copyright © 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SNTabBarDelegate;

@interface SNTabBar : UIView

@property (nonatomic, weak, nullable) id <SNTabBarDelegate> delegate;

- (void)setItems:(NSMutableArray<UITabBarItem *> *)items selectedIndex:(NSUInteger)selectedIndex;
@end

@protocol SNTabBarDelegate <NSObject>
@required
- (void)tabBar:(SNTabBar *)tabBar index:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END




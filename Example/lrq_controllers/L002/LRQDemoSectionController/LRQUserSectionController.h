//
//  LRQUserSectionController.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-25.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import <IGListKit/IGListSectionController.h>

NS_ASSUME_NONNULL_BEGIN

// @protocol LRQUserSectionControllerDelegate;

@interface LRQUserSectionController : IGListSectionController

// @property (nonatomic, weak, nullable) id <LRQUserSectionControllerDelegate> delegate;

- (instancetype)initWithReorderable:(BOOL)reorderable;
@end

NS_ASSUME_NONNULL_END

// @protocol LRQUserSectionControllerDelegate <NSObject>
// @required
// - (void)sectionControllerWantsRemoved:(LRQUserSectionController *)sectionController;
// @optional
// - (void)sectionController:(LRQUserSectionController *)sectionController xxx:(id)xxx;
// @end



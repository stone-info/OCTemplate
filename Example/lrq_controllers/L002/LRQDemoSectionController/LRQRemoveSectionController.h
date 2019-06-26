//
//  LRQRemoveSectionController.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-26.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@class LRQRemoveSectionController;

@protocol LRQRemoveSectionControllerDelegate <NSObject>
- (void)removeSectionCOntrollerWantsRemoved:(LRQRemoveSectionController *)sectionController;
@end

NS_ASSUME_NONNULL_BEGIN

// @protocol LRQRemoveSectionControllerDelegate;

@interface LRQRemoveSectionController : IGListSectionController

@property (nonatomic, weak, nullable) id <LRQRemoveSectionControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

// @protocol LRQRemoveSectionControllerDelegate <NSObject>
// @required
// - (void)sectionControllerWantsRemoved:(LRQRemoveSectionController *)sectionController;
// @optional
// - (void)sectionController:(LRQRemoveSectionController *)sectionController xxx:(id)xxx;
// @end



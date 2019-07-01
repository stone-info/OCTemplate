//
//  LRQStoryboardLabelSectionController.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-27.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import <IGListKit/IGListSectionController.h>

NS_ASSUME_NONNULL_BEGIN

@class LRQStoryboardLabelSectionController;

@protocol LRQStoryboardLabelSectionControllerDelegate <NSObject>
- (void)removeSectionControllerWantsRemoved:(LRQStoryboardLabelSectionController *)sectionController;
@end
@interface LRQStoryboardLabelSectionController : IGListSectionController

@property (nonatomic, weak, nullable) id <LRQStoryboardLabelSectionControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

// @protocol LRQStoryboardLabelSectionControllerDelegate <NSObject>
// @required
// - (void)sectionControllerWantsRemoved:(LRQStoryboardLabelSectionController *)sectionController;
// @optional
// - (void)sectionController:(LRQStoryboardLabelSectionController *)sectionController xxx:(id)xxx;
// @end



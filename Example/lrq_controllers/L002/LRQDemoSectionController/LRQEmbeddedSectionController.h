//
//  LRQEmbeddedSectionController.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-26.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import <IGListKit/IGListSectionController.h>

NS_ASSUME_NONNULL_BEGIN

// @protocol LRQEmbeddedSectionControllerDelegate;

@interface LRQEmbeddedSectionController : IGListSectionController

// @property (nonatomic, weak, nullable) id <LRQEmbeddedSectionControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

// @protocol LRQEmbeddedSectionControllerDelegate <NSObject>
// @required
// - (void)sectionControllerWantsRemoved:(LRQEmbeddedSectionController *)sectionController;
// @optional
// - (void)sectionController:(LRQEmbeddedSectionController *)sectionController xxx:(id)xxx;
// @end



//
//  LRQSearchSectionController.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-21.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import <IGListKit/IGListSectionController.h>

@class LRQSearchSectionController;

@protocol LRQSearchSectionControllerDelegate <NSObject>
- (void)searchSectionController:(LRQSearchSectionController *)sectionController changedText:(NSString *)text;
@end

NS_ASSUME_NONNULL_BEGIN

// @protocol LRQSearchSectionControllerDelegate;

@interface LRQSearchSectionController : IGListSectionController

@property (nonatomic, weak, nullable) id <LRQSearchSectionControllerDelegate> searchDelegate;

@end

NS_ASSUME_NONNULL_END

// @protocol LRQSearchSectionControllerDelegate <NSObject>
// @required
// - (void)sectionControllerWantsRemoved:(LRQSearchSectionController *)sectionController;
// @optional
// - (void)sectionController:(LRQSearchSectionController *)sectionController xxx:(id)xxx;
// @end



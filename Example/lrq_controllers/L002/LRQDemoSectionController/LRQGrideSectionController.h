//
//  LRQGrideSectionController.h
//  objc_template
//
//  Created by lirenqiang2 on 2019-06-21.
//  Copyright © 2019 lirenqiang2. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import <IGListKit/IGListSectionController.h>

@interface LRQGrideItem : NSObject <IGListDiffable>
@property (nonatomic, strong) UIColor              *color;
@property (nonatomic, assign) NSInteger            itemCount;
@property (nonatomic, strong) NSArray <NSString *> *items;

- (NSArray <NSString *> *)computeItems;

- (instancetype)initWithColor:(UIColor *)color itemCount:(NSInteger)itemCount;

@end

NS_ASSUME_NONNULL_BEGIN

// @protocol LRQGrideSectionControllerDelegate;

@interface LRQGrideSectionController : IGListSectionController

// @property (nonatomic, weak, nullable) id <LRQGrideSectionControllerDelegate> delegate;
- (instancetype)initWithReorderable:(BOOL)reorderable;
@end

NS_ASSUME_NONNULL_END

// @protocol LRQGrideSectionControllerDelegate <NSObject>
// @required
// - (void)sectionControllerWantsRemoved:(LRQGrideSectionController *)sectionController;
// @optional
// - (void)sectionController:(LRQGrideSectionController *)sectionController xxx:(id)xxx;
// @end



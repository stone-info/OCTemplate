//
// Created by Maskkkk on 2019-05-29.
// Copyright (c) 2019 stone. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@interface LRQDemoItem : NSObject <IGListDiffable>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Class controllerClass;
@property (nonatomic, strong) NSString *controllerIdentifier;
- (instancetype)initWithName:(NSString *)name controllerClass:(Class)controllerClass controllerIdentifier:(NSString *)controllerIdentifier;
@end

@interface LRQDemoSectionController : IGListSectionController

@end
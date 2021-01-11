/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <IGListKit/IGListKit.h>

@class IGListSectionController;

@protocol RemoveDelegate <NSObject>

- (void)removeSectionControllerWantsRemoved:(IGListSectionController *)section;

@end

@interface PostSectionController : IGListSectionController

@property (nonatomic, weak) id<RemoveDelegate> delegate;


@end

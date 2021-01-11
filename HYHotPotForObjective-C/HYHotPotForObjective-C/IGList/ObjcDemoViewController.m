/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ObjcDemoViewController.h"

#import <IGListKit/IGListKit.h>

#import "Post.h"
#import "PostSectionController.h"
#import <MJRefresh.h>


@interface ObjcDemoViewController () <IGListAdapterDataSource, RemoveDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray<Post *> *data;

@end


@implementation ObjcDemoViewController

- (void)reload {
    
    [self.data addObjectsFromArray:@[
        [[Post alloc] initWithUsername:@"userA" comments:@[
            @"Luminous triangle",
            @"Awesome",
            @"Super clean",
            @"Stunning shot",
        ]],
        [[Post alloc] initWithUsername:@"userB" comments:@[
            @"The simplicity here is superb",
            @"thanks!",
            @"That's always so kind of you!",
            @"I think you might like this",
        ]],
        [[Post alloc] initWithUsername:@"userC" comments:@[
            @"So good",
        ]],
        [[Post alloc] initWithUsername:@"userD" comments:@[
            @"hope she might like it.",
            @"I love it."
        ]]
    ]];
    
    [self.adapter reloadDataWithCompletion:^(BOOL finished) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *item = [[UIButton alloc] init];
    [item setTitle:@"reload" forState:UIControlStateNormal];
    [item.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [item sizeToFit];
    [item addTarget:self action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightNavigationItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = rightNavigationItem;
    
    
    self.data = @[
                  [[Post alloc] initWithUsername:@"userA" comments:@[
                                                                     @"Luminous triangle",
                                                                     @"Awesome",
                                                                     @"Super clean",
                                                                     @"Stunning shot",
                                                                     ]],
                  [[Post alloc] initWithUsername:@"userB" comments:@[
                                                                     @"The simplicity here is superb",
                                                                     @"thanks!",
                                                                     @"That's always so kind of you!",
                                                                     @"I think you might like this",
                                                                     ]],
                  [[Post alloc] initWithUsername:@"userC" comments:@[
                                                                     @"So good",
                                                                     ]],
                  [[Post alloc] initWithUsername:@"userD" comments:@[
                                                                     @"hope she might like it.",
                                                                     @"I love it."
                                                                     ]],
                  ].mutableCopy;

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:[UICollectionViewFlowLayout new]];
    [self.view addSubview:self.collectionView];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                                           viewController:self];

    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    
    self.collectionView.mj_footer =  [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self reload];
            [self.collectionView.mj_footer endRefreshing];
        });
    }];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, -25, 0);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    PostSectionController *section = [PostSectionController new];
    section.delegate = self;
    return section;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)removeSectionControllerWantsRemoved:(IGListSectionController *)section {
    
    NSInteger sectionIndex = [self.adapter sectionForSectionController:section];
    [self.data removeObjectAtIndex:sectionIndex];
    [self.adapter reloadDataWithCompletion:^(BOOL finished) {
            
    }];
}

@end

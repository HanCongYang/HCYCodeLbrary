//
//  HYUISegmentView.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "HYSpecifyIntrinsicContentView.h"
#import "HYStackCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYUISegmentedControl : HYSpecifyIntrinsicContentView <HYStackCellDelegate>

// 是否是单选
@property (nonatomic, assign) BOOL isSingleChoice;

@end

NS_ASSUME_NONNULL_END

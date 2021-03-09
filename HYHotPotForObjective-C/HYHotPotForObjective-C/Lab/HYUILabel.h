//
//  HYUILabel.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/3.
//

#import "HYSpecifyIntrinsicContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYUILabel : HYSpecifyIntrinsicContentView

@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, copy) NSString *text;
@property(nonatomic) NSInteger numberOfLines;

@end

NS_ASSUME_NONNULL_END

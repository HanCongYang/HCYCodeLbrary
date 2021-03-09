//
//  HYImageView.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/3.
//

#import "HYSpecifyIntrinsicContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYImageView : HYSpecifyIntrinsicContentView

@property (nonatomic, assign) UIEdgeInsets imageEdgeInsets;
@property (nonatomic, copy) NSString *imageName;


@end

NS_ASSUME_NONNULL_END
//
//  HYSpecifyTheRatioStackCell.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/3.
//

#import <UIKit/UIKit.h>
#import "HYSpecifyIntrinsicContentView.h"
#import "HYStackCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYSpecifyTheRatioStackCell : UIView <HYStackCellDelegate>

@property (nonatomic, assign) CGSize contentSize;
@property (nonatomic, strong) NSMutableArray<HYSpecifyIntrinsicContentView *> *arrangedSubviews;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *specifyTheRatios;

- (void)startLayout;

@end

NS_ASSUME_NONNULL_END

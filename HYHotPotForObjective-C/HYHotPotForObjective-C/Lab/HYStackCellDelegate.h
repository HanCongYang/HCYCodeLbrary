//
//  HYStackCellDelegate.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HYStackCellDelegate <NSObject>

- (void)append:(UIView *)subView;
- (void)appends:(NSArray<UIView *> *)subViews;

@property (nonatomic, assign) UILayoutConstraintAxis axis;
@property (nonatomic, assign) UIStackViewAlignment alignment;
@property (nonatomic, assign) UIStackViewDistribution distribution;

@property(nonatomic) CGFloat spacing;

@end

NS_ASSUME_NONNULL_END

//
//  HYEdgeInsetView.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import <UIKit/UIKit.h>
#import <FDStackView.h>
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYEdgeInsetView : UIView

@property (nonatomic, strong) UIStackView *stack;
@property (nonatomic, assign) CGFloat leading;
@property (nonatomic, assign) CGFloat trailing;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end

NS_ASSUME_NONNULL_END

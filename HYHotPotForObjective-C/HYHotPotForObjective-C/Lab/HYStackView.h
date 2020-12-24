//
//  HYStackView.h
//  Pods
//
//  Created by 韩丛旸 on 2019/2/19.
//

#import <FDStackView/FDStackView.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYStackView : UIScrollView

@property (nonatomic, strong) FDStackView *stackView;
/*
默认值为YES，如果要stackview上的某个输入框输入的时候 不是stackview滚动而是stackview的背景视图滚动 需要吧这个值设置为NO,用于解决stackview上的输入框因为滚动不够导致的键盘遮挡问题
*/
@property (nonatomic, assign)  BOOL isNeedScrollWhenKeyBoardAppear;
- (void)clearAll;
- (void)addArrangedSubview:(UIView *)subView;
- (void)addArrangedSubviewArray:(NSArray *)subViewArray;
- (void)removeArrangedSubview:(UIView *)view;
- (void)insertArrangedSubview:(UIView *)view atIndex:(NSUInteger)stackIndex;
- (void)removeArrangedSubviewArray:(NSArray *)subViewArray;

- (NSArray *)arrangedSubviews;

@property (nonatomic, assign) UILayoutConstraintAxis axis;
@property (nonatomic, assign) UIStackViewAlignment alignment;

@end

NS_ASSUME_NONNULL_END

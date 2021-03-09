//
//  HYUIButton.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "HYSpecifyIntrinsicContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYUIButton : HYSpecifyIntrinsicContentView

typedef void (^HYUIButtonClickEvent)(UIButton *sender);
@property (nonatomic, copy) HYUIButtonClickEvent clickEvent;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *unSelectedColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *unSelectedTextColor;
@property (nonatomic, assign) BOOL isSelected;


- (void)setTitle:(NSString *)title forState:(UIControlState)state;


@end

NS_ASSUME_NONNULL_END

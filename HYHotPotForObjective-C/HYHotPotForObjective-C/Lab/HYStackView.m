//
//  HYStackView.m
//  Pods
//
//  Created by 韩丛旸 on 2019/2/19.
//

#import "HYStackView.h"
#import <FDStackView.h>
#import <Masonry.h>

@interface HYStackView ()

@end

@implementation HYStackView

- (FDStackView *)stackView {
    if (!_stackView) {
        _stackView = [[FDStackView alloc] init];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.distribution = UIStackViewDistributionEqualSpacing;
        _stackView.spacing = 0;
    }
    return _stackView;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.stackView];
        [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.equalTo(self);
            make.height.mas_greaterThanOrEqualTo(44);
        }];
    }
    return self;
}

- (void)addArrangedSubview:(UIView *)subView {
    [self.stackView addArrangedSubview:subView];
}

- (void)addArrangedSubviewArray:(NSArray *)subViewArray {
    
    for (UIView *v in subViewArray) {
        [self addArrangedSubview:v];
    }
}
- (void)clearAll {
    NSArray *arrangedSubViews = self.stackView.arrangedSubviews.copy;
    for (UIView *subView in arrangedSubViews) {
        [self.stackView removeArrangedSubview:subView];
    }
}

- (void)removeArrangedSubviewArray:(NSArray *)subViewArray {
    for (UIView *subView in subViewArray) {
        [self.stackView removeArrangedSubview:subView];
    }
}

- (void)removeArrangedSubview:(UIView *)view {
    [self.stackView removeArrangedSubview:view];
}

- (void)insertArrangedSubview:(UIView *)view atIndex:(NSUInteger)stackIndex {
    [self.stackView insertArrangedSubview:view atIndex:stackIndex];
}

- (void)setAxis:(UILayoutConstraintAxis)axis {
    _axis = axis;
    self.stackView.axis = _axis;

    if (axis == UILayoutConstraintAxisHorizontal) {
        [self.stackView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.height.equalTo(self);
            make.height.mas_greaterThanOrEqualTo(44);
        }];
    } else {
        [self.stackView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.equalTo(self);
            make.height.mas_greaterThanOrEqualTo(44);
        }];
    }
}

// fix UIButton Doesn't allow UIScrollView to scroll
- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ([view isKindOfClass:UIButton.class]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

- (NSArray *)arrangedSubviews {
    return self.stackView.arrangedSubviews;
}

- (void)setAlignment:(UIStackViewAlignment)alignment {
    self.stackView.alignment = alignment;
}

- (void)setIsNeedScrollWhenKeyBoardAppear:(BOOL)isNeedScrollWhenKeyBoardAppear {
    _isNeedScrollWhenKeyBoardAppear = isNeedScrollWhenKeyBoardAppear;
    if (!isNeedScrollWhenKeyBoardAppear) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cannotScroll) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(canScroll) name:UIKeyboardWillHideNotification object:nil];
    }
}

// MARK: 解决键盘挡住输入框的问题
- (void)cannotScroll {
    self.scrollEnabled = NO;
}

- (void)canScroll {
    self.scrollEnabled = YES;
}

@end

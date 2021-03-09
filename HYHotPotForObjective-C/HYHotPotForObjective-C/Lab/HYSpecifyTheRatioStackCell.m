//
//  HYSpecifyTheRatioStackCell.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/3.
//

#import "HYSpecifyTheRatioStackCell.h"
#import "HYStackView.h"
#import <Masonry.h>
#import <ReactiveObjC.h>

@interface HYSpecifyTheRatioStackCell ()

@property (nonatomic, strong) HYStackView *stack;

@end

@implementation HYSpecifyTheRatioStackCell

- (NSMutableArray<HYSpecifyIntrinsicContentView *> *)arrangedSubviews {
    
    if (!_arrangedSubviews) {
        _arrangedSubviews = @[].mutableCopy;
    }
    return _arrangedSubviews;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.stack = [[HYStackView alloc] init];
        self.stack.axis = UILayoutConstraintAxisHorizontal;
        self.stack.alignment = UIStackViewAlignmentLeading;
        self.stack.scrollEnabled = NO;
        [self addSubview:self.stack];
        [self.stack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

- (CGSize)intrinsicContentSize {

    return self.contentSize;
}

- (void)startLayout {
    
    __block CGFloat all = 0;
    [self.specifyTheRatios enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        all = all + obj.floatValue;
    }];
    
    
    [self.arrangedSubviews enumerateObjectsUsingBlock:^(HYSpecifyIntrinsicContentView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        CGSize originalSize = [obj intrinsicContentSize];
        CGFloat targetHeight = originalSize.height < 0.05 ? [self intrinsicContentSize].height : originalSize.height;
        obj.contentSize = CGSizeMake([self intrinsicContentSize].width * self.specifyTheRatios[idx].floatValue / all,
                                     targetHeight);
        [self.stack addArrangedSubview:obj];
    }];
}

- (void)append:(UIView *)subView {
    
    [self appends:@[subView]];
}

- (void)appends:(NSArray<UIView *> *)subViews {
        
    [self.arrangedSubviews addObjectsFromArray:subViews];
}

- (void)setAxis:(UILayoutConstraintAxis)axis {
    self.stack.axis = axis;
}

- (UILayoutConstraintAxis)axis {
    return self.stack.axis;
}

- (void)setAlignment:(UIStackViewAlignment)alignment {
    self.stack.alignment = alignment;
}

- (UIStackViewAlignment)alignment {
    return self.stack.alignment;
}

- (void)setSpacing:(CGFloat)spacing {
    self.stack.stackView.spacing = spacing;

}
- (CGFloat)spacing {
    return self.stack.stackView.spacing;
}

- (void)setDistribution:(UIStackViewDistribution)distribution {
    self.stack.stackView.distribution = distribution;

}
- (UIStackViewDistribution)distribution {
    return self.stack.stackView.distribution;
}

@end

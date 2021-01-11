//
//  HYEdgeInsetView.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import "HYEdgeInsetView.h"

@interface HYEdgeInsetView ()

@end

@implementation HYEdgeInsetView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.stack = [[UIStackView alloc] init];
        self.stack.distribution = UIStackViewDistributionEqualSpacing;
        self.stack.axis = UILayoutConstraintAxisVertical;
        self.stack.backgroundColor = UIColor.whiteColor;
        [self addSubview:self.stack];
        [self hy_updateConstraints];
    }
    return self;
}

- (void)setTop:(CGFloat)top {
    
    _top = top;
    [self hy_updateConstraints];
}

- (void)setBottom:(CGFloat)bottom {
    
    _bottom = bottom;
    [self hy_updateConstraints];
}

- (void)setTrailing:(CGFloat)trailing {
    
    _trailing = trailing;
    [self hy_updateConstraints];
}

- (void)setLeading:(CGFloat)leading {
    
    _leading = leading;
    [self hy_updateConstraints];
}

- (void)hy_updateConstraints {
    
    self.edgeInsets = UIEdgeInsetsMake(self.top, self.leading, self.bottom, self.trailing);
    [self.stack mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).mas_offset(self.edgeInsets);
    }];
    
}

@end

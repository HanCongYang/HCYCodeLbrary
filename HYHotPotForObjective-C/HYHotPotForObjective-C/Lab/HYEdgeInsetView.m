//
//  HYEdgeInsetView.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import "HYEdgeInsetView.h"

@implementation HYEdgeInsetView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.stack = [[UIStackView alloc] init];
        self.stack.distribution = UIStackViewDistributionEqualSpacing;
        self.stack.axis = UILayoutConstraintAxisVertical;
        self.stack.backgroundColor = UIColor.whiteColor;
        [self addSubview:self.stack];
        [self.stack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self).mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
    
    }
    return self;
}

@end

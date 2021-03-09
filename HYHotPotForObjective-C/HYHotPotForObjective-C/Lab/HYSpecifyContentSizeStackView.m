//
//  HYSpecifyContentSizeStackView.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "HYSpecifyContentSizeStackView.h"
#import "HYStackView.h"
#import <Masonry.h>

@interface HYSpecifyContentSizeStackView ()


@end

@implementation HYSpecifyContentSizeStackView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.stackView = [[HYStackView alloc] init];
                self.stackView.axis = UILayoutConstraintAxisHorizontal;
//        self.stackView.alignment = UIStackViewAlignmentLeading;
        [self addSubview:self.stackView];
        [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
    }
    return self;
}

@end

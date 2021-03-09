//
//  HYUISegmentView.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "HYUISegmentedControl.h"
#import "HYStackView.h"
#import <Masonry/Masonry.h>
#import "HYUIButton.h"
#import <ReactiveObjC.h>


@interface HYUISegmentedControl ()

@property (nonatomic, strong) HYStackView *stack;
@property (nonatomic, strong) NSMutableArray<HYUIButton *> *buttons;

@end

@implementation HYUISegmentedControl

- (NSMutableArray<HYUIButton *> *)buttons {
    
    if (!_buttons) {
        _buttons = @[].mutableCopy;
    }
    return _buttons;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.stack = [[HYStackView alloc] init];
        [self addSubview:self.stack];
        [self.stack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

- (void)append:(UIView *)subView {
    
    [self appends:@[subView]];
}

- (void)appends:(NSArray<HYUIButton *> *)subViews {
    
    @weakify(self);
    [subViews enumerateObjectsUsingBlock:^(HYUIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        @strongify(self);
        [self.stack addArrangedSubview:obj];
        __block HYUIButton *objForBlock = obj;
        obj.clickEvent = ^(UIButton * _Nonnull sender) {
          
            if (self.isSingleChoice == YES) {
                [self.buttons enumerateObjectsUsingBlock:^(HYUIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                               
                    obj.isSelected = NO;
                }];
            }
            objForBlock.isSelected = YES;
        };
        [self.buttons addObject:obj];
    }];
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

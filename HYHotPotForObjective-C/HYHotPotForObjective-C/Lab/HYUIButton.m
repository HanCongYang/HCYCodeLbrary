//
//  HYUIButton.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "HYUIButton.h"
#import <Masonry.h>
#import <ReactiveObjC.h>

@interface HYUIButton ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation HYUIButton

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        @weakify(self);
        [[self.button rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            @strongify(self);
            if (self.clickEvent) {
                self.clickEvent(self.button);
            }
        }];
        
        [RACObserve(self, isSelected) subscribeNext:^(NSNumber *x) {
                
            @strongify(self);
            if (x.boolValue == YES) {
                self.button.backgroundColor = self.selectedColor;
                [self.button setTitleColor:self.selectedTextColor forState:(UIControlStateNormal)];
            } else {
                self.button.backgroundColor = self.unSelectedColor;
                [self.button setTitleColor:self.unSelectedTextColor forState:(UIControlStateNormal)];
            }
            
        }];
    }
    return self;
}


- (void)setTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    
    [self.button setTitle:title forState:state];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    
    [super setBackgroundColor:backgroundColor];
    self.button.backgroundColor = backgroundColor;
}
@end

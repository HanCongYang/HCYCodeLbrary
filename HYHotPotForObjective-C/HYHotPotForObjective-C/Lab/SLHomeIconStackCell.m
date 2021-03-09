//
//  SLHomeIcon.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "SLHomeIconStackCell.h"
#import "HYUILabel.h"
#import "HYUIImageView.h"
#import "HYUILabel.h"
#import <Masonry.h>

@interface SLHomeIconStackCell ()

@property (nonatomic, strong) HYUIImageView *icon;
@property (nonatomic, strong) HYUILabel *label;


@end

@implementation SLHomeIconStackCell

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.icon = [[HYUIImageView alloc] init];
        [self addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self).mas_offset(5);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.label = [[HYUILabel alloc] init];
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.width.mas_greaterThanOrEqualTo(14);
            make.height.mas_greaterThanOrEqualTo(10);
        }];
    }
    return self;
}


- (void)setType:(NSString *)type {
    
    
    if ([type isEqualToString:@"网点名"]) {
        [self.icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.left.mas_equalTo(self).mas_offset(20);
            make.centerY.mas_equalTo(self);
        }];
        
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon.mas_right).mas_offset(14);
            make.centerY.mas_equalTo(self);
        }];
        
    }
    
    
}
@end

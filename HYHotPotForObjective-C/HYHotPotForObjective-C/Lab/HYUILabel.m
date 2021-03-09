//
//  HYUILabel.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/3.
//

#import "HYUILabel.h"
#import <Masonry.h>

@interface HYUILabel ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation HYUILabel

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.label = [[UILabel alloc] init];
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
        }];
    }
    return self;
}

- (void)setText:(NSString *)text {
    
    self.label.text = text;
}

- (NSString *)text {
    
    return self.label.text;
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).mas_offset(edgeInsets);
    }];
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    
    self.label.numberOfLines = numberOfLines;
}



@end

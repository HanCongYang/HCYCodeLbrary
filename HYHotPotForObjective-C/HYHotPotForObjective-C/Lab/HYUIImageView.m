//
//  HYUIImageView.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import "HYUIImageView.h"
#import <Masonry.h>

@interface HYUIImageView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation HYUIImageView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    _imageEdgeInsets = imageEdgeInsets;
    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self).mas_offset(20);
        make.right.bottom.mas_equalTo(self).mas_offset(-20);

    }];
}


@end

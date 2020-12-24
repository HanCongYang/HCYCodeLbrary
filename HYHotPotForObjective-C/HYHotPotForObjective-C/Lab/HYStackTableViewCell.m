//
//  HYStackTableViewCell.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import "HYStackTableViewCell.h"
#import "HYEdgeInsetView.h"

@interface HYStackTableViewCell ()

@property (nonatomic, strong) HYEdgeInsetView *edgeView;

@end

@implementation HYStackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.edgeView = [[HYEdgeInsetView alloc] init];
        [self.contentView addSubview:self.edgeView];
        [self.edgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
        
//        self.stack = [[FDStackView alloc] init];
//        self.stack.distribution = UIStackViewDistributionEqualSpacing;
//        self.stack.axis = UILayoutConstraintAxisVertical;
//        self.stack.backgroundColor = UIColor.whiteColor;
//        [self.contentView addSubview:self.stack];
//        [self.stack mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(self.contentView);
//        }];
//
        
        UILabel *l1 = [[UILabel alloc] init];
        l1.numberOfLines = 0;
        l1.text = @"111111\n23333";
        UILabel *l2 = [[UILabel alloc] init];
        l2.numberOfLines = 0;
        l2.text = @"111111\n2222222";
        [self.edgeView.stack addArrangedSubview:l1];
        [self.edgeView.stack addArrangedSubview:l2];

    }
    return self;
}

@end

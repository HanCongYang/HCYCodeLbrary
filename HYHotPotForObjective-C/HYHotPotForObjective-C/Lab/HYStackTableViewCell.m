//
//  HYStackTableViewCell.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import "HYStackTableViewCell.h"
#import "HYEdgeInsetView.h"
#import "HYSpecifyTheRatioStackCell.h"
#import "HYImageView.h"

@interface HYStackTableViewCell ()

@property (nonatomic, strong) HYEdgeInsetView *edgeView;
@property (nonatomic, strong) FDStackView *stack;

@end

@implementation HYStackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.edgeView = [[HYEdgeInsetView alloc] init];
        [self.contentView addSubview:self.edgeView];
        [self.edgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView).mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
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
        [l1 setContentHuggingPriority: UILayoutPriorityFittingSizeLevel forAxis: UILayoutConstraintAxisVertical];

        l1.text = @"111111\n23333";
        UILabel *l2 = [[UILabel alloc] init];
        l2.numberOfLines = 0;
        l2.text = @"111111\n2222222";
        [l2 setContentHuggingPriority: UILayoutPriorityFittingSizeLevel forAxis: UILayoutConstraintAxisVertical];
        [self.edgeView.stack addArrangedSubview:l1];
        [self.edgeView.stack addArrangedSubview:l2];
        
            HYSpecifyTheRatioStackCell *c = [[HYSpecifyTheRatioStackCell alloc] init];
            c.contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width - 40, 200);
            HYSpecifyIntrinsicContentView *v1 = [[HYSpecifyIntrinsicContentView alloc] init];
            v1.contentSize = CGSizeMake(100, 50);
            v1.backgroundColor = UIColor.redColor;
            HYSpecifyIntrinsicContentView *v2 = [[HYSpecifyIntrinsicContentView alloc] init];
            v2.backgroundColor = UIColor.blackColor;
            v2.contentSize = CGSizeMake(100, 100);
        //    HYSpecifyIntrinsicContentView *v3 = [[HYSpecifyIntrinsicContentView alloc] init];
        //    v3.backgroundColor = UIColor.blueColor;
        //    c.backgroundColor = UIColor.purpleColor;
//        
//            HYImageView *v3 = [[HYImageView alloc] init];
//            v3.contentSize = CGSizeMake(100, 200);
//            v3.imageEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
//        
            c.arrangedSubviews = @[v1, v2].mutableCopy;
            c.specifyTheRatios = @[@(2), @(1)].mutableCopy;
            [c startLayout];
            [self.edgeView.stack addArrangedSubview:c];
        

    }
    return self;
}

- (void)append:(UIView *)view {
    
    [self.edgeView.stack addArrangedSubview:view];

}

- (void)removeSubViewAtIndex:(NSUInteger)index {
    
    UIView *v = [self.edgeView.stack.arrangedSubviews objectAtIndex:index];
    if (v != nil) {
        [self.edgeView.stack removeArrangedSubview:v];
        [v removeFromSuperview];
    }
}

@end

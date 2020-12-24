//
//  HYTestFloatLayoutView.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import "HYTestFloatLayoutView.h"
#import <Masonry.h>

@implementation HYTestFloatLayoutView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

- (CGSize)sizeThatFits:(CGSize)size {
    // QMUI适用于AutoLayout技术
    
    self.detailLabel.preferredMaxLayoutWidth = size.width - 40;
    return [self systemLayoutSizeFittingSize:size];
}
@end

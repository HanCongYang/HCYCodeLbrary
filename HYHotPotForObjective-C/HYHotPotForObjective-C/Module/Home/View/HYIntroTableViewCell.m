//
//  HYIntroTableViewCell.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/29.
//

#import "HYIntroTableViewCell.h"
#import <ReactiveObjC.h>
#import "HYIntroModel.h"

@interface HYIntroTableViewCell ()

@property (nonatomic, strong) HYIntroModel *intro;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation HYIntroTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)receive:(id)anyObject context:(NSString *)context {

    if ([context isEqualToString:@"从首页进入"]) {
        
        RACTupleUnpack_(HYIntroModel *q) = anyObject;
        self.intro = q;
        self.titleLabel.text = self.intro.title;
        self.detailLabel.text = self.intro.detailIntro;
    }
}

@end

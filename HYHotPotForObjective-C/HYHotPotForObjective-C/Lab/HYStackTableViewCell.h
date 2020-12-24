//
//  HYStackTableViewCell.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/16.
//

#import <UIKit/UIKit.h>
#import <FDStackView.h>
#import <Masonry.h>
#import "HYStackView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYStackTableViewCell : UITableViewCell

@property (nonatomic, strong) FDStackView *stack;

@end

NS_ASSUME_NONNULL_END

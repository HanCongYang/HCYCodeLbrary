//
//  HYIntroModel.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/29.
//

#import "HYIntroModel.h"

@implementation HYIntroModel

+ (instancetype)modelWithTitle:(NSString *)title detailIntro:(NSString *)detailIntro {

    HYIntroModel *m = [[HYIntroModel alloc] init];
    m.title = title;
    m.detailIntro = detailIntro;
    return m;
}

@end

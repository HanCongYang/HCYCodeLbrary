//
//  HYIntroModel.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYIntroModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailIntro;

+ (instancetype)modelWithTitle:(NSString *)title detailIntro:(NSString *)detailIntro;

@end

NS_ASSUME_NONNULL_END

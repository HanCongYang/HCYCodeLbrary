//
//  HYUIFontUtils.h
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2021/3/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYUIFontUtils : NSObject

+ (UIFont *)fontSize:(NSInteger)fontSize isBold:(NSInteger)isBold;

+ (UIFont *)titleFont;

+ (UIFont *)detailFont;

@end

NS_ASSUME_NONNULL_END

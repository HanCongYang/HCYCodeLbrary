//
//  HYKeyboardManager.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/15.
//

#import "HYKeyboardManager.h"
#import "AppDelegate.h"

@implementation HYKeyboardManager

+ (void)closeAllKeyboard {
    
    if (@available(iOS 13.0, *)) {
        
        [[UIApplication sharedApplication].connectedScenes enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIWindowScene class]]
                && obj.activationState == UISceneActivationStateForegroundActive) {
                
                UIWindowScene *scene = (UIWindowScene *)obj;
                [scene.windows enumerateObjectsUsingBlock:^(UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (obj.isKeyWindow) {
                        [obj endEditing:YES];
                    }
                }];
            }
        }];
    } else {
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    }
}

@end

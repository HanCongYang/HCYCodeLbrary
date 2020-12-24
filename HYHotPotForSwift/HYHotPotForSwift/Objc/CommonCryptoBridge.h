//
//  CommonCryptoBridge.h
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonCryptoBridge : NSObject

- (void)printTest;

+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;
+ (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

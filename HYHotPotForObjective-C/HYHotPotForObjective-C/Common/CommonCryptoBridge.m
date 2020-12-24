//
//  CommonCryptoBridge.m
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/10.
//

#import "CommonCryptoBridge.h"
#import <CommonCrypto/CommonCrypto.h>
#import "GTMBase64.h"

const Byte iv[] = {1,2,3,4,5,6,7,8};
@implementation CommonCryptoBridge

- (void)printTest {
    
    NSLog(@"11111");
}

+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key {
    
    NSString *ciphertext = nil;
    
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [textData length];
    
    unsigned char buffer[1024];
    
    memset(buffer, 0, sizeof(char));
    
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          
                                          [key UTF8String], kCCKeySizeDES,
                                          
                                          iv,
                                          
                                          [textData bytes], dataLength,
                                          
                                          buffer, 1024,
                                          
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [GTMBase64 stringByEncodingData:data];
    }
    return ciphertext;
}

#pragma mark- 解密算法

+ (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key {
    
    NSString *plaintext = nil;
    
    NSData *cipherdata = [GTMBase64 decodeString:cipherText];
    
    unsigned char buffer[1024];
    
    memset(buffer, 0, sizeof(char));
    
    size_t numBytesDecrypted = 0;
    
    // kCCOptionPKCS7Padding|kCCOptionECBMode 最主要在这步
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          
                                          [key UTF8String], kCCKeySizeDES,
                                          
                                          iv,
                                          
                                          [cipherdata bytes], [cipherdata length],
                                          
                                          buffer, 1024,
                                          
                                          &numBytesDecrypted);
    
    if(cryptStatus == kCCSuccess) {
        NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        
        plaintext = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
    return plaintext;
}

@end

//
//  HYLoginYBWPRequest.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/15.
//

#import "HYLoginYBWPRequest.h"
#import "CommonCryptoBridge.h"
#import <AFNetworking.h>
#import <NSString+YYAdd.h>

@implementation HYLoginYBWPRequest

- (NSString *)requestUrl {
    NSString *passwordDes = [CommonCryptoBridge encryptUseDES:@"ybwp@1111" key:@"ybwpybwp"];
    NSString *userName =  AFPercentEscapedStringFromString([@"yb003902" description]);
    NSString *url= [NSString stringWithFormat:@"login?username=%@&password=%@&roleType=%@",userName,passwordDes.stringByURLEncode, @""];
    return url;
}

- (NSString *)baseUrl {
    return @"https://datybwp.djbx.com/member";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

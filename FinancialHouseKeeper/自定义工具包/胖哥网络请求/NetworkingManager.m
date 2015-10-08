//
//  NetworkingManager.m
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkingManager.h"

// 服务器接口
#define kBaseURL @"http://125.70.10.34:1234/icbc/"



@implementation NetworkingManager
+(AFHTTPRequestOperation *)postWithUrl:(NSString *)urlString requestParams:(NSDictionary *)params successHandler:(SuccessBlock)sucess failureHandler:(FailureBlock)failure {
    NSString *personId = @"0";
    NSString *publicString = [NSString stringWithFormat:@"<PERSON>%@</PERSON>",personId];
    
    NSMutableString *privateString = [NSMutableString stringWithCapacity:1];
    if (params.count > 0) {
        for (NSString *key in params.allKeys) {
            NSString *value = [params objectForKey:key];
            NSString *xmlString = [NSString stringWithFormat:@"<%@>%@</%@>", key, value, key];
            [privateString appendString:xmlString];
        }
    }
    
    NSString *requestString = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<CMS><PUBLICS>%@<COMMAND>FM001</COMMAND><APP_CODE>887</APP_CODE><TRX_ORIGIN>12002</TRX_ORIGIN></PUBLICS><PRIVATES><UPDATA>%@</UPDATA></PRIVATES></CMS>",publicString, privateString];
    
    NSDictionary *requestDic = @{@"requestXml":requestString};
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",kBaseURL, urlString];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    AFHTTPRequestOperation *operartion = [manager POST:requestUrl parameters:requestDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (sucess) {
            sucess(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure (error);
        }
    }];
    
    return operartion;
}
@end

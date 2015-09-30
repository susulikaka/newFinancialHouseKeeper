//
//  NetworkRequest.m
//  URLDemo
//
//  Created by 杨琴 on 15/9/28.
//  Copyright (c) 2015年 yangqin. All rights reserved.
//

#import "NetworkRequest.h"
#import "AFNetworking.h"
#import "URL.h"

@interface NetworkRequest ()

@property (nonatomic, strong) AFHTTPRequestOperation *operation;

@end

@implementation NetworkRequest

- (void)post:(NSString *)urlString parameters:(NSDictionary *)parameters successHandle:(successBlock)success failureHandle:(failureBlock)faile {
    
    NSString *personID = [UserModel getPerId];
//    personID  = personID == nil ? @"0" :personID;
    NSString *publicString = [NSString stringWithFormat:@"<PERSON>%@</PERSON>", personID];
    
    NSMutableString *privateString = [NSMutableString stringWithCapacity:1];
    if (parameters.count > 0) {
        for (NSString *key in parameters.allKeys) {
            NSString *value = [parameters objectForKey:key];
            NSString *string = [NSString stringWithFormat:@"<%@>%@</%@>", key, value, key];
            [privateString appendString:string];
        }
    }
    
    NSString *requestString = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<CMS><PUBLICS>%@<COMMAND>FM001</COMMAND><APP_CODE>887</APP_CODE><TRX_ORIGIN>12002</TRX_ORIGIN></PUBLICS><PRIVATES><UPDATA>%@</UPDATA></PRIVATES></CMS>",publicString, privateString];
    NSDictionary *requestDic = @{@"requestXml":requestString};
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",kBaseURL, urlString];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
   self.operation =  [manager POST:requestUrl parameters:requestDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(operation.responseString);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (faile) {
            faile(error);
        }
        
    }];
    
}

- (void)cancleRequest {
    
    if (self.operation) {
        [self.operation cancel];
    }
    
}

@end

//
//  NetworkingManager+HomeRequest.m
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

// 首页接口
#define kHomePageURL @"ipad/show/show_findModel.action?"

#import "NetworkingManager+HomeRequest.h"

@implementation NetworkingManager (HomeRequest)
+(AFHTTPRequestOperation *)getHomeImageInfoWithSuccessHandler:(SuccessBlock)success failuer:(FailureBlock)failuer {
    AFHTTPRequestOperation *operation = [self postWithUrl:kHomePageURL requestParams:nil successHandler:success failureHandler:failuer];
    return operation;
}
@end

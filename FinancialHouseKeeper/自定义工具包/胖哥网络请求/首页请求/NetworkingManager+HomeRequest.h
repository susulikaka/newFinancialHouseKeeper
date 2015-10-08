//
//  NetworkingManager+HomeRequest.h
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

#import "NetworkingManager.h"

@interface NetworkingManager (HomeRequest)
+ (AFHTTPRequestOperation *)getHomeImageInfoWithSuccessHandler:(SuccessBlock)success failuer:(FailureBlock)failuer;
@end

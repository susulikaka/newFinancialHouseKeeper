//
//  NetworkingManager.h
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBlock)(NSError *error);

@interface NetworkingManager : NSObject
+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)urlString requestParams:(NSDictionary *)params successHandler:(SuccessBlock)sucess failureHandler:(FailureBlock)failure;
@end

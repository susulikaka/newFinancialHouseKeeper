//
//  NetworkRequest.h
//  URLDemo
//
//  Created by 杨琴 on 15/9/28.
//  Copyright (c) 2015年 yangqin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(NSString * responds)
;

typedef void(^failureBlock)(NSError *error);

@interface NetworkRequest : NSObject

- (void)post:(NSString *)urlString parameters:(NSDictionary *)parameters successHandle:(successBlock)success failureHandle:(failureBlock)faile;

- (void)cancleRequest;

@end

//
//  UserModel.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject


/**
 *  //保存用户id
 *
 *  @param perID 用户id
 */
+(void)savePerId : (NSString *)perID;

/**
 *  //得到用户Id
 *
 *  @return 用户Id
 */
+(NSString *)getPerId;
/**
 *  //判断是否已经登录
 *
 *  @return 1：已登录 0:未登录
 */
+(BOOL)isLogin;

@end

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
 *  保存tokenId
 *
 *  @param token tokenId
 */
+(void)saveTokenId : (NSString *)token;
/**
 *  得到tokenId
 *
 *  @param token tokenId
 *
 *  @return
 */
+(NSString *)getTokenId;
/**
 *  得到UDID
 *
 *  @return
 */
+(NSString *)getUDID;
/**
 *  保存登录状态
 *
 *  @param state
 *
 *  @return
 */
+(void)saveLoginState : (BOOL)state;
/**
 *  //判断是否已经登录
 *
 *  @return 1：已登录 0:未登录
 */
+(BOOL)isLogin;

@end

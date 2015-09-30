//
//  UserModel.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


+(void)savePerId : (NSString *)perID{
    [[NSUserDefaults standardUserDefaults] setObject:perID forKey:@"personID"];
}


+(NSString *)getPerId{
    NSString * perID = [[NSUserDefaults standardUserDefaults] objectForKey:@"personID"];
    
    if (perID == nil) {
        return @"0";
    }else{
        return perID;
    }
    
}


+(BOOL)isLogin{
//    if ([self getPerId] == nil) {
//        return NO;
//    }else{
//        return YES;
//    }
    return YES;
}
@end

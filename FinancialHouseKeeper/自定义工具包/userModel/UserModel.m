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
    
    if (perID == nil || [perID isEqualToString:@"0"]) {
        return @"0";
    }else{
        return perID;
    }
    
}

+(void)saveTokenId:(NSString *)token{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"TOKENID"];
}

+(NSString *)getTokenId{
    NSString * perID = [[NSUserDefaults standardUserDefaults] objectForKey:@"TOKENID"];
    
    if (perID == nil) {
        return @"0";
    }else{
        return perID;
    }
}

+(NSString *)getUDID{
    
    return @"FFFFFFFFAC4A9DBE8005463697C15AADEA639730";
}

+(void)saveLoginState:(BOOL)state{
    if (state == NO) {
        [self savePerId:@"0"];
    }
}

+(BOOL)isLogin{
    if ([self getPerId] == nil || [[self getPerId] isEqualToString:@"0"]) {
        return NO;
    }else{
        return YES;
    }
}
@end

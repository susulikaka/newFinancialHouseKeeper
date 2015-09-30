//
//  FunctionList.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^listBlock)(NSArray * list);

@interface FunctionList : NSObject

@property(nonatomic,strong,readonly) __block NSArray * beLogfunArr;/** < 模块列表 */
@property(nonatomic,strong,readonly) __block NSArray * afLogFunList;/** < 登录后的模块列表 */
@property(nonatomic,copy) listBlock list;/** < 返回的listblock */

-(void)getAfLogFunList : (void(^)(NSArray * list))listBlock;
-(void)getBeLogFunList : (void(^)(NSArray * list))listBlock;
@end

//
//  BankCardList.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^cardListBlock)(NSDictionary * list);

@interface BankCardList : NSObject

@property(nonatomic,strong) __block NSMutableDictionary * cardDic;/** < 银行卡列表 */
@property(nonatomic,copy) cardListBlock cardList;/** < 返回的listblock */

-(void)getCardDic : (void(^)(NSDictionary * list))listBlock;/** < 得到银行卡首页列表 */

@end

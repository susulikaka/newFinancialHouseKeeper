//
//  BankCardList.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^cardListBlock)(NSDictionary * list);/** < 银行卡的 */
typedef void(^searchListBlock)(NSArray * list);/** < 搜索的列表 */


@interface BankCardList : NSObject

@property(nonatomic,strong) __block NSMutableDictionary * cardDic;/** < 银行卡列表 */
@property(nonatomic,strong) __block NSMutableArray * searchArr;/** < 搜索列表 */
@property(nonatomic,copy) cardListBlock cardList;/** < 返回的listblock */
@property(nonatomic,copy) searchListBlock searchList; /** < 返回的搜索列表 */


-(void)getCardDic : (void(^)(NSDictionary * list))listBlock;/** < 得到银行卡首页列表 */


-(void)searchCardByName:(NSString *)name : (void(^)(NSArray * list))listBlock;/** < 通过姓名查找银行卡 */
@end

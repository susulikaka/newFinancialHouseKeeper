//
//  FunctionList.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "FunctionList.h"

typedef listBlock listBlock;

@interface FunctionList ()

@property(nonatomic,strong) NSArray * beLogfunArr;/** < 模块列表 */
@property(nonatomic,strong) NSArray * afLogFunList;/** < 登录后的模块列表 */
@property(nonatomic,strong)NetworkRequest * request;/** < 请求 */
@property(nonatomic,strong) Parse * parse;/** < 解析 */
@end

@implementation FunctionList


- (void)getAfLogFunList:(void (^)(NSArray * list))listBlock{
    self.afLogFunList = [NSArray array];

    [self.request post:LIST_URL parameters:nil successHandle:^(NSString *responds) {
        
        //解析数据
        self.parse = [[Parse alloc] init];
        self.afLogFunList = [self.parse parse:responds nodePath:@"////key"];
        self.list = listBlock;
        self.list(self.afLogFunList);
    } failureHandle:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
}

- (void)getBeLogFunList:(void (^)(NSArray * list))listBlock{
    self.beLogfunArr = @[@"首页",@"金融资讯",@"理财服务",@"银行卡",@"代理产品",@"我的网银"];
    self.list = listBlock;
    self.list(self.beLogfunArr);
}

#pragma mark - getter

- (NetworkRequest *)request{
    if (!_request) {
        _request = ({
            NetworkRequest * request = [[NetworkRequest alloc] init];
            request;
        });
    }
    return _request;
}
@end

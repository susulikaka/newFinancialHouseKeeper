//
//  BankCardList.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "BankCardList.h"

typedef cardListBlock cardList;


@interface BankCardList ()

@property(nonatomic,strong)NetworkRequest * request;
@property(nonatomic,strong) Parse * parse;
//@property(nonatomic,strong) NSArray * <# objectName #>;

@end

@implementation BankCardList

- (void)searchCardByName:(NSString *)name :(void (^)(NSArray *))listBlock{
    self.searchList = listBlock;
    NSDictionary * params = @{@"searcherType":@"0",
                              @"startNum":@"0",
                              @"pageSize":@"10",
                              @"typeCode":@"5",
                              @"insutype":@"",
                              @"insudetailtype":@"",
                              @"insuid":@"",
                              @"fundtype":@"",
                              @"comName":@"",
                              @"currtype":@"",
                              @"proDrate":@"",
                              @"validTime":@"",
                              @"risklevel":@"",
                              @"proName":name,
                              @"typeId":@""};
    
    [self.request post:PRODUCT_INFO_NAME_URL parameters:params successHandle:^(NSString *responds) {
        self.searchArr = [NSMutableArray arrayWithCapacity:0];
        self.searchArr = [responds copy];
    } failureHandle:^(NSError *error) {
        
    }]; 
}


/** < 得到银行卡列表 */
- (void)getCardDic:(void (^)(NSDictionary *))listBlock{
    self.cardList = listBlock;
    self.cardDic = [NSMutableDictionary dictionary];
    NSDictionary * params = @{@"pageSize":@"10",
                              @"startNum":@"0",
                              @"typeId":@"",
                              @"typeCode":@"5"};
    [self.request post:PRODUCT_LIST_URL parameters:params successHandle:^(NSString *responds) {
        
        self.cardDic[@"productName"] =[self.parse parse:responds nodePath:@"////productName"];
        self.cardDic[@"summary"] = [self.parse parse:responds nodePath:@"////summary"];
        
        
        NSMutableArray * resultArr = (NSMutableArray *)[self.parse parse:responds nodePath:@"///showImgUrl"];
        [resultArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            /** < 得到图片地址 */
            NSString * imgUrl = [self modificationImageUrlAddressWithUrl:resultArr[idx]];
            /** < 转换图片 */
            resultArr[idx] = imgUrl;
        }];
        
        self.cardDic[@"img"] = resultArr;
        self.cardList(self.cardDic);
    } failureHandle:^(NSError *error) {
        
    }];
}
/** < 修改图片的地址 */
- (NSString *)modificationImageUrlAddressWithUrl:(NSString *)url {
    if (!url) {
        return nil;
    }
    NSString *newUrl = [url stringByReplacingOccurrencesOfString:@"http://127.0.0.1:8081/icbcfile/a/" withString:@"http://125.70.10.34:1234/icbc/"];
    return newUrl;
}
/** < 得到图片 */
- (UIImageView *)viewsLoadData:(NSString *)datas {
    UIImageView *imageView = [[UIImageView alloc] init];

        [imageView sd_setImageWithURL:[NSURL URLWithString:datas] placeholderImage:nil];
    return imageView;
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

- (Parse *)parse{
    if (!_parse) {
        _parse = ({
            Parse * parse = [[Parse alloc] init];
            parse;
        });
    }
    return _parse;
}
@end

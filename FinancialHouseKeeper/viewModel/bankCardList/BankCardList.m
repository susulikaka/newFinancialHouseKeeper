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

- (NSString *)modificationImageUrlAddressWithUrl:(NSString *)url {
    if (!url) {
        return nil;
    }
    NSString *newUrl = [url stringByReplacingOccurrencesOfString:@"http://127.0.0.1:8081/icbcfile/a/" withString:@"http://125.70.10.34:1234/icbc/"];
    return newUrl;
}

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

//
//  ProfessionInfoView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "ProfessionInfoView.h"

@implementation ProfessionInfoView


- (instancetype)init{
    if (self = [super init]) {
        [self initProfessionInfoViewInterface];
    }
    return self;
}

- (void)initProfessionInfoViewInterface{
    self.backgroundColor = [UIColor greenColor];
    self.frame = CGRectMake(0, 0, 600, 750);
}
@end

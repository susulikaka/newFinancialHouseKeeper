//
//  PersonalInfoView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "PersonalInfoView.h"

@implementation PersonalInfoView


- (instancetype)init{
    if (self = [super init]) {
        [self initPersonalInfoViewInterface];
    }
    return self;
}

- (void)initPersonalInfoViewInterface{
    self.backgroundColor = [UIColor yellowColor];
    self.frame = CGRectMake(0, 0, 600, 750);
}
@end

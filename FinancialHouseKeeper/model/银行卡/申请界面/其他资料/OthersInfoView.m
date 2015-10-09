//
//  OthersView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "OthersInfoView.h"

@implementation OthersInfoView


- (instancetype)init{
    if (self = [super init]) {
        [self initOthersInfoViewInterface];
    }
    return self;
}

- (void)initOthersInfoViewInterface{
    self.backgroundColor = [UIColor blueColor];
    self.frame = CGRectMake(0, 0, 600, 750);
}
@end

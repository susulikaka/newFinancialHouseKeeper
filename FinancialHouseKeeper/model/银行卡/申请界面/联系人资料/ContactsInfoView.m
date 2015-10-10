//
//  ContactsView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "ContactsInfoView.h"

@implementation ContactsInfoView


- (instancetype)init{
    if (self = [super init]) {
        [self initContactsInfoViewInterface];
    }
    return self;
}

- (void)initContactsInfoViewInterface{
    self.backgroundColor = [UIColor cyanColor];
    self.frame = CGRectMake(0, 0, 600, 750);
}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    NSLog(@"hehe");
}
@end

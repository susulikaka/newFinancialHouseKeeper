//
//  PersonalInfoView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "PersonalInfoView.h"



@interface PersonalInfoView ()

@property(nonatomic,strong)UITextField * name;
@property(nonatomic,strong) UITextField * idCard;
@property(nonatomic,strong) UITextField * phone;

@end

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
    
    [self addSubview:self.name];
    [self addSubview:self.idCard];
    [self addSubview:self.phone];
}

#pragma mark - 创建信号

-(void)creatSignal{
    
}

#pragma mark - 发送信号

#pragma mark - getter

- (UITextField *)name{
    if (!_name) {
        _name = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(80, 100, 200, 30)];
            text.placeholder = @"name";
            text;
        });
    }
    return _name;
}
- (UITextField *)idCard{
    if (!_idCard) {
        _idCard = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 200, 30)];
            text.placeholder = @"idCard";
            text;
        });
    }
    return _idCard;
}


- (UITextField *)phone{
    if (!_phone) {
        _phone = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(80, 200, 200, 30)];
            text.placeholder = @"phone";
            text;
        });
    }
    return _phone;
}

@end

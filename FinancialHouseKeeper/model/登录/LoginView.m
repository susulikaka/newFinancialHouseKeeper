//
//  LoginView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/30.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

-(void)initLoginInterface;

@end

@implementation LoginView

- (instancetype)init{
    if (self = [super init]) {
        [self initLoginInterface];
    }
    return self;
}

- (void)initLoginInterface{
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    [self addSubview:self.backView];
    [self addSubview:self.account];
    [self addSubview:self.accountText];
    [self addSubview:self.pwd];
    [self addSubview:self.pwdText];
    [self addSubview:self.okBtn];
    [self addSubview:self.noBtn];
}

#pragma mark - getter

- (UIButton *)okBtn{
    if (!_okBtn) {
        _okBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(60, 247, 140, 40)];
            btn;
        });
    }
    return _okBtn;
}

- (UIView *)backView{
    if (!_backView) {
        _backView = ({
            UIView * text = [[UIView alloc] initWithFrame:CGRectMake(170, 120, 200, 35)];
            text.backgroundColor = RGB_COLOR(102, 102, 102, 1);
            text.layer.cornerRadius = 5;
            text.layer.masksToBounds = YES;
            text;
        });
    }
    return _backView;
}

- (UITextField *)pwdText{
    if (!_pwdText) {
        _pwdText = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(170, 120, 200, 35)];
            text.layer.cornerRadius = 5;
            text.layer.masksToBounds = YES;
            text;
        });
    }
    return _pwdText;
}

- (UITextField *)accountText{
    if (!_accountText) {
        _accountText = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(170, 60, 200, 35)];
            text.layer.cornerRadius = 5;
            text.layer.masksToBounds = YES;
            text;
        });
    }
    return _accountText;
}

- (UILabel *)account{
    if (!_account) {
        _account = ({
            UILabel * account = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 135, 35)];
            account.text = @"卡号(账)/用户名";
            account.textColor = [UIColor whiteColor];
            account;
            });
    }
    return _account;
}

- (UILabel *)pwd{
    if (!_pwd) {
        _pwd = ({
            UILabel * account = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 135, 35)];
            account.text = @"密码";
            account.textColor = [UIColor whiteColor];
            account;
        });
    }
    return _pwd;
}

@end

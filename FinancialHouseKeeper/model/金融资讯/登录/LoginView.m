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

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initLoginInterface];
    }
    return self;
}

- (void)initLoginInterface{
    self.isGetAccount = NO;
    self.backView.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    /** < 添加组件 */
    [self addSubview:self.backView];
    [self.backView addSubview:self.account];
    [self.backView addSubview:self.accountText];
    [self.backView addSubview:self.pwd];
    [self.backView addSubview:self.pwdText];
    [self.backView addSubview:self.note];
    [self.backView addSubview:self.okBtn];
    [self.backView addSubview:self.noBtn];
    [self.backView addSubview:self.getAccountBtn];
    
    /** < 添加点击事件 */
    [self.getAccountBtn addTarget:self action:@selector(action_getAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.okBtn addTarget:self action:@selector(action_ok) forControlEvents:UIControlEventTouchUpInside];
    [self.noBtn addTarget:self action:@selector(action_no) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - action

//确定按钮
-(void)action_ok{
    /** < 得到对应的用户名和密码，登录 */
    NSDictionary * params = @{@"CUSTNAME" : self.accountText.text,
                              @"CUSTPASS" : self.pwdText.text,
                              @"UDID" : [UserModel getUDID],
                              @"TOKENID" : [UserModel getTokenId]};
    
    [self.loginRequest post:LOGIN_URL parameters:params successHandle:^(NSString *responds) {
        //解析数据
        Parse * parse = [[Parse alloc] init];
        NSArray * result = [parse parse:responds nodePath:@"//isOk"];
        NSString * isOk = result[0];
        NSString * errorCode = [parse parse:responds nodePath:@"//erroCode"][0];
        NSString * errorMsg = [parse parse:responds nodePath:@"//errorMes"][0];
        
        if ([isOk isEqualToString:@"true"] && [errorCode isEqualToString:@"0"]) {
             NSLog(@"success : %@",errorMsg);
            /** < 修改功能模块列表 */
            
            NSString * perId = [parse parse:responds nodePath:@"///string"][0];
            [UserModel savePerId:perId];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginState" object:nil userInfo:@{@"login":[NSNumber numberWithBool:[UserModel isLogin]]}];
            [self removeFromSuperview];
            
        }else{
            NSLog(@"success : %@",errorMsg);
        }
       
    } failureHandle:^(NSError *error) {
        //登录失败
        NSLog(@"fail");
    }];
    
}

-(void)action_no{
    /** < 如果是获取用户信息页面，则翻转回去 */
    if (self.isGetAccount) {
        [self action_getAccount];
    }else{
        /** < 如果是登录界面，移除 */
        [self removeFromSuperview];
    }
}

-(void)action_getAccount{
    [UIView transitionWithView:self.backView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        if (self.isGetAccount == NO) {
            self.note.hidden = YES;
            self.getAccountBtn.hidden = YES;
            self.isGetAccount = YES;
        }else{
            self.note.hidden = NO;
            self.getAccountBtn.hidden = NO;
            self.isGetAccount = NO;
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - getter

- (NetworkRequest *)loginRequest{
    if (!_loginRequest) {
        _loginRequest = ({
            NetworkRequest * request = [[NetworkRequest alloc] init];
            request;
        });
    }
    return _loginRequest;
}

- (UIButton *)getAccountBtn{
    if (!_getAccountBtn) {
        _getAccountBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(250, 330, 140, 35)];
            [btn setImage:IMAGE_CONTENT(@"取回用户名.png")  forState:UIControlStateNormal];
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = YES;
            btn;
        });
    }
    return _getAccountBtn;
}

- (UIButton *)okBtn{
    if (!_okBtn) {
        _okBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(60, 247, 130, 50)];
            [btn setImage:IMAGE_CONTENT(@"登录-确定.png")  forState:UIControlStateNormal];
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = YES;
            btn;
        });
    }
    return _okBtn;
}

- (UIButton *)noBtn{
    if (!_noBtn) {
        _noBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(230, 247, 130, 50)];
            [btn setImage:IMAGE_CONTENT(@"登录-取消.png")  forState:UIControlStateNormal];
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = YES;
            btn;
        });
    }
    return _noBtn;
}

- (UILabel *)note{
    if (!_note) {
        _note = ({
            UILabel * account = [[UILabel alloc] initWithFrame:CGRectMake(50, 170, 300, 35)];
            account.text = @"首次登陆，请输入您签约时的主卡卡号以及预留密码";
            account.font = [UIFont systemFontOfSize:13];
            account.textColor = [UIColor whiteColor];
            account;
        });
    }
    return _note;
}

- (UIImageView *)backView{
    if (!_backView) {
        _backView = ({
            UIImageView * text = [[UIImageView alloc] initWithFrame:CGRectMake(180, 300, 410, 410)];
            text.image = IMAGE_CONTENT(@"登录灰色背景.png");
            text.layer.cornerRadius = 10;
            text.layer.masksToBounds = YES;
            text;
        });
    }
    return _backView;
}

- (UITextField *)pwdText{
    if (!_pwdText) {
        _pwdText = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(180, 120, 200, 35)];
            text.layer.cornerRadius = 5;
            text.layer.masksToBounds = YES;
            text.backgroundColor = [UIColor whiteColor];
            text;
        });
    }
    return _pwdText;
}

- (UITextField *)accountText{
    if (!_accountText) {
        _accountText = ({
            UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(180, 60, 200, 35)];
            text.layer.cornerRadius = 5;
            text.layer.masksToBounds = YES;
            text.backgroundColor = [UIColor whiteColor];
            text;
        });
    }
    return _accountText;
}

- (UILabel *)account{
    if (!_account) {
        _account = ({
            UILabel * account = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 140, 35)];
            account.text = @"卡号(账)/用户名";
            account.font = [UIFont systemFontOfSize:20];
            account.textColor = [UIColor whiteColor];
            account;
            });
    }
    return _account;
}

- (UILabel *)pwd{
    if (!_pwd) {
        _pwd = ({
            UILabel * account = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 140, 35)];
            account.text = @"密            码";
            account.font = [UIFont systemFontOfSize:20];
            account.textColor = [UIColor whiteColor];
            account;
        });
    }
    return _pwd;
}

@end

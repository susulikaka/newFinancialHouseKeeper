//
//  LoginView.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/30.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property(nonatomic,strong) UIView * backView;/** < 背景 */

@property(nonatomic,strong) UILabel * account;
@property(nonatomic,strong) UILabel * pwd;

@property(nonatomic,strong) UITextField * accountText;/** < 账号 */
@property(nonatomic,strong) UITextField * pwdText;/** < 密码 */

@property(nonatomic,strong) UILabel * note;
@property(nonatomic,strong) UIButton * okBtn;
@property(nonatomic,strong) UIButton * noBtn;

+(instancetype)showLoginLabel;

@end

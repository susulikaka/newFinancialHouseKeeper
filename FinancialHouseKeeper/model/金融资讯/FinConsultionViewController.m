//
//  FinConsultionViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "FinConsultionViewController.h"
#import "DepositInterestRateView.h"
#import "ForeignExchangeView.h"
#import "InvestingAndFinancingView.h"
#import "NearbyBranchView.h"

@interface FinConsultionViewController ()

@property (nonatomic, strong) DepositInterestRateView *depositInterestView; /**< 存款利率view */
@property (nonatomic, strong) ForeignExchangeView *foreignExchangeView; /**< 外汇利率view */
@property (nonatomic, strong) InvestingAndFinancingView *investingAndFinancingView; /**< 投资理财View */
@property (nonatomic, strong) NearbyBranchView *nearByView; /**< 附近网点view */

-(void)initFinConsultInterface;
@end

@implementation FinConsultionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFinConsultInterface];
}


- (void)initFinConsultInterface{
    self.bankModelImageView.image = IMAGE_CONTENT(@"金融资讯页眉_24.png");
    [self.firstButton setImage:IMAGE_CONTENT(@"存贷利率_15.png") forState:UIControlStateNormal];
    [self.firstButton setImage:IMAGE_CONTENT(@"存贷利率_15-1.png") forState:UIControlStateSelected];
    [self.firstButton addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
    self.firstButton.selected = YES;
    [self.view addSubview:self.depositInterestView];
    [self.secondButton setImage:IMAGE_CONTENT(@"外汇贵金属_未选中.png") forState:UIControlStateNormal];
    [self.secondButton setImage:IMAGE_CONTENT(@"外汇贵金属_选中.png") forState:UIControlStateSelected];
    [self.secondButton addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdButton setImage:IMAGE_CONTENT(@"投资理财_21.png") forState:UIControlStateNormal];
    [self.thirdButton setImage:IMAGE_CONTENT(@"投资理财_21-1.png") forState:UIControlStateSelected];
    [self.thirdButton addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
    [self.fourthButton setImage:IMAGE_CONTENT(@"未选中 附近网点.png") forState:UIControlStateNormal];
    [self.fourthButton setImage:IMAGE_CONTENT(@"选中 附近网点.png") forState:UIControlStateSelected];
    [self.fourthButton addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - action
- (void)action_button:(UIButton *)sender {
    for (int i = 1000; i< 1004; i++) {
        UIButton * btn = (UIButton *)[self.view viewWithTag:i];
        btn.selected = NO;
    }
    sender.selected = YES;
    switch (sender.tag) {
        case 1000:
            if (!self.depositInterestView.superview) {
                [self.view.subviews.lastObject removeFromSuperview];
                [self.view addSubview:self.depositInterestView];
            }
            break;
        case 1001:
            if (!self.foreignExchangeView.superview) {
                [self.view.subviews.lastObject removeFromSuperview];
                [self.view addSubview:self.foreignExchangeView];
            }
            break;
        case 1002:
            if (!self.investingAndFinancingView.superview) {
                [self.view.subviews.lastObject removeFromSuperview];
                [self.view addSubview:self.investingAndFinancingView];
            }
            
            break;
        case 1003:
            if (!self.nearByView.superview) {
                [self.view.subviews.lastObject removeFromSuperview];
                [self.view addSubview:self.nearByView];
            }
            break;
        default:
            break;
    }
}

#pragma mark - getter
- (DepositInterestRateView *)depositInterestView {
    if (!_depositInterestView) {
        _depositInterestView = ({
            DepositInterestRateView *imageView = [[DepositInterestRateView alloc] initWithFrame:CGRectMake(0, 80, 708, 924)];
            imageView;
        });
    }
    return _depositInterestView;
}

- (ForeignExchangeView *)foreignExchangeView {
    if (!_foreignExchangeView) {
        _foreignExchangeView = ({
            ForeignExchangeView *imageView = [[ForeignExchangeView alloc] initWithFrame:CGRectMake(0, 80, 708, 924)];
            imageView;
        });
    }
    return _foreignExchangeView;
}

- (NearbyBranchView *)nearByView {
    if (!_nearByView) {
        _nearByView = ({
            NearbyBranchView *imageView = [[NearbyBranchView alloc] initWithFrame:CGRectMake(0, 80, 708, 924)];
            imageView;
        });
    }
    return _nearByView;
}

- (InvestingAndFinancingView *)investingAndFinancingView {
    if (!_investingAndFinancingView) {
        _investingAndFinancingView = ({
            InvestingAndFinancingView *imageView = [[InvestingAndFinancingView alloc] initWithFrame:CGRectMake(0, 80, 708, 924)];
            imageView;
        });
    }
    return _investingAndFinancingView;
}


@end

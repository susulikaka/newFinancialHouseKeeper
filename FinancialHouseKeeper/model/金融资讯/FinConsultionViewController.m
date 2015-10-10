//
//  FinConsultionViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "FinConsultionViewController.h"
#import "DepositInterestRateView.h"

@interface FinConsultionViewController ()

@property (nonatomic, strong) DepositInterestRateView *depositInterestView; /**< 存款利率图片 */

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
            if (!self.depositInterestView) {
                [self.view addSubview:self.depositInterestView];
            }
            break;
        case 1001:
            
            break;
        case 1002:
            
            break;
        case 1003:
            
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


@end

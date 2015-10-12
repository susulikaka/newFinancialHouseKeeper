//
//  InvestingAndFinancingView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/10.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "InvestingAndFinancingView.h"

@interface InvestingAndFinancingView ()

@property (nonatomic, strong) UIImageView *manageTitleView; //理财
@property (nonatomic, strong) UIImageView *fundsTitleView;  //基金
@property (nonatomic, strong) UIButton *manageButton;
@property (nonatomic, strong) UIButton *fundsButton;
@property (nonatomic, strong) UIImageView *searchImageView; /**< 搜索背景图片 */
@property (nonatomic, strong) UITextField *searchTextField; /**< 搜索文本框 */
@property (nonatomic, strong) UIImageView *manageView;
@property (nonatomic, strong) UIImageView *fundsView;

@end

@implementation InvestingAndFinancingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.manageTitleView];
        [self addSubview:self.searchImageView];
        [self addSubview:self.searchTextField];
        [self addSubview:self.manageView];
        [self addSubview:self.manageButton];
        [self addSubview:self.fundsButton];
    }
    return self;
}

#pragma mark - action 
- (void)action_button:(UIButton *)sender {
    for (int i = 100; i < 102; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:1];
        btn.selected = NO;
    }
    sender.selected = YES;
    switch (sender.tag) {
        case 100:
            if (!self.manageTitleView.superview) {
                [self.fundsTitleView removeFromSuperview];
                [self.fundsView removeFromSuperview];
                [self addSubview:self.manageTitleView];
                [self addSubview:self.manageView];
            }
            break;
        case 101:
            if (!self.fundsTitleView.superview) {
                [self.manageTitleView removeFromSuperview];
                [self.manageView removeFromSuperview];
                [self addSubview:self.manageTitleView];
                [self addSubview:self.manageView];
            }
            break;
        default:
            break;
    }
}

#pragma mark - getter
- (UIImageView *)manageTitleView {
    if (!_manageTitleView) {
        _manageTitleView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 40, 628, 37)];
            imageView.image = IMAGE_CONTENT(@"理财选中_基金未选中.png");
            imageView;
        });
    }
    return _manageTitleView;
}

- (UIImageView *)fundsTitleView {
    if (!_fundsTitleView) {
        _fundsTitleView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 40, 628, 37)];
            imageView.image = IMAGE_CONTENT(@"理财未选中_基金选中.png");
            imageView;
        });
    }
    return _fundsTitleView;
}

- (UIButton *)manageButton {
    if (!_manageButton) {
        _manageButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(35, 40, 100, 35);
            button.tag = 100;
            button.selected = YES;
            [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _manageButton;
}

- (UIButton *)fundsButton {
    if (!_fundsButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(140, 40, 50, 50);
        button.tag = 101;
        [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
        button;
    }
    return _fundsButton;
}

- (UIImageView *)searchImageView {
    if (!_searchImageView) {
        _searchImageView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(350, 100, 316, 31)];
            imageView.image = IMAGE_CONTENT(@"搜索框.png");
            imageView;
        });
    }
    return _searchImageView;
}

- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(360, 102, 280, 30)];
        _searchTextField.placeholder = @"请输出代码或名称查询";
    }
    return _searchTextField;
}

- (UIImageView *)manageView {
    if (!_manageView) {
        _manageView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 150, 630, 680)];
            imageView.image = IMAGE_CONTENT(@"金融资讯-投资理财-理财表格.png");
            imageView;
        });
    }
    return _manageView;
}

- (UIImageView *)fundsView {
    if (!_fundsView) {
        _fundsView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(350, 100, 630, 680)];
            imageView.image = IMAGE_CONTENT(@"金融资讯-投资理财-基金表.png");
            imageView;
        });
    }
    return _fundsView;
}

@end

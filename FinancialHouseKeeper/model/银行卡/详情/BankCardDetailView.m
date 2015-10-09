//
//  BankCardDetailView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "BankCardDetailView.h"
#import "applyView.h"

@interface BankCardDetailView ()

@property(nonatomic,strong)UIButton * collectionBtn;/** < 收藏按钮*/
@property(nonatomic,strong) UIButton * applayBtn;/** < 申请按钮 */
@property(nonatomic,strong) UIButton * closeBtn;/** < 关闭按钮 */

@property(nonatomic,strong) applyView * applyview;/** < 申请页面 */


-(void)initBankCardDetailInterface;

@end

@implementation BankCardDetailView


- (instancetype)init{
    if (self = [super init]) {
        [self initBankCardDetailInterface];
    }
    return self;
}

#pragma mark - init
- (void)initBankCardDetailInterface{
    self.bounds = CGRectMake(0, 0, 690, 910);
    self.center = CGPointMake(320, 910 * 2);
    self.backgroundColor = [UIColor colorWithPatternImage:IMAGE_CONTENT(@"设置主背景.png")];
    

    
    UIImageView * lineView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 110, 560, 1)];
    lineView.image = IMAGE_CONTENT(@"横线.png");
    
    UIImageView * lineView2 = [[UIImageView alloc] initWithFrame:CGRectMake(60, 800, 560, 1)];
    lineView2.image = IMAGE_CONTENT(@"横线.png");
    
    [self addSubview:self.closeBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.collectionBtn];
    [self addSubview:lineView];
    [self addSubview:lineView2];
    [self addSubview:self.detailImg];
    [self addSubview:self.detailContentLabel];
    [self addSubview:self.applayBtn];
    
    
    [self.closeBtn addTarget:self action:@selector(action_close) forControlEvents:UIControlEventTouchUpInside];
    [self.collectionBtn addTarget:self action:@selector(action_collect) forControlEvents:UIControlEventTouchUpInside];
    [self.applayBtn addTarget:self action:@selector(action_apply) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - action
/** < 申请页面跳转 */
-(void)action_apply{
    [self addSubview:self.applyview];
    [UIView animateWithDuration:1.0 animations:^{
        self.applyview.alpha = 1.0;
    }];
    
}

/** < 收集 */
-(void)action_collect{
    
    
}
/** < 关闭 */
-(void)action_close{
    [self removeFromSuperview];
}


#pragma mark - getter

- (applyView *)applyview{
    if (!_applyview) {
        _applyview = [[applyView alloc] init];
        _applyview.alpha = 0;
    }
    return _applyview;
}
- (UIImageView *)detailImg{
    if (!_detailImg) {
        _detailImg = ({
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 150)];
            img.center = CGPointMake(340, 230);
            img;
        });
    }
    return _detailImg;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake(self.center.x - 360 / 2 + 10, 50, 360, 30);
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:25];
            label.numberOfLines = 0;
            label;
        });
    }
    return _titleLabel;
}

- (UILabel *)detailContentLabel{
    if (!_detailContentLabel) {
        _detailContentLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake(55, 330, 580, 460);
            label.numberOfLines = 0;
            label;
        });
    }
    return _detailContentLabel;
}

- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 15, 40, 35)];
            btn.center = CGPointMake(CGRectGetMaxX(self.frame) - 10, 40);
            [btn setImage:IMAGE_CONTENT(@"关闭_05.png") forState:UIControlStateNormal];
            btn;
        });
    }
    return _closeBtn;
}

- (UIButton *)collectionBtn{
    if (!_collectionBtn) {
        _collectionBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(530, 120, 80, 35)];
            [btn setImage:IMAGE_CONTENT(@"收藏(1).png") forState:UIControlStateNormal];
            btn;
        });
    }
    return _collectionBtn;
}

- (UIButton *)applayBtn{
    if (!_applayBtn) {
        _applayBtn = ({
            UIButton * label = [[UIButton alloc] init];
            label.frame = CGRectMake(510, 60, 80, 30);
            label.center = CGPointMake(self.center.x + 20, 850);
            [label setImage:IMAGE_CONTENT(@"申请.png") forState:UIControlStateNormal];
            label;
        });
    }
    return _applayBtn;
}

@end

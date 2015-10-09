//
//  applyView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "applyView.h"
#import "PersonalInfoView.h"
#import "ContactsInfoView.h"
#import "OthersInfoView.h"
#import "ProfessionInfoView.h"

@interface applyView ()
{
    NSInteger _curPageIndex;/** < 当前页面索引 */
}
@property(nonatomic,strong) PersonalInfoView * personal ;
@property(nonatomic,strong) ContactsInfoView * contacts;
@property(nonatomic,strong) OthersInfoView * others;
@property(nonatomic,strong) ProfessionInfoView * profession;
-(void)initApplyView;

@end

@implementation applyView


- (instancetype)init{
    if (self = [super init]) {
        [self initApplyView];
    }
    return self;
}

- (void)initApplyView{
    self.frame = CGRectMake(0, 0, 700, 920);
    self.backgroundColor = RGB_COLOR(205, 205, 205, 1);
    
    [self addSubview:self.otherInfo];
    [self addSubview:self.contactsInfo];
    [self addSubview:self.professionInfo];
    [self addSubview:self.personalInfo];
    /** < 开始加载时，因为时第一步设为隐藏 */
    [self addSubview:self.lastBtn];
    self.lastBtn.hidden = YES;
    [self addSubview:self.nextBtn];
    /** < 默认是第一页 */
    [self addSubview:self.personal];
    /** < 使当前页面为第一页的索引 */
    _curPageIndex = 1;
    
    [self.personalInfo addTarget:self action:@selector(action_personalInfo:) forControlEvents:UIControlEventTouchUpInside];
    [self.professionInfo addTarget:self action:@selector(action_professionInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.contactsInfo addTarget:self action:@selector(action_contactsInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.otherInfo addTarget:self action:@selector(action_otherInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.lastBtn addTarget:self action:@selector(action_last) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn addTarget:self action:@selector(action_next) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - action
/**
 *  上下页面的按钮点击事件
 *
 *  @return
 */

-(void)action_last{
    
}

-(void)action_next{
    
}

/**
 *  各个页面的点击事件
 *
 *  @return
 */
/** < 各个页面跳转之前需要判断填入内容是否完整 */
-(void)action_personalInfo:(UIButton * )sender{
    _curPageIndex = 1;
    /** < 首先隐藏上一步按钮 */
    if (self.lastBtn.superview) {
        self.lastBtn.hidden = YES;
    }

    /** < 如果存在填写页面，先移除 */
    if (self.subviews.count >= 7) {
        [self.subviews[6] removeFromSuperview];
    }
    /** < 添加新页面 */
    [self addSubview:self.personal];
}

-(void)action_professionInfo{
    _curPageIndex = 2;
    self.lastBtn.hidden = NO;
    if (self.subviews.count >= 7) {
        [self.subviews[6] removeFromSuperview];
    }
    [self addSubview:self.profession];
}

-(void)action_contactsInfo{
    _curPageIndex = 3;
    self.lastBtn.hidden = NO;
    if (self.subviews.count >= 7) {
        [self.subviews[6] removeFromSuperview];
    }
    [self addSubview:self.contacts];
}

-(void)action_otherInfo{
    _curPageIndex = 4;
    self.lastBtn.hidden = NO;
    if (self.subviews.count >= 7) {
        [self.subviews[6] removeFromSuperview];
    }
    [self addSubview:self.others];
}

#pragma mark - getter
- (PersonalInfoView *)personal{
    if (!_personal) {
        _personal = ({
            PersonalInfoView * view = [[PersonalInfoView alloc] init];
            view;
        });
    }
    return _personal;
}

- (ProfessionInfoView *)profession{
    if (!_profession) {
        _profession = ({
            ProfessionInfoView * view = [[ProfessionInfoView alloc] init];
            view;
        });
    }
    return _profession;
}

- (ContactsInfoView *)contacts{
    if (!_contacts) {
        _contacts = ({
            ContactsInfoView * view = [[ContactsInfoView alloc] init];
            view;
        });
    }
    return _contacts;
}

- (OthersInfoView *)others{
    if (!_others) {
        _others = ({
            OthersInfoView * view = [[OthersInfoView alloc] init];
            view;
        });
    }
    return _others;
}


- (UIButton *)otherInfo{
    if (!_otherInfo) {
        _otherInfo = ({
            UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(610, 420, 55, 155)];
            [img setImage:IMAGE_CONTENT(@"选中 其他资料.png") forState:UIControlStateSelected];
            [img setImage:IMAGE_CONTENT(@"未选中 其它资料.png") forState:UIControlStateNormal];
            img;
        });
    }
    return _otherInfo;
}

- (UIButton *)contactsInfo{
    if (!_contactsInfo) {
        _contactsInfo = ({
            UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(610,300, 55, 155)];
            [img setImage:IMAGE_CONTENT(@"选中 联系人资料.png") forState:UIControlStateSelected];
            [img setImage:IMAGE_CONTENT(@"未选中 联系人资料.png") forState:UIControlStateNormal];
            img;
        });
    }
    return _contactsInfo;
}
//180 60

- (UIButton *)professionInfo{
    if (!_professionInfo) {
        _professionInfo = ({
            UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(610,180, 55, 155)];
            [img setImage:IMAGE_CONTENT(@"选中 职业资料.png") forState:UIControlStateSelected];
            [img setImage:IMAGE_CONTENT(@"未选中 职业资料.png") forState:UIControlStateNormal];
            img;
        });
    }
    return _professionInfo;
}

- (UIButton *)personalInfo{
    if (!_personalInfo) {
        _personalInfo = ({
            UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(610,60, 55, 155)];
            [img setImage:IMAGE_CONTENT(@"选中 个人资料.png") forState:UIControlStateSelected];
            [img setImage:IMAGE_CONTENT(@"未选中 个人资料.png") forState:UIControlStateNormal];
            img;
        });
    }
    return _personalInfo;
}


- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = ({
            UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(400,800, 100, 40)];
            [img setImage:IMAGE_CONTENT(@"完成.png") forState:UIControlStateNormal];
            img;
        });
    }
    return _nextBtn;
}

- (UIButton *)lastBtn{
    if (!_lastBtn) {
        _lastBtn = ({
            UIButton * img = [[UIButton alloc] initWithFrame:CGRectMake(200,800, 100,40)];
            [img setImage:IMAGE_CONTENT(@"上一步.png") forState:UIControlStateNormal];
            img;
        });
    }
    return _lastBtn;
}

@end

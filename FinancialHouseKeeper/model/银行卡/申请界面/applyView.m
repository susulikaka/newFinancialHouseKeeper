//
//  applyView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "applyView.h"

@interface applyView ()

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
    
    [self.personalInfo addTarget:self action:@selector(action_personalInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.professionInfo addTarget:self action:@selector(action_professionInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contactsInfo addTarget:self action:@selector(action_contactsInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.otherInfo addTarget:self action:@selector(action_otherInfo) forControlEvents:UIControlEventTouchUpInside];
    
    
}

#pragma mark - action
-(void)action_personalInfo{
    
}

-(void)action_professionInfo{
    
}

-(void)action_contactsInfo{
    
}

-(void)action_otherInfo{
    
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

@end

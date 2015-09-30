//
//  BaseViewController.m
//  BaseViewController
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 赖星果. All rights reserved.
//
#define SCREEN_WIDTH 768.f
#define SCREEN_HEIGHT 1024.f
#define IMAGE_CONTENT(x) [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:x]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
#define COLOR_RGB(_R,_G,_B,_A)[UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A]

#import "BaseViewController.h"

@interface BaseViewController ()

- (void)initializeUserInterface;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}

#pragma mark - init
- (void)initializeUserInterface {
    self.view.frame = CGRectMake(60, 0, SCREEN_WIDTH - 60, SCREEN_HEIGHT - 20);
    self.view.backgroundColor = COLOR_RGB(205, 205, 205, 1);
    [self.view addSubview:self.bankModelImageView];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.firstButton];
    [self.view addSubview:self.secondButton];
    [self.view addSubview:self.thirdButton];
    [self.view addSubview:self.fourthButton];
}


#pragma mark - getter
- (UIImageView *)bankModelImageView {
    if (!_bankModelImageView) {
        _bankModelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 140, 35)];
    }
    return _bankModelImageView;
}

- (UIImageView *)lineView {
    if (!_lineView) {
        _lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 2)];
        _lineView.image = IMAGE_CONTENT(@"二级菜单下面的色条_05.png");
    }
    return _lineView;
}

- (UIButton *)firstButton {
    if (!_firstButton) {
        _firstButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(215, 25, 100, 35);
            button;
        });
    }
    return _firstButton;
}

- (UIButton *)secondButton {
    if (!_secondButton) {
        _secondButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(328, 25, 100, 35);
            button;
        });
    }
    return _secondButton;
}

- (UIButton *)thirdButton {
    if (!_thirdButton) {
        _thirdButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(441, 25, 100, 35);
            button;
        });
    }
    return _thirdButton;
}

- (UIButton *)fourthButton {
    if (!_fourthButton) {
        _fourthButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(554, 25, 100, 35);
            button;
        });
    }
    return _fourthButton;
}
@end

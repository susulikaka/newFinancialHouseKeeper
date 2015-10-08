//
//  hhViewController.m
//  BaseViewController
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 赖星果. All rights reserved.
//
#define SCREEN_WIDTH 768.f
#define SCREEN_HEIGHT 1024.f
#define IMAGE_CONTENT(x) [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:x]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

#import "EBankViewController.h"
#import "StartView.h"

@interface EBankViewController ()
@property (nonatomic, strong) UIImageView *InternetBankView; /**< 网上银行 */
@property (nonatomic, strong) UIImageView *helpView; /**< 体验指南 */
@end

@implementation EBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
    self.bankModelImageView.image = IMAGE_CONTENT(@"图标-我的网银.png");
    [self.view addSubview:self.InternetBankView];
    [self.view addSubview:self.helpView];
}

- (UIImageView *)InternetBankView {
    if (!_InternetBankView) {
        _InternetBankView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 615, 380)];
            imageView.image = IMAGE_CONTENT(@"我的银行1.png");
            imageView;
        });
    }
    return _InternetBankView;
}

- (UIImageView *)helpView {
    if (!_helpView) {
        _helpView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 540, 615, 380)];
            imageView.image = IMAGE_CONTENT(@"我的银行2.png");
            imageView;
        });
    }
    return _helpView;
}


@end

//
//  StartView.m
//  BaseViewController
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 赖星果. All rights reserved.
//
#define IMAGE_CONTENT(x) [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:x]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

#import "StartView.h"

@interface StartView()

@property (nonatomic, strong) UIImageView *firstImage;
@property (nonatomic, strong) UIImageView *secondImage;
@property (nonatomic, strong) UIImageView *thirdImage;
@property (nonatomic, strong) UIImageView *fourthImage;

- (void)initializeInterface;
@end

@implementation StartView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeInterface];
    }
    return self;
}

- (void)initializeInterface {
    self.backgroundColor = [UIColor colorWithPatternImage:IMAGE_CONTENT(@"背景2.png")];
    [self addSubview:self.firstImage];
    [self addSubview:self.secondImage];
    [self addSubview:self.thirdImage];
    [self addSubview:self.fourthImage];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self wordAlphaAnimation];
    });
}

#pragma mark - Animation
- (void)wordAlphaAnimation {
    [UIView animateWithDuration:2 animations:^{
        self.firstImage.alpha = 0;
        self.thirdImage.alpha = 0;
        self.fourthImage.alpha = 0;
    } completion:^(BOOL finished) {
        [self moveAnimation];
    }];
}

- (void)moveAnimation {
    [UIView animateWithDuration:1.5 animations:^{
        self.secondImage.frame = CGRectMake(80, 20, 40, 40);
    } completion:^(BOOL finished) {
        [self viewAlphaAnimation];
    }];
}

- (void)viewAlphaAnimation {
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - getter
- (UIImageView *)firstImage {
    if (!_firstImage) {
        _firstImage = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 412, 102, 32)];
            imageView.image = IMAGE_CONTENT(@"工行LOGO11.png");
            imageView;
        });
    }
    return _firstImage;
}

- (UIImageView *)secondImage {
    if (!_secondImage) {
        _secondImage = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(270, 402, 60, 60)];
            imageView.image = IMAGE_CONTENT(@"工行LOGO22.png");
            imageView;
        });
    }
    return _secondImage;
}

- (UIImageView *)thirdImage {
    if (!_thirdImage) {
        _thirdImage = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(366, 407, 268, 47)];
            imageView.image = IMAGE_CONTENT(@"工行LOGO33.png");
            imageView;
        });
    }
    return _thirdImage;
}

- (UIImageView *)fourthImage {
    if (!_fourthImage) {
        _fourthImage = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 485, 468, 42)];
            imageView.image = IMAGE_CONTENT(@"字_03_03.png");
            imageView;
        });
    }
    return _fourthImage;
}

@end

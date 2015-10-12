//
//  NearbyBranchView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/10.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "NearbyBranchView.h"

@interface NearbyBranchView ()

@property (nonatomic, strong) UIImageView *nearbyView; /**< 附近图片 */
@property (nonatomic, strong) UIButton *halfKilometer; /**< 500m */
@property (nonatomic, strong) UIButton *oneKilometer; /**< 1km */
@property (nonatomic, strong) UIButton *twoKilometer; /**< 2km */
@property (nonatomic, strong) UIButton *threeKilometer; /**< 3km */

@end

@implementation NearbyBranchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nearbyView];
        [self addSubview:self.halfKilometer];
        [self addSubview:self.oneKilometer];
        [self addSubview:self.twoKilometer];
        [self addSubview:self.threeKilometer];
    }
    return self;
}

#pragma mark - action
- (void)action_button:(UIButton *)sender {
    for (int i = 100; i < 104; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:i];
        btn.selected = NO;
    }
    sender.selected = YES;
}

#pragma mark - getter
- (UIImageView *)nearbyView {
    if (!_nearbyView) {
        _nearbyView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(195, 90, 335, 74)];
            imageView.image = IMAGE_CONTENT(@"500-3000米未选中.png");
            imageView;
        });
    }
    return _nearbyView;
}

- (UIButton *)halfKilometer {
    if (!_halfKilometer) {
        _halfKilometer = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 50, 50);
            button.center = CGPointMake(222, 140);
            button.tag = 100;
            [button setImage:IMAGE_CONTENT(@"500-1km-2km 选中.png") forState:UIControlStateSelected];
            [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _halfKilometer;
}

- (UIButton *)oneKilometer {
    if (!_oneKilometer) {
        _oneKilometer = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 50, 50);
            button.center = CGPointMake(316, 140);
            button.tag = 101;
            [button setImage:IMAGE_CONTENT(@"500-1km-2km 选中.png") forState:UIControlStateSelected];
            [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _oneKilometer;
}

- (UIButton *)twoKilometer {
    if (!_twoKilometer) {
        _twoKilometer = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 50, 50);
            button.center = CGPointMake(415, 140);
            button.tag = 102;
            [button setImage:IMAGE_CONTENT(@"500-1km-2km 选中.png") forState:UIControlStateSelected];
            [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _twoKilometer;
}

- (UIButton *)threeKilometer {
    if (!_threeKilometer) {
        _threeKilometer = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 50, 50);
            button.center = CGPointMake(508, 140);
            button.tag = 103;
            [button setImage:IMAGE_CONTENT(@"500-1km-2km 选中.png") forState:UIControlStateSelected];
            [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _threeKilometer;
}

@end

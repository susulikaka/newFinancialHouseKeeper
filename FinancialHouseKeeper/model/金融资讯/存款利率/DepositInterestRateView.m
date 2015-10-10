//
//  DepositInterestRateView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/10.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "DepositInterestRateView.h"

@interface DepositInterestRateView ()

@property (nonatomic, strong) UIImageView *InterestRateView; /**< 利率那张图 */

@end

@implementation DepositInterestRateView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.InterestRateView];
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)InterestRateView {
    if (!_InterestRateView) {
        _InterestRateView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 630, 775)];
            imageView.image = IMAGE_CONTENT(@"金属咨询_存贷款利率_表格.png");
            imageView;
        });
    }
    return _InterestRateView;
}

@end

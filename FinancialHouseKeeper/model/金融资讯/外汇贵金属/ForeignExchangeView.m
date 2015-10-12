//
//  ForeignExchangeView.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/10.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "ForeignExchangeView.h"

@interface ForeignExchangeView ()

@property (nonatomic, strong) UIImageView *foreignView; /**< 外汇金属图片 */

@end

@implementation ForeignExchangeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.foreignView];
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)foreignView {
    if (!_foreignView) {
        _foreignView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 630, 615)];
            imageView.image = IMAGE_CONTENT(@"金融资讯_外汇贵金属_表格.png");
            imageView;
        });
    }
    return _foreignView;
}

@end

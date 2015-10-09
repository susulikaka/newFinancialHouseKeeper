//
//  BankCardCell.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "BankCardCell.h"

@implementation BankCardCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.cardListImage = ({
            UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 65, 75)];
            view;
        });
        
        self.cardListName = ({
            CATextLayer * layer = [CATextLayer layer];
            layer.fontSize = 16;
            layer.position = CGPointMake(120, 50);
            layer.bounds = CGRectMake(0, 0, 80, 30);
            layer.foregroundColor = RGB_COLOR(223, 196, 118, 1).CGColor;
            layer;
        });
        
        self.cardListSummery = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake(160, 50, 350, 100);
            label.numberOfLines = 0;
            [label sizeToFit];
            label;
        });
        
        self.cardApplyBtn = ({
            UIButton * label = [[UIButton alloc] init];
            label.frame = CGRectMake(510, 60, 80, 30);
            [label setImage:IMAGE_CONTENT(@"申请.png") forState:UIControlStateNormal];
            label;
        });
        
        [self.contentView addSubview:self.cardListImage];
        [self.contentView.layer addSublayer:self.cardListName];
        [self.contentView addSubview:self.cardListSummery];
        [self.contentView addSubview:self.cardApplyBtn];
    }
    
    self.backgroundColor = MAIN_COLOR;
    
    self.selectedBackgroundView = [[UIImageView alloc] initWithImage:IMAGE_CONTENT(@"背景.png")];
    return self;
    
}

@end

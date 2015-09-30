//
//  ListTableViewCell.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.listImage = ({
            UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 65, 75)];
            view;
        });
        
        self.listLabel = ({
            CATextLayer * layer = [CATextLayer layer];
            layer.fontSize = 16;
            layer.position = CGPointMake(120, 50);
            layer.bounds = CGRectMake(0, 0, 80, 30);
            layer.foregroundColor = RGB_COLOR(223, 196, 118, 1).CGColor;
            layer;
        });
        
        [self.contentView addSubview:self.listImage];
        [self.contentView.layer addSublayer:self.listLabel];
    }
    
    self.backgroundColor = MAIN_COLOR;

    self.selectedBackgroundView = [[UIImageView alloc] initWithImage:IMAGE_CONTENT(@"背景.png")];
    return self;
    
}

@end

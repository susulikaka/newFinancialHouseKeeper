//
//  ListTableViewCell.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView * listImage;/** < 列表图片 */
@property(nonatomic,strong) CATextLayer * listLabel;/** < 列表标题 */

@end

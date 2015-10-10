//
//  BankCardCell.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardCell : UITableViewCell

@property(nonatomic,strong) UIImageView * cardListImage;/** < 列表图片 */
@property(nonatomic,strong) CATextLayer * cardListName;/** < 列表标题 */
@property(nonatomic,strong) UILabel * cardListSummery;/** < 列表描述 */
@property(nonatomic,strong) UIButton * cardApplyBtn;/** < 申请按钮 */

@end

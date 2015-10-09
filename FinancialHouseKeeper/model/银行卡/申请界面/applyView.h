//
//  applyView.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface applyView : UIView

@property(nonatomic,strong) UILabel * applyTitleLabel;/** < 申请标题 */
@property(nonatomic,strong) UIButton * personalInfo;/** < 个人资料 */
@property(nonatomic,strong) UIButton * professionInfo;/** < 职业资料 */
@property(nonatomic,strong) UIButton * contactsInfo;/** < 联系人资料 */
@property(nonatomic,strong) UIButton * otherInfo;/** < 其他资料 */

@property(nonatomic,strong) UIButton * nextBtn;/** < 下一步按钮 */
@property(nonatomic,strong) UIButton * lastBtn;/** < 完成按钮 */
@end

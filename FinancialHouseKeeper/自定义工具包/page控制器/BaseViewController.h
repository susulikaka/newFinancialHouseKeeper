//
//  BaseViewController.h
//  BaseViewController
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 赖星果. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIImageView *bankModelImageView; /**< 模块的名字 */
@property (nonatomic, strong) UIImageView *lineView; /**< 分割线 */

@property (nonatomic, strong) UIButton *firstButton;

@property (nonatomic, strong) UIButton *secondButton;

@property (nonatomic, strong) UIButton *thirdButton;

@property (nonatomic, strong) UIButton *fourthButton;


@end

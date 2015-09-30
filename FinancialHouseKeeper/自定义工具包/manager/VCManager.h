//
//  MainViewController.h
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LockerViewController.h"
#import "ViewController.h"

@interface VCManager : NSObject

@property(nonatomic,strong) UINavigationController * root_vc;
@property(nonatomic,strong,readonly) LockerViewController * locker_vc;/** < 抽屉视图 */
@property(nonatomic,strong,readonly) BaseViewController * page_vc;/** < 旁边视图 */


+(instancetype)sharedManager;

@end

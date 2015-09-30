//
//  MainViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "VCManager.h"

@interface VCManager ()

@property(nonatomic,strong) LockerViewController * main_vc;/** < 抽屉视图 */
@property(nonatomic,strong) BaseViewController * page_vc;

@end

@implementation VCManager

+(instancetype)sharedManager{
    static VCManager * manager;
    
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[VCManager alloc] init];
        });
    }
    return manager;
}


#pragma mark - getter

- (UINavigationController *)root_vc{
    if (!_root_vc) {
        _root_vc = ({
            UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:self.main_vc];
            nvc.navigationBarHidden = YES;
            nvc;
        });
    }
    return _root_vc;
}

//- (ViewController *)page_vc{
//    if (!_page_vc) {
//        _page_vc = ({
//            ViewController * vc = [[ViewController alloc] init];
//            vc;
//        });
//    }
//    return _page_vc;
//}

- (LockerViewController *)main_vc{
    if (!_main_vc) {
        _main_vc = ({
            LockerViewController * vc = [[LockerViewController alloc] init];
            self.page_vc = vc.page_vc;
            vc;
        });
    }
    return _main_vc;
}

@end

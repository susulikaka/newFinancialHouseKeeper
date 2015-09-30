//
//  BusConsultionViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "BusConsultionViewController.h"

@interface BusConsultionViewController ()


-(void)initBusConsultionInterface;
@end

@implementation BusConsultionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBusConsultionInterface];
}


- (void)initBusConsultionInterface{
    self.view.backgroundColor = [UIColor yellowColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

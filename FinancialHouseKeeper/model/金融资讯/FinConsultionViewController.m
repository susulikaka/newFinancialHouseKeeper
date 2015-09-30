//
//  FinConsultionViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "FinConsultionViewController.h"

@interface FinConsultionViewController ()


-(void)initFinConsultInterface;
@end

@implementation FinConsultionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFinConsultInterface];
}


- (void)initFinConsultInterface{
    self.view.backgroundColor = [UIColor blueColor];
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

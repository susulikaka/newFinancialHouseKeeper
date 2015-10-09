//
//  BankCardViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardList.h"
#import "BankCardCell.h"

static NSString * const KCardListKey = @"KCardListKey";
static NSString * const CardHEADKEY = @"CardHEADKEY";
@interface BankCardViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BankCardList * _bankCardList;/** < 银行卡列表 */
    __block NSDictionary * _dataSource;
}
@property(nonatomic,strong)UIButton * collectionBtn;/** < 我的收藏按钮 */
@property(nonatomic,strong) UISearchBar * searchBar;/** < 搜索框 */
@property(nonatomic,strong) UITableView * carListTableView;/** < 银行卡列表 */

-(void)initBankCarDatasource;
-(void)initBankCardInterface;
@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBankCarDatasource];
    [self initBankCardInterface];
    
}

#pragma mark - init

- (void)initBankCarDatasource{
    _bankCardList = [[BankCardList alloc] init];
    _dataSource = [NSDictionary dictionary];
    [_bankCardList getCardDic:^(NSDictionary *list) {
        _dataSource = [list copy];
        [self initBankCardInterface];
    }];
}

- (void)initBankCardInterface{
    self.bankModelImageView.image = IMAGE_CONTENT(@"银行卡-logo.png");
    [self.firstButton setImage:IMAGE_CONTENT(@"银行卡_选中.png") forState:UIControlStateSelected];
    [self.firstButton setImage:IMAGE_CONTENT(@"银行卡_.png") forState:UIControlStateNormal];
    
    [self.view addSubview:self.carListTableView];
    
}

#pragma mark - private method



#pragma mark - <UITableViewDataSource,UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BankCardCell * cell  = [tableView dequeueReusableCellWithIdentifier:KCardListKey];
    if (!cell) {
        cell = [[BankCardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KCardListKey];
    }
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CardHEADKEY];
    
    [view addSubview:self.searchBar];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark - getter

- (UIButton *)collectionBtn{
    if (!_collectionBtn) {
        _collectionBtn = ({
            UIButton * label = [[UIButton alloc] init];
            label.frame = CGRectMake(510, 60, 80, 30);
            [label setImage:IMAGE_CONTENT(@"申请.png") forState:UIControlStateNormal];
            label;
        });
    }
    return _collectionBtn;
}

- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = ({
            UISearchBar * bar = [[UISearchBar alloc] initWithFrame:CGRectMake(350, 100, 300, 30)];
            bar.barStyle = UIBarStyleDefault;
            bar.placeholder = @"请输入名称或者编号搜索";
            [bar setSearchFieldBackgroundImage:IMAGE_CONTENT(@"搜索框.png") forState:UIControlStateNormal];
            [bar setSearchFieldBackgroundPositionAdjustment:UIOffsetMake(0, 0)];
            
            bar.showsScopeBar = YES;
            bar.tintColor = self.view.backgroundColor;
            bar;
        });
    }
    return _searchBar;
}

- (UITableView *)carListTableView{
    if (!_carListTableView) {
        _carListTableView = ({
            UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024) style:UITableViewStylePlain];
            [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.backgroundColor = [UIColor whiteColor];
            tableView;
        });
    }
    return _carListTableView;
}
@end

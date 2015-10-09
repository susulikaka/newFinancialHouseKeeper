//
//  BankCardViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/10/9.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardCell.h"
#import "BankCardList.h"

static NSString * const KCELLID = @"KCELLID";
static NSString * const KHEADID = @"KHEADID";

@interface BankCardViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    __block NSDictionary * _dataSource;
    BankCardList * _request;
}

@property(nonatomic,strong) UITableView * cardTableView;/** < 银行卡 */
@property(nonatomic,strong) UIButton * collectionBtn;/** < 收藏按钮 */
@property(nonatomic,strong) UISearchBar * searchBar;/** < 搜索 */

-(void)initBankCardInterface;
-(void)initBankCardDataSource;
@end
@implementation BankCardViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initBankCardDataSource];
}

#pragma mark - init
- (void)initBankCardDataSource{
    _dataSource = [NSDictionary dictionary];
    _request = [[BankCardList alloc] init];
    [_request getCardDic:^(NSDictionary *list) {
        _dataSource = [list copy];
        [self initBankCardInterface];
    }];
}

- (void)initBankCardInterface{
    [self.firstButton setImage:IMAGE_CONTENT(@"银行卡_.png") forState:UIControlStateNormal];
    [self.firstButton setImage:IMAGE_CONTENT(@"银行卡_选中.png") forState:UIControlStateSelected];
    self.firstButton.selected = YES;
    self.bankModelImageView.image = IMAGE_CONTENT(@"银行卡-logo.png");
    [self.view addSubview:self.cardTableView];
}


#pragma mark - <UITableViewDataSource,UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)_dataSource[@"productName"]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:KHEADID];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:KHEADID];
    }
    
    [view addSubview:self.collectionBtn];
    [view addSubview:self.searchBar];
    view.contentView.backgroundColor = self.view.backgroundColor;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BankCardCell * cell  = [tableView dequeueReusableCellWithIdentifier:KHEADID];
    if (!cell) {
        cell = [[BankCardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KCELLID];
    }
    cell.cardListName.string = _dataSource[@"productName"][indexPath.row];
    cell.cardListSummery.text = _dataSource[@"summary"][indexPath.row];
    [cell.cardListImage sd_setImageWithURL:[NSURL URLWithString:_dataSource[@"img"][indexPath.row]] placeholderImage:IMAGE_CONTENT(@"默认图.png")];
    return cell;
}

#pragma mark - getter

- (UIButton *)collectionBtn{
    if (!_collectionBtn) {
        _collectionBtn = ({
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 15, 100, 35)];
            [btn setImage:IMAGE_CONTENT(@"我的收藏.png") forState:UIControlStateNormal];
            btn;
        });
    }
    return _collectionBtn;
}

- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = ({
            UISearchBar * bar =  [[UISearchBar alloc] initWithFrame:CGRectMake(290, 15, 300, 30)];
            [bar setSearchFieldBackgroundImage:IMAGE_CONTENT(@"搜索框.png") forState:UIControlStateNormal];
            bar.placeholder = @"请输入名称或者编号";
            bar;
        });
    }
    return _searchBar;
}

- (UITableView *)cardTableView{
    if (!_cardTableView) {
        _cardTableView = ({
            UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(40, 83, 600, 880) style:UITableViewStylePlain];
            [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
            tableView.tableFooterView = [UIView new];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.backgroundColor = [UIColor whiteColor];
            tableView;

        });
    }
    return _cardTableView;
}
@end

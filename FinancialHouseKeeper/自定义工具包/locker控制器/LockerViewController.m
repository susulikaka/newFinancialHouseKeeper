//
//  LockerViewController.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/28.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "LockerViewController.h"
#import "ListTableViewCell.h"
#import "FunctionList.h"
#import "HomePageViewController.h"

static CGFloat closeWidth = 60;
static CGFloat openWidth = 225;
static CGFloat PAGE_FRAME = SCREEN_HEIGHT - 30;

static NSString * KListTableViewCellId = @"KListTableViewCellId";
static NSString * KListTableHeadId = @"KListTableHeadId";
static NSString * KListTableFootId = @"KListTableFootId";

@interface LockerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    __block NSArray * _funArr;
}
@property(nonatomic,strong)UITableView              * listTableView;/** < 表格视图 */
@property(nonatomic,strong) HomePageViewController  * home_vc;/** < 首页视图控制器 */
@property(nonatomic,strong) UIPanGestureRecognizer  * gesture;/** < 拖拽手势 */
@property(nonatomic,strong) FunctionList            * funList;/** < 功能模块网络请求数据 */
@property(nonatomic,strong) BaseViewController      * cur_vc;/** < 当前的视图控制器 */
@property(nonatomic,assign) NSInteger                 curRow;/** < 当前点击的行数 */
@property(nonatomic,strong) NSArray                 * allVCArr;/** < 所有的视图控制器名字 */
@property(nonatomic,strong) NSArray                 * beAllVCArr;/** < 登录前的视图控制器名字 */
@property(nonatomic,strong) UITapGestureRecognizer * tapGesture;/** < 点击手势 */

/** < 尾部视图 */
@property(nonatomic,strong) UIButton                * configBtn;/** < 设置按钮 */
@property(nonatomic,strong) UIButton                * loginBtn;/** < 登录按钮 */
@property(nonatomic,strong) UIButton                * verBtn;/** < 版本按钮 */


-(void)initLockerDatasource;
-(void)initLockerInterface;

@end

@implementation LockerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLockerDatasource];
    [self initLockerInterface];
}

#pragma mark - init

- (void)initLockerDatasource{
    self.allVCArr = @[@"HomePageViewController",@"FinConsultionViewController",@"MonServiceViewController",@"BankCardViewController",@"PayServiceViewController",@"DelProducyViewController",@"EBankViewController",@"ActiComunicationViewController",@"ScheAlertViewController",@"BusConsultionViewController"];
    self.beAllVCArr = @[@"HomePageViewController",@"FinConsultionViewController",@"MonServiceViewController",@"BankCardViewController",@"DelProducyViewController",@"EBankViewController"];
    
    self.funList = [[FunctionList alloc] init];
    self.cur_vc = self.home_vc;/** < 默认当前页面为首页 */
    self.curRow = 0;/** < 默认当前点击为第0行 */
    
    _funArr = [NSArray array];
    /** < 请求模块标题数据 */
    if (![UserModel isLogin]) {
        
        [self.funList getBeLogFunList:^(NSArray *list) {
            _funArr = [list copy];
            [self.listTableView reloadData];
        }];
        
    }else{
        [self.funList getAfLogFunList:^(NSArray *list) {
            _funArr = [list copy];
            [self.listTableView reloadData];
        }];

    }
}

//初始化视图
- (void)initLockerInterface{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.listTableView];
    
    
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.verBtn];
    if ([UserModel isLogin]) {
        [self.view addSubview:self.configBtn];
    }
    
    [self addChildViewController:self.home_vc];
    self.home_vc.view.frame = CGRectMake(80, 0, SCREEN_WIDTH, PAGE_FRAME);

    [self.cur_vc.view addGestureRecognizer:self.tapGesture];
    [self.view addGestureRecognizer:self.gesture];
}

#pragma mark - action

-(void)action_tap : (UITapGestureRecognizer *)gesture{
    [self close];
}

/** < 滑动手势 */

-(void)action_pan:(UIPanGestureRecognizer *)gesture{
    
    CGPoint velocity = [gesture velocityInView:self.view];/** < 向量的坐标表达式 滑动的方向 速度*/
    
    /** < 侧边的滑动 */
    CGPoint translate = [gesture translationInView:self.view];/** < 位移 当前手指到最开始的位移*/
    CGFloat percent = translate.x / (openWidth - closeWidth);

    /** < 任意时刻leftVC 的位移 */
    CGFloat leftTranslate = [self interpolateFrom:closeWidth to:openWidth percent:percent];
    /** < pageVC的滑动 */

    /** < 开始 */
    if (gesture.state == UIGestureRecognizerStateBegan) {
        /** < 途中 */
    }else if (gesture.state == UIGestureRecognizerStateChanged){

        if (leftTranslate <= openWidth && leftTranslate >= closeWidth) {
            if (velocity.x > 0) {
                self.cur_vc.view.frame = CGRectMake(leftTranslate, 0, SCREEN_WIDTH - closeWidth, PAGE_FRAME);
            }else{
                self.cur_vc.view.frame = CGRectMake(leftTranslate, 0, SCREEN_WIDTH - closeWidth, PAGE_FRAME);
            }
        }else{
            if(velocity.x < 0){
                
//                [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:9 initialSpringVelocity:2 options:0 animations:^{
                     self.cur_vc.view.frame = CGRectMake(closeWidth, 0, SCREEN_WIDTH - closeWidth, PAGE_FRAME);
//                } completion:^(BOOL finished) {
//                    
//                }];
               
            }else if(velocity.x > 0){
                
//                [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:9 initialSpringVelocity:2 options:0 animations:^{
                    self.cur_vc.view.frame = CGRectMake(openWidth, 0, SCREEN_WIDTH - openWidth, PAGE_FRAME);
//                } completion:^(BOOL finished) {
                    
//                }];
                
            }
        }
        /** < 结束 */
//        NSLog(@"page_vc:%lf,closeWidth:%lf,leftTranslate : %lf",self.page_vc.view.frame.origin.x,closeWidth,leftTranslate);
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        
        CGPoint velocity = [gesture velocityInView:self.view];
        
        if (velocity.x > 0) {
            [self open];/** < 直接过去 */
        }else if (velocity.x < 0){
            [self close];
        }
    }
}

#pragma mark - provate method

- (CGRect)framFromVC:(UIViewController *)vc
{
    return vc.view.frame;
}


- (CGFloat)interpolateFrom:(CGFloat)from to:(CGFloat)to percent:(CGFloat)percent
{
    return from + (to - from) * percent;
}

//打开左边的视图
-(void)open{
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:9 initialSpringVelocity:2 options:0 animations:^{
        self.cur_vc.view.frame = CGRectMake(openWidth, 0, SCREEN_WIDTH, PAGE_FRAME);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)close{
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:9 initialSpringVelocity:2 options:0 animations:^{
        self.cur_vc.view.frame = CGRectMake(closeWidth, 0, SCREEN_WIDTH, PAGE_FRAME);
    } completion:^(BOOL finished) {
        
    }];
}

/** < 添加子视图 */
- (void)addChildViewController:(UIViewController *)childController{
    [self.view addSubview:childController.view];
    [super addChildViewController:childController];
    [childController didMoveToParentViewController:childController];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _funArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:KListTableHeadId];
    
    //添加头像和文字
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 65, 65)];
    
    CATextLayer * layer = [CATextLayer layer];
    layer.bounds = CGRectMake(0, 0, 60, 30);
    layer.position = CGPointMake(120, 35);
    layer.fontSize = 18;
    layer.foregroundColor = RGB_COLOR(223, 196, 118, 1).CGColor;
    if (!head) {

        head = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:KListTableHeadId];
        image.image = IMAGE_CONTENT(@"底1_04.png");
        
        layer.string = @"hahhahah";
        
        
        [head addSubview:image]; //(若将此注释：view未添加)
        [head.layer addSublayer:layer];
        
    }
    head.contentView.backgroundColor = MAIN_COLOR;
    return head;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:KListTableViewCellId];
    if (!cell) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:KListTableViewCellId];
    }
    NSString * imgName = [NSString stringWithFormat:@"%@-1.png",_funArr[indexPath.row]];
    cell.listImage.image = IMAGE_CONTENT(imgName);
    cell.listLabel.string = _funArr[indexPath.row];
    
    return cell;
}
//切换视图控制器
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.curRow == indexPath.row) {
        return;
    }
    
    NSInteger cur_Frame_x = self.cur_vc.view.frame.origin.x;
    /** < 移除最后面的view */
    [self.cur_vc.view removeFromSuperview];
    [self.cur_vc removeFromParentViewController];
    [self.cur_vc willMoveToParentViewController:nil];
    
    /** < 得到视图控制器 */
    Class class = NSClassFromString(self.allVCArr[indexPath.row]);
    BaseViewController * next_vc = [[class alloc] init];
    [self addChildViewController:next_vc];
    next_vc.view.frame = CGRectMake(cur_Frame_x, 0, SCREEN_WIDTH, PAGE_FRAME);
    /** < 将当前的controller赋值给cur_vc */
    self.cur_vc = next_vc;
    self.curRow = indexPath.row;
    
}

#pragma mark - getter

- (UITapGestureRecognizer *)tapGesture{
    if (!_tapGesture) {
        _tapGesture = ({
            UITapGestureRecognizer * gesture=  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action_tap:)];
            gesture;
        });
    }
    return _tapGesture;
}

- (UIPanGestureRecognizer *)gesture{
    if (!_gesture) {
        _gesture = ({
            UIPanGestureRecognizer * gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(action_pan:)];
            gesture;
        });
    }
    return _gesture;
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = ({
            UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024) style:UITableViewStylePlain];
            [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.backgroundColor = MAIN_COLOR;
            tableView;
        });
    }
    return _listTableView;
}

- (HomePageViewController *)home_vc{
    if (!_home_vc) {
        _home_vc = ({
            HomePageViewController * vc = [[HomePageViewController alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            vc;
        });
    }
    return _home_vc;
}

- (UIButton *)configBtn{
    if (!_configBtn) {
        _configBtn = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.bounds = CGRectMake(0, 0, 140, 70);
            btn.center = CGPointMake(70, 840);
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 70);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 10);
            [btn setTitle:@"设置" forState:UIControlStateNormal];
            [btn setTitleColor:RGB_COLOR(223, 196, 118, 1) forState:UIControlStateNormal];

            [btn setImage: IMAGE_CONTENT(@"设置-1.png") forState:UIControlStateNormal];
            btn;
        });
    }
    return _configBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.bounds = CGRectMake(0, 0, 140, 70);
            btn.center = CGPointMake(70, 900);
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 70);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 10);
            [btn setTitle:@"登录" forState:UIControlStateNormal];
            [btn setTitleColor:RGB_COLOR(223, 196, 118, 1) forState:UIControlStateNormal];
            [btn setImage: IMAGE_CONTENT(@"登录-1.png") forState:UIControlStateNormal];

            btn;
        });
    }
    return _loginBtn;
}

- (UIButton *)verBtn{
    if (!_verBtn) {
        _verBtn = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.bounds = CGRectMake(0, 0, 140, 70);
            btn.center = CGPointMake(70, 960);
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 70);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 10);
            [btn setTitle:@"版本" forState:UIControlStateNormal];
            [btn setTitleColor:RGB_COLOR(223, 196, 118, 1) forState:UIControlStateNormal];

            [btn setImage: IMAGE_CONTENT(@"滑动-1.png") forState:UIControlStateNormal];
            btn;
        });
    }
    return _verBtn;
}

@end

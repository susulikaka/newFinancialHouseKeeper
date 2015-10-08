//
//  HomeViewController.m
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

#import "HomePageViewController.h"
#import "NetworkingManager.h"
#import "NetworkingManager+HomeRequest.h"
#import "XmlParse.h"
#import "UIImageView+WebCache.h"


@interface HomePageViewController (){
    NSArray *_dataSource;
}

@property (nonatomic, strong) UIImageView *briefIntroduction;
@property (nonatomic, strong) UIImageView *VIP_left;
@property (nonatomic, strong) UIImageView *VIP_right;
@property (nonatomic, strong) UIImageView *bankEvent;
@property (nonatomic, strong) UITapGestureRecognizer *briefIntroductionTapGesture;
@property (nonatomic, strong) UITapGestureRecognizer *VIP_leftTapGesture;
@property (nonatomic, strong) UITapGestureRecognizer *VIP_rightTapGesture;
@property (nonatomic, strong) UITapGestureRecognizer *bankEventTapGesture;



- (void)initializeDataSoure;
//修改网络图片的url地址
- (NSString *)modificationImageUrlAddressWithUrl:(NSString *)url;
//异步加载图片;
- (void)loadImageWithDataSource:(NSArray *)dataSource;
@end

@implementation HomePageViewController

#pragma mark - init
-(void)initializeDataSoure {
    [NetworkingManager getHomeImageInfoWithSuccessHandler:^(id responseObject) {
        NSArray *nodeNames = @[@"url", @"index",@"isOpen", @"detailUrl", @"content"];
        
        NSString *xmlString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        _dataSource = [XmlParse parseWithXmlString:xmlString nodePath:@"////com.chinaxyl.show.pojo.MediaPojo" nodeNames:nodeNames];
        [self loadImageWithDataSource:_dataSource];
    } failuer:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

-(void)initializeUserInterface {
    
    self.bankModelImageView.image = IMAGE_CONTENT(@"首页页眉.png");
    [self.view addSubview:self.briefIntroduction];
    [self.view addSubview:self.VIP_left];
    [self.view addSubview:self.VIP_right];
    [self.view addSubview:self.bankEvent];
}
#pragma mark - life cycle
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initializeDataSoure];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSoure];
}
#pragma mark - respondToGesture
- (void)respondToBriefIntroductionTapGesture:(UITapGestureRecognizer *)gesture {
    
}
- (void)respondToVIP_leftTapGesture:(UITapGestureRecognizer *)gesture {
    
}
- (void)respondToVIP_rightTapGesture:(UITapGestureRecognizer *)gesture {
    
}
- (void)respondToBankEventTapGesture:(UITapGestureRecognizer *)gesture {
    
}


#pragma mark - private methods
- (NSString *)modificationImageUrlAddressWithUrl:(NSString *)url {
    if (!url) {
        return nil;
    }
    NSString *newUrl = [url stringByReplacingOccurrencesOfString:@"http://127.0.0.1:8081/icbcfile/a/" withString:@"http://125.70.10.34:1234/icbc/"];
    return newUrl;
}

- (void)loadImageWithDataSource:(NSArray *)dataSource {
    [dataSource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary *dic = (NSDictionary *)obj;
            NSString *url = [self modificationImageUrlAddressWithUrl:dic[@"url"]];
        switch (idx) {
            case 0:{
                [self.briefIntroduction setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
            }
                break;
            case 1:{
                [self.VIP_left setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
            }
                break;
            case 2:{
                [self.VIP_right setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
            }
                break;
            case 3:{
                [self.bankEvent setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
            }
                break;
            default:
                break;
        }
    }];
}
#pragma mark - getter 
-(UIImageView *)briefIntroduction {
    if (!_briefIntroduction) {
        _briefIntroduction = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.bounds = CGRectMake(0, 0, 608, 188);
            imageView.center = CGPointMake(335, 230);
            imageView.transform = CGAffineTransformMakeRotation(-M_PI/36);
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:self.briefIntroductionTapGesture];
            imageView;
        });
    }
    return _briefIntroduction;
}

-(UIImageView *)VIP_left {
    if (!_VIP_left) {
        _VIP_left = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.bounds = CGRectMake(0, 0, 325, 325);
            imageView.center = CGPointMake(200, 433);;
            imageView.transform = CGAffineTransformMakeRotation(-M_PI/38);
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:self.VIP_leftTapGesture];
            imageView;
        });
    }
    return _VIP_left;
}

-(UIImageView *)VIP_right {
    if (!_VIP_right) {
        _VIP_right = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.bounds = CGRectMake(0, 0, 315, 315);
            imageView.center = CGPointMake(520, 455);
            imageView.transform = CGAffineTransformMakeRotation(M_PI/18);
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:self.VIP_rightTapGesture];
            imageView;
        });
    }
    return _VIP_right;
}
-(UIImageView *)bankEvent {
    if (!_bankEvent) {
        _bankEvent = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.bounds = CGRectMake(0, 0, 640, 336);
            imageView.center = CGPointMake(344, 760);
            imageView.transform = CGAffineTransformMakeRotation(M_PI/39);
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:self.bankEventTapGesture];
            imageView;
        });
    }
    return _bankEvent;
}
-(UITapGestureRecognizer *)briefIntroductionTapGesture {
    if (!_briefIntroductionTapGesture) {
        _briefIntroductionTapGesture = ({
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToBriefIntroductionTapGesture:)];
            gesture;
        });
    }
    return _briefIntroductionTapGesture;
}
-(UITapGestureRecognizer *)VIP_leftTapGesture {
    if (!_VIP_leftTapGesture) {
        _VIP_leftTapGesture = ({
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToVIP_leftTapGesture:)];
            gesture;
        });
    }
    return _VIP_leftTapGesture;
}

-(UITapGestureRecognizer *)VIP_rightTapGesture {
    if (!_VIP_rightTapGesture) {
        _VIP_rightTapGesture = ({
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToVIP_rightTapGesture:)];
            gesture;
        });
    }
    return _VIP_rightTapGesture;
}
-(UITapGestureRecognizer *)bankEventTapGesture {
    if (!_bankEventTapGesture) {
        _bankEventTapGesture = ({
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToBankEventTapGesture:)];
            gesture;

        });
    }
    return _bankEventTapGesture;
}


@end

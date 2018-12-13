//
//  HomeController.m
//  Ypc
//
//  Created by zhangshu on 2018/12/12.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "HomeController.h"
#import "RecommendController.h"
#import "HomeChildController.h"


#import "KKClassificationView.h"
#import "HoneNavView.h"

#import "HomeServiceApi.h"

@interface HomeController ()
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *sortArr;
@property(strong, nonatomic) KKClassiflcationLayout *layout;
@property(strong, nonatomic) KKClassificationView *managerView;
@property(strong, nonatomic) NSMutableArray *viewControllers;
@property(strong, nonatomic)HoneNavView*navView;
@end

@implementation HomeController
-(HoneNavView *)navView{
    if (!_navView) {
        _navView = [[HoneNavView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [self navHeightWithHeight])];
        _navView.backgroundColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    }
    return _navView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = [[NSMutableArray alloc]init];
    self.sortArr = [[NSMutableArray alloc]init];
    [self.view addSubview:self.navView];
    [self requestSortData];
}
-(void)requestSortData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = @"1057591604124184579";
    req.version = @"2.0.0";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getSortListWithParam:req response:^(id response) {
        if (response) {
            [weakself.titleArr removeAllObjects];
            [weakself.titleArr addObject:@"推荐"];
            for (StairCategoryRes*model in response) {
                if (model.productCategoryName.length>0) {
                    [weakself.titleArr addObject:model.productCategoryName];
                }
            }
            
            [weakself.sortArr addObjectsFromArray:response];
            [weakself setViewcontroller];
        }
    }];
}
-(void)setLayout{
    if (!_layout) {
        _layout = [[KKClassiflcationLayout alloc] init];
    }
    _layout.isAverage = NO;
    _layout.titleViewBgColor = DEFAULTColor;
    _layout.lrMargin = 20;
    //控制滑块高度
    _layout.sliderHeight = 40;
    _layout.titleMargin = 25;
    _layout.titleSelectColor = [UIColor whiteColor];
    _layout.titleColor = [UIColor whiteColor];
    _layout.titleFont = [UIFont systemFontOfSize:15];
    _layout.titleSelectFont = [UIFont boldSystemFontOfSize:16];
    _layout.titles = self.titleArr;
    _layout.viewControllers = self.viewControllers;
    _layout.LinkColor = [UIColor whiteColor];
    _layout.linkHeight = 0.5;
    _layout.bottomLineHeight = 2;
    _layout.bottomLineWidth = 30;
    _layout.bottomLineColor = [UIColor whiteColor];
    if (!_managerView) {
        _managerView = [[KKClassificationView alloc]initWithFrame:CGRectMake(0,[self navHeightWithHeight], SCREENWIDTH, SCREENHEIGHT-[self navHeightWithHeight]) viewController:self layout:self.layout clickBlock:^(NSInteger index) {
            
        }];
        [self.view addSubview:self.managerView];
    }
}
-(void)setViewcontroller{
    _viewControllers = [[NSMutableArray alloc]init];
    RecommendController *vc = [[RecommendController alloc]init];
    [_viewControllers addObject:vc];
    for (NSInteger i = 0 ; i < self.titleArr.count-1; i ++) {
        HomeChildController *vc = [[HomeChildController alloc]init];
        [_viewControllers addObject:vc];
    }
    [self setLayout];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}








@end

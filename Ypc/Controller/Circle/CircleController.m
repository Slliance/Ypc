//
//  CircleController.m
//  Ypc
//
//  Created by zhangshu on 2018/12/12.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "CircleController.h"
#import "CircleNavView.h"
#import "CircleServiseApi.h"
#import "CircleListCell.h"
#import "LMHWaterFallLayout.h"
#import "DNTabContainView.h"
#import "ChildCircleController.h"

@interface CircleController ()<ZSSortSelectorViewDelegate>
@property(nonatomic,strong)CircleNavView *navView;
@property(nonatomic,strong)NSMutableArray *sortArr;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *controllersArr;
@property (nonatomic, strong) DNTabContainView *tabContent;
@property(nonatomic,assign)NSInteger index;

@end

@implementation CircleController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self requestSortList];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(CircleNavView *)navView{
    if (!_navView) {
        _navView = [[CircleNavView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, NavitionbarHeight)];
        _navView.selectorView.delegate = self;
    }
    return _navView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.sortArr  = [[NSMutableArray alloc]init];
    self.dataArr = [[NSMutableArray alloc]init];
    self.controllersArr = [[NSMutableArray alloc]init];
     [self setupView];
     [self.view addSubview:self.navView];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
}
- (void)setupView {
    WEAKSELF;
    _tabContent = [DNTabContainView new];
    [self.tabContent setSwitchBlock:^(NSInteger index) {
        [weakSelf.navView.selectorView setCurrentPage:index];
    }];
    [self.view addSubview:self.tabContent];
    
    [self.tabContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)setControllers {
    [self.controllersArr removeAllObjects];
    
    for (CircleCategaryRes*res in self.sortArr) {
        if (res.topicCategoryName) {
            ChildCircleController*vc = [[ChildCircleController alloc]init];
            [self.controllersArr addObject:vc];
        }
    }
    [self.tabContent configControllers:self.controllersArr parentController:self index:0];
}

-(void)requestSortList{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = [UserCacheBean share].userInfo.storeId;
    WEAKSELF;
    [[CircleServiseApi share]getCircleSortWithParam:req response:^(id response) {
        if (response) {
            [weakSelf.sortArr removeAllObjects];
            [weakSelf.sortArr addObjectsFromArray:response];
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (CircleCategaryRes*res in weakSelf.sortArr) {
                if (res.topicCategoryName) {
                    [arr addObject:res.topicCategoryName];
                }
            }
            [weakSelf.navView.selectorView setDataArr:arr];
            [weakSelf.navView.selectorView setCurrentPage:0];
            CircleCategaryRes *model = [weakSelf.sortArr firstObject];
            [weakSelf requestData:model.topicCategoryId];
           
            [self setControllers];
        }
    }];
}
-(void)requestData:(NSString*)categaryId{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.topicCategoryId = categaryId;
    req.pageIndex = 1;
    req.pageSize = @"8";
    WEAKSELF;
    [[CircleServiseApi share]getCircleListWithParam:req response:^(id response) {
        if (response) {
            
            [weakSelf.dataArr removeAllObjects];
            [weakSelf.dataArr addObjectsFromArray:response];
            [weakSelf.tabContent setTabIndex:self.index];
            [weakSelf.controllersArr enumerateObjectsUsingBlock:^(ChildCircleController*vc, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx ==weakSelf.index) {
                    if (vc.dataArr==0) {
                         [vc setDataArr:response];
                    }
                   
                }
            }];
            
        }
    }];
}
-(void)chooseButtonType:(NSInteger)type{
     self.index = type;
    CircleCategaryRes *model = self.sortArr[type];
    [self requestData:model.topicCategoryId];
   
}



@end

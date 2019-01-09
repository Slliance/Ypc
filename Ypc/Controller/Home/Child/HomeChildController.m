//
//  HomeChildController.m
//  Ypc
//
//  Created by zhangshu on 2018/12/13.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "HomeChildController.h"
#import "HomeHeadView.h"
#import "ZXBannerView.h"
#import "ZXBannerData.h"
#import "HomeServiceApi.h"
@interface HomeChildController ()
@property(strong, nonatomic)HomeHeadView*headView;
@property(strong, nonatomic)NSMutableArray*dataArr;

@end

@implementation HomeChildController
-(HomeHeadView *)headView{
    if (!_headView) {
        _headView = [[HomeHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 115+200*(SCREENWIDTH-30)/345)];
    }
    return _headView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[NSMutableArray alloc]init];
    [self.view addSubview:self.headView];
   
}
-(void)requestBannerData{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = @"1057591604124184579";
    req.version = @"2.0.0";
    req.subjectName = @"";
    req.subjectPosition = @"index_banner";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getBannerListWithParam:req response:^(id response) {
        if (response) {
            [weakself.dataArr removeAllObjects];
            [weakself.dataArr addObjectsFromArray:response];
            [weakself.headView.bannerView setImagesWithBannerDatas:weakself.dataArr
                                                  withRollInterval:1
                                               withAnimateInterval:1000
                                        withPageIndicatorTintColor:[UIColor grayColor]
                                 withCurrentPageIndicatorTintColor:[UIColor whiteColor]
                                                    withTouchBlock:^(id _Nullable data) {
//                                                        ZXBannerData* bannerData = (ZXBannerData*)data;
                                                        
            }];
        }
    }];
}

-(void)setIndex:(NSInteger)index{
    _index = index;
    [self requestBannerData];
}

@end

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
#import "HoneNavView.h"
#import "HomeHeadView.h"
#import "ZXBannerView.h"
#import "ZXBannerData.h"
#import "ZSSortSelectorView.h"
#import "HomeHotCell.h"
#import "HomeProjectSelectView.h"
#import "HomeActivityView.h"
#import "HomeLoveTryView.h"
#import "HomeLoveTrysCell.h"
#import "HomeProductCell.h"
#import "HomeServiceApi.h"
#import "GourmetController.h"

@interface HomeController ()<ZSSortSelectorViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *sortArr;
@property(nonatomic,assign)NSInteger index;
@property(strong, nonatomic)HoneNavView*navView;

@property(strong, nonatomic)NSMutableArray*dataArr;
@property(strong, nonatomic)NSMutableArray*projectArr;
@property(strong, nonatomic)NSMutableArray*hotArr;
@property(strong, nonatomic)NSMutableArray*entranceArr;
@property(strong, nonatomic)ZXBannerData*tryResult;
@property(strong, nonatomic)NSMutableArray*subjectArr;
@property(nonatomic,strong)ZSSortSelectorView *selectorView;
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation HomeController
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(165, 165);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40+NavitionbarHeight, SCREENWIDTH, SCREENHEIGHT-NavitionbarHeight-40) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[HomeHotCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeHotCell class])];
        [_collectionView registerClass:[HomeLoveTrysCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeLoveTrysCell class])];
        [_collectionView registerClass:[HomeProductCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeProductCell class])];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    }
    return _collectionView;
}
-(ZSSortSelectorView *)selectorView{
    if (!_selectorView) {
        _selectorView = [[ZSSortSelectorView alloc]initWithFrame:CGRectMake(0,  [self navHeightWithHeight], SCREENWIDTH, 40)];
        _selectorView.backgroundColor = DEFAULTColor;
        _selectorView.delegate = self;
        _selectorView.rightBtn.hidden = YES;
        [_selectorView setIsShow:YES];
    }
    return _selectorView;
}
-(HoneNavView *)navView{
    if (!_navView) {
        _navView = [[HoneNavView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [self navHeightWithHeight])];
        _navView.backgroundColor = [UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1];
    }
    return _navView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sortArr = [[NSMutableArray alloc]init];
    self.dataArr = [[NSMutableArray alloc]init];
    self.projectArr = [[NSMutableArray alloc]init];
    self.hotArr = [[NSMutableArray alloc]init];
    self.entranceArr = [[NSMutableArray alloc]init];
    self.subjectArr = [[NSMutableArray alloc]init];
    self.tryResult = [[ZXBannerData alloc]init];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.selectorView];
    [self.view addSubview:self.collectionView];
//    [self requestDefaultStore];
}

-(void)requestDefaultStore{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = @"1057591604124184579";
    req.version = @"2.0.0";
    if ([UserCacheBean share].userInfo.latitude.length>0) {
        req.userLatitude = [UserCacheBean share].userInfo.latitude;
    }else{
        req.userLatitude = @"0";
    }
    if ([UserCacheBean share].userInfo.longitude.length>0) {
         req.userLongitude = [UserCacheBean share].userInfo.longitude;
    }else{
        req.userLongitude = @"0";
    }
   
    WEAKSELF;
    [[HomeServiceApi share] getDefaultStoreWithParam:req response:^(id response) {
        if (response) {
            StoreAddressModel*model = response;
            [UserCacheBean share].userInfo.storeId = model.storeId;
            [weakSelf requestSortData];
        }
    }];
}
-(void)requestSortData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.version = @"2.0.0";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getSortListWithParam:req response:^(id response) {
        if (response) {
            [weakself.sortArr removeAllObjects];
            StairCategoryRes *model = [[StairCategoryRes alloc]init];
            model.productCategoryName = @"首页";
            [weakself.sortArr addObject:model];
            [weakself.sortArr addObjectsFromArray:response];
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (StairCategoryRes*res in self.sortArr) {
                if (res.productCategoryName) {
                    [arr addObject:res.productCategoryName];
                }
            }
            [weakself.selectorView setDataArr:arr];
             [weakself.selectorView setCurrentPage:0];
            [self requestBannerData];
        }
    }];
}
-(void)requestBannerData{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.version = @"2.0.0";
    req.subjectName = @"";
    req.subjectPosition = @"index_banner";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getBannerListWithParam:req response:^(id response) {
        if (response) {
            [weakself.dataArr removeAllObjects];
            [weakself.dataArr addObjectsFromArray:response];
            [weakself.collectionView reloadData];
            
        }
        [weakself requestProject];
    }];
}
-(void)requestProject{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.version = @"2.0.0";
    req.subjectName = @"";
    req.subjectPosition = @"subject_quality";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getBannerListWithParam:req response:^(id response) {
        if (response) {
            [weakself.projectArr removeAllObjects];
            [weakself.projectArr addObjectsFromArray:response];
            [weakself.collectionView reloadData];
        }
        [self getHotList];
    }];
}
-(void)getHotList{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"1546842327000";
//    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.storeId = @"1050650499966791681";
    req.version = @"2.0.0";
    req.pageIndex = 1;
    req.pageSize = @"6";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getHotListWithParam:req response:^(id response) {
        if (response) {
            [weakself.hotArr removeAllObjects];
            [weakself.hotArr addObjectsFromArray:response];
            [weakself.collectionView reloadData];
        }
        [weakself requestEntrance];
    }];
}
-(void)requestEntrance{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.version = @"2.0.0";
    req.subjectName = @"";
    req.subjectPosition = @"index_entrance_banner";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getExtranceListWithParam:req response:^(id response) {
        if (response) {
            [weakself.entranceArr removeAllObjects];
            [weakself.entranceArr addObjectsFromArray:response];
            [weakself.collectionView reloadData];
        }
        [weakself requestLoveToTry];
    }];
}
-(void)requestLoveToTry{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
//    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.storeId = @"1050650499966791681";
    req.version = @"2.0.0";
    req.subjectId = @"1055363505664245762";
    WEAKSELF;
    [[HomeServiceApi share]getLoveToTryWithParam:req response:^(id response) {
        if (response) {
            weakSelf.tryResult = response;
            [weakSelf.collectionView reloadData];
        }
    }];
}
-(void)requestSubjectList:(NSString*)categaryId{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    req.productCategoryId = categaryId;
    //    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.storeId = @"1050650499966791681";
    req.version = @"2.0.0";
    req.subjectId = @"1055363505664245762";
    req.pageIndex = 1;
    req.pageSize = @"6";
    WEAKSELF;
    [[HomeServiceApi share] getSubjectProductWithParam:req response:^(id response) {
        if (response) {
            [weakSelf.subjectArr removeAllObjects];
            [weakSelf.subjectArr addObjectsFromArray:response];
            [weakSelf.collectionView reloadData];
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
   [self requestDefaultStore];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        
    }
    return self;
}

-(void)chooseButtonType:(NSInteger)type{
    self.index = type;
    if (type == 0) {
        [self.collectionView reloadData];
    }else{
        StairCategoryRes *model = self.sortArr[type];
        [self requestSubjectList:model.productCategoryId];
    }
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.index ==0) {
        return 3;
    }
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.index ==0) {
        if (section ==0) {
            return self.hotArr.count;
        }else if (section ==1){
            return  self.tryResult.subjectProductList.count;
        }
    }
    
    return self.subjectArr.count;
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.index ==0) {
         return UIEdgeInsetsMake(0, 15, 0, 15);
    }
    return UIEdgeInsetsMake(0, 10, 0, 10);
    
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.index ==0) {
        return 15;
    }
    return 0;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.index ==0) {
        if (indexPath.section ==0) {
            return CGSizeMake((SCREENWIDTH-60)/3, 150);
        }else if (indexPath.section ==1){
            return CGSizeMake(SCREENWIDTH, 135);
        }else if (indexPath.section ==1){
            return CGSizeMake(SCREENWIDTH, 130);
        }
    }
    return CGSizeMake(SCREENWIDTH/2-15, 269);
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.index ==0) {
        if (indexPath.section ==0) {
            HomeHotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeHotCell class]) forIndexPath:indexPath];
            ProductListModel*model = self.hotArr[indexPath.row];
            [cell setModel:model];
            return cell;
        }
        HomeLoveTrysCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeLoveTrysCell class]) forIndexPath:indexPath];
        ProductListModel*model = self.tryResult.subjectProductList[indexPath.row];
        [cell setModel:model];
        return cell;
    }
    HomeProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeProductCell class]) forIndexPath:indexPath];
    ProductListModel*model = self.subjectArr[indexPath.row];
    [cell setModel:model];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.index ==0) {
        if (section ==0) {
            return CGSizeMake(SCREENWIDTH, 915);
        }else if (section ==1){
            return CGSizeMake(SCREENWIDTH, 115*(SCREENWIDTH-30)/345+87);
        }else if (section ==2){
            return CGSizeMake(SCREENWIDTH, 90);
        }
    }
    return CGSizeMake(SCREENWIDTH, 321);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    
    
    for (UIView *view in headerView.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            [view removeFromSuperview];
        }
    }
    if (self.index ==0) {
        if (indexPath.section ==0) {
            HomeHeadView*headView =  [[HomeHeadView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, 115+200*(SCREENWIDTH-30)/345)];
            [headerView addSubview:headView];
            WEAKSELF;
            [headView setSelectedBlock:^(NSInteger index) {
                if (index ==0) {
                    
                }else if (index ==1){
                    GourmetController*vc = [[GourmetController alloc]init];
                    vc.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:vc animated:YES];
                }else if (index ==2){
                    
                }else if (index ==3){
                    
                }else if (index ==4){
                    
                }
            }];
            if (self.dataArr.count>0) {
                [headView.bannerView setImagesWithBannerDatas:self.dataArr
                                             withRollInterval:100
                                          withAnimateInterval:10
                                   withPageIndicatorTintColor:[UIColor grayColor]
                            withCurrentPageIndicatorTintColor:[UIColor whiteColor]
                                               withTouchBlock:^(id _Nullable data) {
                                                   //                        ZXBannerData* bannerData = (ZXBannerData*)data;
                                                   
                }];
            }
            HomeProjectSelectView*projectView = [[HomeProjectSelectView alloc]initWithFrame:CGRectMake(0, headView.ctBottom, SCREENWIDTH, 180*(SCREENWIDTH-33)/342+150)];
            [headerView addSubview:projectView];
            [projectView setDataArr:self.projectArr];
            HomeActivityView*activityView = [[HomeActivityView alloc]initWithFrame:CGRectMake(0, projectView.ctBottom, SCREENWIDTH, 20+AUTOLAYOUTSIZE(200))];
            [headerView addSubview:activityView];
            [activityView setDataArr:self.entranceArr];
            UILabel *titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, activityView.ctBottom, SCREENWIDTH, 50)];
            if (self.hotArr.count>0) {
                 titlelabel.text = @"热销精品";
            }else{
                 titlelabel.text = @"";
            }
            titlelabel.textAlignment = NSTextAlignmentCenter;
            titlelabel.font = [UIFont systemFontOfSize:15];
            titlelabel.textColor = DSColorFromHex(0x323232);
            [headerView addSubview:titlelabel];
           
        }else if (indexPath.section ==1){
            HomeLoveTryView*tryView = [[HomeLoveTryView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 115*(SCREENWIDTH-30)/345+87)];
            [headerView addSubview:tryView];
            [tryView setModel:self.tryResult];
        }else if (indexPath.section ==2){
            
        }
    }else{
        HomeHeadView*headView =  [[HomeHeadView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, 115+200*(SCREENWIDTH-30)/345)];
        [headerView addSubview:headView];
        if (self.dataArr.count>0) {
            [headView.bannerView setImagesWithBannerDatas:self.dataArr
                                         withRollInterval:100
                                      withAnimateInterval:10
                               withPageIndicatorTintColor:[UIColor grayColor]
                        withCurrentPageIndicatorTintColor:[UIColor whiteColor]
                                           withTouchBlock:^(id _Nullable data) {
                                               //                        ZXBannerData* bannerData = (ZXBannerData*)data;
                                               
                                           }];
        }
    }
    return headerView;
}



@end

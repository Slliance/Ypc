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

@interface CircleController ()<UICollectionViewDataSource,ZSSortSelectorViewDelegate,LMHWaterFallLayoutDeleaget>
@property(nonatomic,strong)CircleNavView *navView;
@property(nonatomic,strong)NSMutableArray *sortArr;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic, weak) UICollectionView * collectionView;

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
    [self.view addSubview:self.navView];
    self.sortArr  = [[NSMutableArray alloc]init];
    self.dataArr = [[NSMutableArray alloc]init];
    [self setupLayoutAndCollectionView];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   [self requestSortList];
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
             [weakSelf.collectionView reloadData];
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
            [weakSelf.collectionView reloadData];
           
        }
    }];
}
-(void)chooseButtonType:(NSInteger)type{
    CircleCategaryRes *model = self.sortArr[type];
    [self requestData:model.topicCategoryId];
}
/**
 * 创建布局和collectionView
 */
- (void)setupLayoutAndCollectionView{
    
    // 创建布局
    LMHWaterFallLayout * waterFallLayout = [[LMHWaterFallLayout alloc]init];
    waterFallLayout.delegate = self;
    
    // 创建collectionView
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NavitionbarHeight, SCREENWIDTH, SCREENHEIGHT-NavitionbarHeight) collectionViewLayout:waterFallLayout];
    collectionView.backgroundColor = DSColorFromHex(0xF0F0F0);
    
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    // 注册
    [collectionView registerClass:[CircleListCell class] forCellWithReuseIdentifier:NSStringFromClass([CircleListCell class])];
    
    self.collectionView = collectionView;
}
#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CircleListCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CircleListCell class]) forIndexPath:indexPath];
    if (self.dataArr.count>0) {
        CircleListRes *model =self.dataArr[indexPath.item];
        [cell setModel:model];
        WEAKSELF;

        [cell setHeightBlock:^(CGFloat height) {
            model.height = height;
            [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }];
    }
    return cell;
}
#pragma mark  - <LMHWaterFallLayoutDeleaget>
- (CGFloat)waterFallLayout:(LMHWaterFallLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth{
    
    CircleListRes * model = self.dataArr[indexPath];
    CGFloat height = itemWidth* model.height/(SCREENWIDTH/2-15);
    return height;
}

- (CGFloat)rowMarginInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout{
    
    return 10;
    
}

- (NSUInteger)columnCountInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout{
    
    return 2;
    
}
@end

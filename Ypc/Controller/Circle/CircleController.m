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
#import "EWaterFallView.h"

@interface CircleController ()<UICollectionViewDataSource,ZSSortSelectorViewDelegate>
@property(nonatomic,strong)CircleNavView *navView;
@property(nonatomic,strong)NSMutableArray *sortArr;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)EWaterFallView *fview;
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
     [self fview];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
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
    [[CircleServiseApi share]getCircleSortWithParam:req response:^(id response) {
        if (response) {
            [self.sortArr removeAllObjects];
            [self.sortArr addObjectsFromArray:response];
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (CircleCategaryRes*res in self.sortArr) {
                if (res.topicCategoryName) {
                    [arr addObject:res.topicCategoryName];
                }
            }
            [self.navView.selectorView setDataArr:arr];
            [self.navView.selectorView setCurrentPage:0];
            CircleCategaryRes *model = [self.sortArr firstObject];
            [self requestData:model.topicCategoryId];
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
    [[CircleServiseApi share]getCircleListWithParam:req response:^(id response) {
        if (response) {
            [self.dataArr removeAllObjects];
            [self.dataArr addObjectsFromArray:response];
            [self.fview reloadData];
        }
    }];
}
-(void)chooseButtonType:(NSInteger)type{
    CircleCategaryRes *model = self.sortArr[type];
    [self requestData:model.topicCategoryId];
}
- (EWaterFallView *)fview{
    if (_fview == nil) {
        WEAKSELF;
        _fview = [[EWaterFallView alloc] init];
        //注册cell,默认 UICollectionViewCell
        _fview.registerClassCell = @"CircleListCell";
        
        //设置参数
        _fview.setParamBlock = ^(EWaterFallLayout *layout) {
            //设置三列
            layout.columnCount = 3;
            //设置间距
            layout.rowSpacing = 5;
            layout.columnSpacing = 5;
            //设置偏移
            layout.sectionInset = UIEdgeInsetsZero;
        };
        
        //返回每个item的高度
        _fview.itemHeightBlock = ^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
            return [weakSelf.dataArr[indexPath.row][@"ratio"] floatValue] *itemWidth + 20;
        };
        
        //返回总个数
        _fview.numberOfRowsBlock = ^NSInteger{
            return weakSelf.dataArr.count;
        };
        
        //返回设置cell
        _fview.cellDataBlock = ^id(CircleListCell *cell, NSIndexPath *indexPath) {
            /*
             1.直接设置cell
             或者
             2.也可以在cell遵循协议执行方法：
             - (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath;
             */
            CircleListRes *model = weakSelf.dataArr[indexPath.row];
            [cell setModel:model];
            return weakSelf.dataArr[indexPath.row];
        };
        
        //点击cell
        _fview.didSelectAtIndexPathBlock = ^(NSIndexPath *indexPath) {
            NSLog(@"%ld",indexPath.row);
        };
        
        [self.view addSubview:_fview];
        
        //获取数据后刷新
        [_fview reloadData];
    }
    return _fview;
}

//#pragma mark - UICollectionViewDataSource
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.dataArr.count;
//}
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CircleListCell *cell =
//    (CircleListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CircleListCell class]) forIndexPath:indexPath];
//    CircleListRes *model = self.dataArr[indexPath.row];
//    [cell setModel:model];
//    return cell;
//}



//#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CircleListRes *model = self.dataArr[indexPath.row];
//    return CGSizeMake(SCREENWIDTH/2-15, [CircleListCell getHeight:model]);
//}

@end

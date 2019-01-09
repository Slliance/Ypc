//
//  SortController.m
//  Ypc
//
//  Created by zhangshu on 2018/12/12.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "SortController.h"
#import "SortLeftScrollow.h"
#import "SortCollectionViewCell.h"
#import "SortCollectHeadView.h"
#import "HomeServiceApi.h"
#import "SortNavView.h"

@interface SortController ()<UICollectionViewDelegate, UICollectionViewDataSource,SortLeftScrollowDelegate>
@property(nonatomic,strong)SortLeftScrollow *sortLeftView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,strong)SortCollectHeadView *headView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *detailDataArr;
@property(nonatomic,assign)NSInteger headIndex;
@property(nonatomic,strong)SortNavView* navView;
@end
static NSString *cellId = @"SortCollectionViewCell";
@implementation SortController
-(SortNavView *)navView{
    if (!_navView) {
        _navView = [[SortNavView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, NavitionbarHeight)];
    }
    return _navView;
}
-(SortLeftScrollow *)sortLeftView{
    if (!_sortLeftView) {
        _sortLeftView = [[SortLeftScrollow alloc]initWithFrame:CGRectMake(0, [self navHeightWithHeight], 90, SCREENHEIGHT-[self tabBarHeight]-40)];
        _sortLeftView.delegate = self;
    }
    return _sortLeftView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = NO;
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:self.sortLeftView];
    _dataArr = [NSMutableArray array];
    _detailDataArr = [NSMutableArray array];
    
    [self.view addSubview:self.navView];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(75, 75);
    layout.headerReferenceSize = CGSizeMake(SCREENWIDTH, 110);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(90, [self navHeightWithHeight], SCREENWIDTH-90, SCREENHEIGHT-[self navHeightWithHeight]-[self tabBarHeight]) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[SortCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [self.collectionView
     registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footreusableView"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self requestSortData];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(void)requestSortData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
//    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.storeId = @"1050650499966791681";
    req.version = @"2.0.0";
    __weak typeof(self)weakself = self;
    [[HomeServiceApi share]getSortMainListWithParam:req response:^(id response) {
        if (response) {
            [weakself.dataArr removeAllObjects];
            [weakself.dataArr addObjectsFromArray:response];
            [weakself.sortLeftView setDataArr:weakself.dataArr];
            StairCategoryRes *model = [weakself.dataArr firstObject];
            weakself.headIndex = 0;
            [weakself.detailDataArr removeAllObjects];
            [weakself.detailDataArr addObjectsFromArray:model.productCategoryList];
            [weakself.collectionView reloadData];
        }
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _detailDataArr.count;
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,10, 0,10);
    
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}



//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(75, 75);
    
}
//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
    //        UICollectionReusableView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footreusableView" forIndexPath:indexPath];
    //        footview.backgroundColor =DSColorFromHex(0xF2F2F2);
    //
    //        return footview;
    //    }
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    
    
    for (UIView *view in headerView.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            [view removeFromSuperview];
        }
    }
    _headView = [[SortCollectHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH-90, 110)];
    
    if (_dataArr.count >0) {
        StairCategoryRes *model = _dataArr[_headIndex];
        _headView.nameLabel.text = model.productCategoryName;
    }
    
    [headerView addSubview:_headView];
    return headerView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SortCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell setImageHeight:75];
    StairCategoryRes *model = _detailDataArr[indexPath.row];
    [cell setModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    DetailSortController *vc = [DetailSortController new];
//    [vc setSelectedIndex:indexPath.row];
//    [vc setDataArr:self.detailDataArr];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController showViewController:vc sender:nil];
}

#pragma mark--SortLeftScrollowDelegate
-(void)selectedSortIndex:(NSInteger)index{
    StairCategoryRes *model =_dataArr[index];
    [self.detailDataArr removeAllObjects];
    [self.detailDataArr addObjectsFromArray:model.productCategoryList];
    _headIndex = index;
    [self.collectionView reloadData];
}
@end

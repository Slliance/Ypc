//
//  ChildCircleController.m
//  Ypc
//
//  Created by zhangshu on 2019/1/10.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "ChildCircleController.h"
#import "CircleListCell.h"
#import "LMHWaterFallLayout.h"
@interface ChildCircleController ()<LMHWaterFallLayoutDeleaget,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation ChildCircleController
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        // 创建布局
        LMHWaterFallLayout * waterFallLayout = [[LMHWaterFallLayout alloc]init];
        waterFallLayout.delegate = self;
        
        // 创建collectionView
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NavitionbarHeight, SCREENWIDTH, SCREENHEIGHT-NavitionbarHeight) collectionViewLayout:waterFallLayout];
        _collectionView.backgroundColor = DSColorFromHex(0xF0F0F0);
        
        _collectionView.dataSource = self;
        // 注册
        [_collectionView registerClass:[CircleListCell class] forCellWithReuseIdentifier:NSStringFromClass([CircleListCell class])];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

-(void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr  = dataArr;
    [self.collectionView reloadData];
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
    if ([self.collectionView numberOfItemsInSection:0] ==self.dataArr.count) {
        CircleListRes *model =self.dataArr[indexPath.item];
        [cell setModel:model];
        WEAKSELF;
        
        [cell setHeightBlock:^(CGFloat height) {
            model.height = height;
            [UIView performWithoutAnimation:^{
                if (indexPath.row < weakSelf.dataArr.count) {
                    [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
                }
            }];
            
            
        }];
    }
    return cell;
}
#pragma mark  - <LMHWaterFallLayoutDeleaget>
- (CGFloat)waterFallLayout:(LMHWaterFallLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth{
    
    CircleListRes * model = self.dataArr[indexPath];
    
    return model.height;
}

- (CGFloat)rowMarginInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout{
    
    return 10;
    
}

- (NSUInteger)columnCountInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout{
    
    return 2;
    
}
@end

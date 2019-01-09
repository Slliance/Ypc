//
//  HomeProjectSelectView.m
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeProjectSelectView.h"
#import "HomeProjectSelectwCell.h"

@implementation HomeProjectSelectView
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(SCREENWIDTH-35, 180*(SCREENWIDTH-35)/340+80);
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _layout;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 70, SCREENWIDTH, 180*(SCREENWIDTH-35)/340+80) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[HomeProjectSelectwCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeProjectSelectwCell class])];
    }
    return _collectionView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"专题精选";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = DSColorFromHex(0xB4B4B4);
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.text = @"只向你推荐精品";
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

#pragma mark ------ UI ------
- (void)setUI {
    [self addSubview:self.collectionView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(20);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
}

#pragma mark ------ UICollectionViewDataSource ------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15, 0,0);
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeProjectSelectwCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeProjectSelectwCell class]) forIndexPath:indexPath];
    ZXBannerData*model = self.dataArr[indexPath.row];
    [cell setModel:model];
    if (indexPath.row%2 ==0) {
        cell.typeLabel.textColor = DSColorFromHex(0xD28E22);
    }else{
         cell.typeLabel.textColor = DSColorFromHex(0x1FA409);
    }
    return cell;
}
-(void)setDataArr:(NSArray *)dataArr{
    _dataArr = dataArr;
    [self.collectionView reloadData];
}

@end

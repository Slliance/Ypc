//
//  HomeProjectSelectView.h
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeProjectSelectView : BaseView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *dataArr;

@end

NS_ASSUME_NONNULL_END

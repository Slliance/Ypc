//
//  HomeProductCell.h
//  Ypc
//
//  Created by zhangshu on 2019/1/8.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "ProductListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeProductCell : BaseCollectionViewCell
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *headaImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *countLabel;
@property(nonatomic,strong)ProductListModel*model;
@end

NS_ASSUME_NONNULL_END

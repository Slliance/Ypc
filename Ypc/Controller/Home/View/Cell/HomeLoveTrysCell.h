//
//  HomeLoveTrysCell.h
//  Ypc
//
//  Created by zhangshu on 2019/1/7.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "ProductListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeLoveTrysCell : BaseCollectionViewCell
@property(nonatomic,strong)UIImageView *headaImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *weightLabel;
@property(nonatomic,strong)UILabel *countLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UILabel *originalLabel;

@property(nonatomic,strong)ProductListModel*model;

@end

NS_ASSUME_NONNULL_END

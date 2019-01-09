//
//  HomeProjectSelectwCell.h
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "ZXBannerData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeProjectSelectwCell : BaseCollectionViewCell
@property(nonatomic,strong)UIImageView *headaImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)ZXBannerData*model;
@end

NS_ASSUME_NONNULL_END

//
//  HomeLoveTryView.h
//  Ypc
//
//  Created by zhangshu on 2019/1/7.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseView.h"
#import "ZXBannerData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeLoveTryView : BaseView
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *topImage;
@property(strong, nonatomic)ZXBannerData*model;

@end

NS_ASSUME_NONNULL_END

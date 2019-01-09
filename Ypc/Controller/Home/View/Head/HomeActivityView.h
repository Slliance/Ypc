//
//  HomeActivityView.h
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseView.h"
#import "ZXBannerData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeActivityView : BaseView
@property(nonatomic,strong)UIImageView *leftImage;
@property(nonatomic,strong)UIImageView *topImage;
@property(nonatomic,strong)UIImageView *bottomImage;
@property(nonatomic,strong)NSArray *dataArr;

@end

NS_ASSUME_NONNULL_END

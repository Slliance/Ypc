//
//  HomeHeadView.h
//  Ypc
//
//  Created by zhangshu on 2018/12/14.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "BaseView.h"
#import "ZXBannerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeHeadView : BaseView
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)ZXBannerView *bannerView;

@end

NS_ASSUME_NONNULL_END

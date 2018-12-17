//
//  HomeServiceApi.h
//  Shh
//
//  Created by 燕来秋mac9 on 2018/10/18.
//  Copyright © 2018年 zhangshu. All rights reserved.
//


#import "BaseApi.h"
#import "BaseModelReq.h"
#import "StairCategoryRes.h"
#import "HomeReq.h"
#import "ZXBannerData.h"

@interface HomeServiceApi : BaseApi
+ (instancetype)share;
///分类列表
-(void)getSortListWithParam:(BaseModelReq *) req response:(responseModel) responseModel;
///banner列表
-(void)getBannerListWithParam:(HomeReq *) req response:(responseModel) responseModel;

@end

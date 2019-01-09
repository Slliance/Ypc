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
#import "ProductListModel.h"
#import "StoreAddressModel.h"

@interface HomeServiceApi : BaseApi
+ (instancetype)share;
///分类列表
-(void)getSortListWithParam:(BaseModelReq *) req response:(responseModel) responseModel;
///banner列表
-(void)getBannerListWithParam:(HomeReq *) req response:(responseModel) responseModel;
///热销列表
-(void)getHotListWithParam:(HomeReq *) req response:(responseModel) responseModel;
///团购，预售
-(void)getExtranceListWithParam:(HomeReq *) req response:(responseModel) responseModel;
///获取默认门店
-(void)getDefaultStoreWithParam:(HomeReq *) req response:(responseModel) responseModel;
///爱尝鲜
-(void)getLoveToTryWithParam:(HomeReq *) req response:(responseModel) responseModel;
///分类下商品
-(void)getSubjectProductWithParam:(HomeReq *) req response:(responseModel) responseModel;
///分类主列表
-(void)getSortMainListWithParam:(BaseModelReq *) req response:(responseModel) responseModel;


@end

//
//  BaseApi.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSAPIProxy.h"
#import "UserCacheBean.h"
#import "ZSConfig.h"

///分类列表
#define sort_list      @"/ypc/product/category/mobile/v1/list/index"
///首页banner/专题
#define banner_home   @"/ypc/subject/mobile/v1/list"
///预售，团购，众筹
#define entrance_home   @"/ypc/subject/mobile/v1/list/index/entrance"
///热销
#define hot_list_home   @"/ypc/product/mobile/v1/product/recommend/list"
///爱尝鲜
#define love_try_home   @"/ypc/subject/mobile/v1/find"
///默认门店id
#define default_storeid  @"/ypc/store/mobile/v1/find/def/recent/store"
///分类下商品
#define subject_product  @"/ypc/product/mobile/v1/list"
///分类主页列表
#define sort_main_list   @"/ypc/product/category/mobile/v1/list"


///圈子分类
#define circle_sort_list   @"/ypc/topic/category/mobile/v1/list"
///圈子分类下列表
#define circle_list   @"/ypc/topic/mobile/v1/listbytopiccategoryid"


typedef void(^responseModel)(id response);
@interface BaseApi : NSObject
+ (void)requestAccountInfoModel:(responseModel ) response;
@end

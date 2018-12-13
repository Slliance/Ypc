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
#define sort_list          @"/ypc/product/category/mobile/v1/list/index"


typedef void(^responseModel)(id response);
@interface BaseApi : NSObject
+ (void)requestAccountInfoModel:(responseModel ) response;
@end

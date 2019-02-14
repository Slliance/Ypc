//
//  HomeServiceApi.m
//  Shh
//
//  Created by 燕来秋mac9 on 2018/10/18.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "HomeServiceApi.h"

@implementation HomeServiceApi
+ (instancetype)share {
    static HomeServiceApi *global;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (global == nil) {
            global = [[HomeServiceApi alloc] init];
        }
    });
    return global;
}
///分类列表
-(void)getSortListWithParam:(BaseModelReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:sort_list Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [StairCategoryRes mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///banner列表
-(void)getBannerListWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:banner_home Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [ZXBannerData mj_objectArrayWithKeyValuesArray:dicResponse[@"data"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///热销列表
-(void)getHotListWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:hot_list_home Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [ProductListModel mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///团购，预售
-(void)getExtranceListWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:entrance_home Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [ZXBannerData mj_objectArrayWithKeyValuesArray:dicResponse[@"data"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///获取默认门店
-(void)getDefaultStoreWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:default_storeid Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    StoreAddressModel *result = [StoreAddressModel mj_objectWithKeyValues:dicResponse[@"data"][@"store"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///爱尝鲜
-(void)getLoveToTryWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:love_try_home Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    ZXBannerData *result = [ZXBannerData mj_objectWithKeyValues:dicResponse[@"data"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///分类下商品
-(void)getSubjectProductWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:subject_product Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [ProductListModel mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///分类主列表
-(void)getSortMainListWithParam:(BaseModelReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:sort_main_list Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [StairCategoryRes mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///专题详情
-(void)getTopicDetailWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:topic_detail Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    ZXBannerData *result = [ZXBannerData mj_objectWithKeyValues:dicResponse[@"data"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///美食家
-(void)getGourmentListWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:gourment_list Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    NSArray *result = [GourmentListRes mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///美食家详情
-(void)getGourmentDetailWithParam:(HomeReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:gourment_detail Params:dic isShowLoading:NO successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                if (responseModel) {
                    GourmentListRes *result = [GourmentListRes mj_objectWithKeyValues:dicResponse[@"data"]];
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
    
}
@end

//
//  StoreAddressModel.h
//  Ypc
//
//  Created by zhangshu on 2019/1/7.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoreAddressModel : NSObject
///
@property(nonatomic,copy)NSString *storeAddress;
///
@property(nonatomic,copy)NSString *storeArea;
///
@property(nonatomic,copy)NSString *storeCategoryId;
///
@property(nonatomic,copy)NSString *storeCategoryName;
///
@property(nonatomic,copy)NSString *storeCity;
///
@property(nonatomic,copy)NSString *storeDistributionScope;
///
@property(nonatomic,copy)NSString *storeId;
///
@property(nonatomic,copy)NSString *storeIsEnable;
///
@property(nonatomic,copy)NSString *storeLatitude;
///
@property(nonatomic,copy)NSString *storeLinkPerson;
///
@property(nonatomic,copy)NSString *storeLongitude;
///
@property(nonatomic,copy)NSString *storeName;
///
@property(nonatomic,copy)NSString *storeProvince;
///
@property(nonatomic,copy)NSString *storeTel;
///
@property(nonatomic,copy)NSString *systemVersion;

@end

NS_ASSUME_NONNULL_END

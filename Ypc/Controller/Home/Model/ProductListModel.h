//
//  ProductListModel.h
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductListModel : NSObject
///
@property(nonatomic,copy)NSString *productTitle;
///
@property(nonatomic,copy)NSString *productId;
///
@property(nonatomic,copy)NSString *prodcutSkuName;
///
@property(nonatomic,copy)NSString *productName;

///
@property(nonatomic,copy)NSString *prodcutSkuUnit;
///
@property(nonatomic,copy)NSString *productCoverImagePath;
///
@property(nonatomic,copy)NSString *storeProductOnLinePrice;
///
@property(nonatomic,assign)NSInteger productSaleSystemCount;
///
@property(nonatomic,assign)NSInteger productViewArtificialCount;
///
@property(nonatomic,copy)NSString *subjectProductImagePath;
///
@property(nonatomic,copy)NSString *productMarketPrice;
@end

NS_ASSUME_NONNULL_END

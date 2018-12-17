//
//  HomeReq.h
//  Ypc
//
//  Created by zhangshu on 2018/12/14.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "BaseModelReq.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeReq : BaseModelReq
///
@property(nonatomic,copy)NSString *subjectName;
///
@property(nonatomic,copy)NSString *subjectPosition;
@end

NS_ASSUME_NONNULL_END

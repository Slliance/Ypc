//
//  GourmentListRes.h
//  Ypc
//
//  Created by zhangshu on 2019/2/12.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GourmentListRes : NSObject
///
@property(nonatomic,copy)NSString *memberAvatarPath;
///
@property(nonatomic,assign)BOOL wasLiked;
///
@property(nonatomic,assign)BOOL wasFollow;
///
@property(nonatomic,assign)BOOL wasCollection;
///
@property(nonatomic,copy)NSString *articleTitle;
///
@property(nonatomic,copy)NSString *totalLike;
///
@property(nonatomic,copy)NSString *epicureId;
///
@property(nonatomic,copy)NSString *systemCreateTime;
///
@property(nonatomic,copy)NSString *memberNickname;
///
@property(nonatomic,copy)NSString *articleImagePath;
///
@property(nonatomic,copy)NSString *systemVersion;
///
@property(nonatomic,copy)NSString *memberId;
///
@property(nonatomic,copy)NSString *productId;
///
@property(nonatomic,copy)NSString *forwardNumber;
///
@property(nonatomic,copy)NSString *articleContent;
///
@property(nonatomic,strong)NSArray *articleImageList;



@end

NS_ASSUME_NONNULL_END

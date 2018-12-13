//
//  HoneNavView.h
//  Ypc
//
//  Created by zhangshu on 2018/12/13.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HoneNavView : BaseView
@property(nonatomic,strong)UIButton *locBtn;
@property(nonatomic,strong)UIButton *searchBtn;
@property(nonatomic,strong)UIButton *saoBtn;
@property(nonatomic,strong)UIButton *messageBtn;
@property(nonatomic,copy)void (^navBlock)(NSInteger);
@end

NS_ASSUME_NONNULL_END

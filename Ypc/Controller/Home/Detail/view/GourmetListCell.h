//
//  GourmetListCell.h
//  Ypc
//
//  Created by zhangshu on 2019/2/12.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "GourmentListRes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GourmetListCell : BaseTableViewCell
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *topImage;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIButton *zanBtn;

@property(nonatomic,strong)GourmentListRes *model;

@end

NS_ASSUME_NONNULL_END

//
//  GourmetDetailTopView.h
//  Ypc
//
//  Created by zhangshu on 2019/2/13.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GourmetDetailTopView : BaseView
@property(nonatomic,strong)UIImageView *topImage;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)DNAButton *followBtn;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *productImage;
@property(nonatomic,strong)UILabel *productLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *countLabel;




@end

NS_ASSUME_NONNULL_END

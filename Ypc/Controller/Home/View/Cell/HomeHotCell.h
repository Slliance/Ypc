//
//  HomeHotCell.h
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "ProductListModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface HomeHotCell : BaseCollectionViewCell
@property(nonatomic,strong)UIImageView *headaImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)ProductListModel*model;

@end

NS_ASSUME_NONNULL_END

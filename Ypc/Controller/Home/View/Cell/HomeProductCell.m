//
//  HomeProductCell.m
//  Ypc
//
//  Created by zhangshu on 2019/1/8.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeProductCell.h"

@implementation HomeProductCell
-(UIImageView *)headaImage{
    if (!_headaImage) {
        _headaImage = [[UIImageView alloc]init];
        _headaImage.backgroundColor = DSColorFromHex(0xF0F0F0);
        
    }
    return _headaImage;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _titleLabel;
}
-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = DSColorFromHex(0x323232);
        _priceLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _priceLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.textColor = DSColorFromHex(0x969696);
        _countLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.textAlignment = NSTextAlignmentRight;
    }
    return _countLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = DSColorFromHex(0xBD633F);
        _detailLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _detailLabel;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        [_bgView.layer setCornerRadius:9];
        [_bgView.layer setMasksToBounds:YES];
        _bgView.backgroundColor = DSColorFromHex(0xF5E3DC);
    }
    return _bgView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.headaImage];
        [self.bgView addSubview:self.detailLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.countLabel];
        [self setLauout];
    }
    return self;
}
-(void)setLauout{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.height.mas_equalTo(SCREENWIDTH/2-30/2+28);
    }];
    [self.headaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.bgView);
        make.width.height.mas_equalTo(SCREENWIDTH/2-15);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.bgView).offset(-5);
        make.top.equalTo(self.headaImage.mas_bottom);
        make.height.mas_equalTo(28);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView);
        make.right.equalTo(self.bgView);
        make.top.equalTo(self.bgView.mas_bottom).offset(5);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(3);
    }];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.bgView);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(3);
    }];

}
-(void)setModel:(ProductListModel *)model{
    _model = model;
    NSString*url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.productCoverImagePath];
    [self.headaImage sd_setImageWithURL:[NSURL URLWithString:url]];
    self.titleLabel.text = model.productName;
    self.detailLabel.text = model.productTitle;
    NSInteger count =model.productSaleSystemCount+model.productViewArtificialCount;
    self.countLabel.text = [NSString stringWithFormat:@"销售:%ld",(long)count];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.storeProductOnLinePrice];
}
@end

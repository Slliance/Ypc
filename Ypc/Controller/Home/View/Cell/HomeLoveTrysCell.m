//
//  HomeLoveTrysCell.m
//  Ypc
//
//  Created by zhangshu on 2019/1/7.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeLoveTrysCell.h"

@implementation HomeLoveTrysCell
-(UIImageView *)headaImage{
    if (!_headaImage) {
        _headaImage = [[UIImageView alloc]init];
        _headaImage.backgroundColor = DSColorFromHex(0xF0F0F0);
        [_headaImage.layer setCornerRadius:9];
        [_headaImage.layer setMasksToBounds:YES];
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

-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = DSColorFromHex(0x969696);
        _detailLabel.font = [UIFont systemFontOfSize:15];
       
    }
    return _detailLabel;
}
-(UILabel *)weightLabel{
    if (!_weightLabel) {
        _weightLabel = [[UILabel alloc]init];
        _weightLabel.textColor = DSColorFromHex(0x969696);
        _weightLabel.font = [UIFont systemFontOfSize:15];
        _weightLabel.text = @"120克";
    }
    return _weightLabel;
}
-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = DSColorFromHex(0x323232);
        _priceLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _priceLabel;
}
-(UILabel *)originalLabel{
    if (!_originalLabel) {
        _originalLabel = [[UILabel alloc]init];
        _originalLabel.textColor = DSColorFromHex(0x969696);
        _originalLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _originalLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.textColor = DSColorFromHex(0x969696);
        _countLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _countLabel;
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = DSColorFromHex(0x969696);
    }
    return _lineLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headaImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.weightLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.originalLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.lineLabel];
        [self setLauout];
    }
    return self;
}
-(void)setLauout{
    [self.headaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-15);
        make.width.height.mas_equalTo(120);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headaImage.mas_right).offset(10);
        make.top.equalTo(self).offset(7);
        make.right.equalTo(self).offset(-15);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headaImage.mas_right).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(7);
        make.right.equalTo(self).offset(-15);
    }];
    [self.weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headaImage.mas_right).offset(10);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(7);
        make.right.equalTo(self).offset(-15);
    }];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headaImage.mas_right).offset(10);
        make.bottom.equalTo(self.headaImage).offset(-10);
    }];
    [self.originalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.bottom.equalTo(self.headaImage).offset(-10);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.originalLabel);
        make.height.mas_equalTo(1);
        make.centerY.equalTo(self.originalLabel);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.originalLabel.mas_left).offset(-5);
        make.bottom.equalTo(self.headaImage).offset(-10);
    }];
}
-(void)setModel:(ProductListModel *)model{
    _model = model;
    NSString*url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.subjectProductImagePath];
    [self.headaImage sd_setImageWithURL:[NSURL URLWithString:url]];
    self.titleLabel.text = model.productName;
    self.detailLabel.text = model.productTitle;
    NSInteger count =model.productSaleSystemCount+model.productViewArtificialCount;
    self.countLabel.text = [NSString stringWithFormat:@"销售:%ld",(long)count];
    self.originalLabel.text = [NSString stringWithFormat:@"￥%@",model.productMarketPrice];
    self.priceLabel.text = [NSString stringWithFormat:@"尝鲜价:￥%@",model.storeProductOnLinePrice];
}
@end

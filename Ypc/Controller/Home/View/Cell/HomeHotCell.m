//
//  HomeHotCell.m
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeHotCell.h"

@implementation HomeHotCell
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
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headaImage];
        [self addSubview:self.titleLabel];
        [self.headaImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(100);
            make.top.equalTo(self).offset(5);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.top.equalTo(self.headaImage.mas_bottom).offset(3);
            make.left.equalTo(self.headaImage.mas_left);
        }];
    }
    return self;
}
-(void)setModel:(ProductListModel *)model{
    _model = model;
    NSString *url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.productCoverImagePath];
    [self.headaImage sd_setImageWithURL:[NSURL URLWithString:url]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@ ￥%@",model.productName,model.storeProductOnLinePrice];
    
}
@end

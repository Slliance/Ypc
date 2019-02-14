//
//  GourmetDetailTopView.m
//  Ypc
//
//  Created by zhangshu on 2019/2/13.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "GourmetDetailTopView.h"

@implementation GourmetDetailTopView
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        [_bgView.layer setCornerRadius:9];
        [_bgView.layer setMasksToBounds:YES];
        [_bgView.layer setBorderWidth:0.5];
        [_bgView.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
    }
    return _bgView;
}
-(UIImageView *)topImage{
    if (!_topImage) {
        _topImage = [[UIImageView alloc]init];
        [_topImage.layer setCornerRadius:SCREENWIDTH/2-15];
        [_topImage.layer setMasksToBounds:YES];
    }
    return _topImage;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        [_headImage.layer setCornerRadius:12];
        [_headImage.layer setMasksToBounds:YES];
    }
    return _headImage;
}
-(UIImageView *)productImage{
    if (!_productImage) {
        _productImage = [[UIImageView alloc]init];
    }
    return _productImage;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = DSColorFromHex(0x313131);
        _nameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _nameLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont systemFontOfSize:24];
    }
    return _titleLabel;
}
-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.textColor = DSColorFromHex(0x959595);
        _dateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _dateLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = DSColorFromHex(0x323232);
        _contentLabel.font = [UIFont systemFontOfSize:15];
    }
    return _contentLabel;
}
-(UILabel *)productLabel{
    if (!_productLabel) {
        _productLabel = [[UILabel alloc]init];
        _productLabel.textColor = DSColorFromHex(0x323232);
        _productLabel.font = [UIFont systemFontOfSize:15];
    }
    return _productLabel;
}

-(DNAButton *)followBtn{
    if (!_followBtn) {
        _followBtn = [DNAButton buttonWithType:UIButtonTypeCustom];
        [_followBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        [_followBtn setBackgroundColor:DSColorFromHex(0xFF692E) forState:UIControlStateNormal];
        [_followBtn setBackgroundColor:DSColorFromHex(0xC8C8C8) forState:UIControlStateNormal];
        [_followBtn.layer setCornerRadius:11];
        [_followBtn.layer setMasksToBounds:YES];
    }
    return _followBtn;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
@end

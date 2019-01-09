//
//  HomeProjectSelectwCell.m
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeProjectSelectwCell.h"

@implementation HomeProjectSelectwCell
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
-(UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.textColor = DSColorFromHex(0xD28E22);
        _typeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _typeLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = DSColorFromHex(0x969696);
        _detailLabel.font = [UIFont systemFontOfSize:12];
    }
    return _detailLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headaImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.typeLabel];
        [self addSubview:self.detailLabel];
        [self.headaImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(2.5);
            make.right.equalTo(self).offset(-2.5);
//            make.width.mas_equalTo(SCREENWIDTH-35);
            make.top.equalTo(self);
            make.height.mas_equalTo(180*(SCREENWIDTH-35)/342);
        }];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.headaImage.mas_right);
            make.top.equalTo(self.headaImage.mas_bottom).offset(5);
            make.left.equalTo(self.headaImage.mas_left);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.typeLabel.mas_bottom).offset(3);
            make.left.equalTo(self.headaImage.mas_left);
             make.right.equalTo(self.headaImage.mas_right);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(3);
            make.left.equalTo(self.headaImage.mas_left);
            make.right.equalTo(self.headaImage.mas_right);
        }];
    }
    return self;
}
-(void)setModel:(ZXBannerData *)model{
    _model = model;
    NSString *url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.subjectImagePath];
    [self.headaImage sd_setImageWithURL:[NSURL URLWithString:url]];
    self.typeLabel.text = model.subjectName;
    self.titleLabel.text = model.subjectTitle;
    self.detailLabel.text = model.subjectContent;
}

@end

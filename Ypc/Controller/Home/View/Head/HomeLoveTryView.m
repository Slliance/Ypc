//
//  HomeLoveTryView.m
//  Ypc
//
//  Created by zhangshu on 2019/1/7.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeLoveTryView.h"

@implementation HomeLoveTryView

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"爱尝鲜";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = DSColorFromHex(0xB4B4B4);
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.text = @"全网好货，超值低价";
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}
-(UIImageView *)topImage{
    if (!_topImage) {
        _topImage = [[UIImageView alloc]init];
        [_topImage.layer setCornerRadius:9];
    }
    return _topImage;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self.topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-15);
            make.height.mas_equalTo(115*(SCREENWIDTH-30)/345);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.topImage.mas_bottom).offset(20);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        }];
    }
    return self;
}
-(void)setModel:(ZXBannerData *)model{
    _model = model;
    self.titleLabel.text = model.subjectContent;
    self.detailLabel.text = model.subjectTitle;
    NSString*url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.subjectTopImagePath];
    [self.topImage sd_setImageWithURL:[NSURL URLWithString:url]];
}
@end

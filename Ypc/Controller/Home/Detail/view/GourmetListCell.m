//
//  GourmetListCell.m
//  Ypc
//
//  Created by zhangshu on 2019/2/12.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "GourmetListCell.h"

@implementation GourmetListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        [_bgView.layer setCornerRadius:11];
        [_bgView.layer setMasksToBounds:YES];
        [_bgView.layer setBorderWidth:0.5];
        [_bgView.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
    }
    return _bgView;
}
-(UIImageView *)topImage{
    if (!_topImage) {
        _topImage = [[UIImageView alloc]init];
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

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = DSColorFromHex(0x959595);
        _nameLabel.font = [UIFont systemFontOfSize:12];
    }
    return _nameLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}
-(UIButton *)zanBtn{
    if (!_zanBtn) {
        _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zanBtn setImage:[UIImage imageNamed:@"zan_home"] forState:UIControlStateNormal];
        [_zanBtn setTitleColor:DSColorFromHex(0x959595) forState:UIControlStateNormal];
        _zanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _zanBtn;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.headImage];
        [self.bgView addSubview:self.topImage];
        [self.bgView addSubview:self.nameLabel];
        [self.bgView addSubview:self.zanBtn];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.height.mas_equalTo(190*(SCREENWIDTH-30)/345+60);
        }];
        [self.topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.mas_equalTo(190*(SCREENWIDTH-30)/345);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView).offset(10);
            make.top.equalTo(self.topImage.mas_bottom).offset(10);
            make.right.equalTo(self.bgView).offset(-10);
        }];
        [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(24);
            make.left.equalTo(self.bgView).offset(10);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage.mas_right).offset(11);
            make.centerY.equalTo(self.headImage);
        }];
        [self.zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.bgView).offset(-15);
            make.centerY.equalTo(self.headImage);
            make.height.mas_equalTo(24);
        }];
    }
    return self;
}




-(void)setModel:(GourmentListRes *)model{
    _model = model;
    NSString*topurl = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.articleImagePath];
    NSString*memberurl = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.memberAvatarPath];
    [self.topImage sd_setImageWithURL:[NSURL URLWithString:topurl]];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:memberurl] placeholderImage:[UIImage imageNamed:@"mine_normal"]];
    self.titleLabel.text = model.articleTitle;
    self.nameLabel.text = model.memberNickname;
    [self.zanBtn setTitle:model.totalLike forState:UIControlStateNormal];
    self.zanBtn.selected = model.wasLiked;
    [self.zanBtn setIconInLeftWithSpacing:5];
}
@end

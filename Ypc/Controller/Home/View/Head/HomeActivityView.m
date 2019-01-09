//
//  HomeActivityView.m
//  Ypc
//
//  Created by zhangshu on 2019/1/2.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "HomeActivityView.h"

@implementation HomeActivityView

-(UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc]init];
    }
    return _leftImage;
}
-(UIImageView *)topImage{
    if (!_topImage) {
        _topImage = [[UIImageView alloc]init];
    }
    return _topImage;
}
-(UIImageView *)bottomImage{
    if (!_bottomImage) {
        _bottomImage = [[UIImageView alloc]init];
    }
    return _bottomImage;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftImage];
        [self addSubview:self.topImage];
        [self addSubview:self.bottomImage];
        [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(10);
            make.width.mas_equalTo((SCREENWIDTH-31)/2);
            make.height.mas_equalTo(200*SCREENWIDTH/375);
        }];
        [self.topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self).offset(10);
            make.width.mas_equalTo((SCREENWIDTH-31)/2);
            make.height.mas_equalTo(99.5*SCREENWIDTH/375);
        }];
        [self.bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self.topImage.mas_bottom).offset(1);
            make.width.mas_equalTo((SCREENWIDTH-31)/2);
            make.height.mas_equalTo(99.5*SCREENWIDTH/375);
        }];
        
    }
    return self;
}

-(void)setDataArr:(NSArray *)dataArr{
    _dataArr = dataArr;
    [_dataArr enumerateObjectsUsingBlock:^(ZXBannerData*model, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.subjectImagePath];
        if ([model.subjectName isEqualToString:@"众筹"]){
            [self.leftImage sd_setImageWithURL:[NSURL URLWithString:url]];
        }else if ([model.subjectName isEqualToString:@"预售"]) {
            [self.bottomImage sd_setImageWithURL:[NSURL URLWithString:url]];
        }else if ([model.subjectName isEqualToString:@"团购"]){
            [self.topImage sd_setImageWithURL:[NSURL URLWithString:url]];
        }
    }];
}
@end

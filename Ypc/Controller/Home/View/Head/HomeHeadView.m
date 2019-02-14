//
//  HomeHeadView.m
//  Ypc
//
//  Created by zhangshu on 2018/12/14.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "HomeHeadView.h"

@implementation HomeHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        [self addSubview:self.bannerView];
        [self addSubview:self.lineLabel];
        [self setIconUI];
    }
    return self;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5+100*(SCREENWIDTH-30)/345)];
        _bgView.backgroundColor = DSColorFromHex(0x323232);
    }
    return _bgView;
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _lineLabel;
}
-(ZXBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[ZXBannerView alloc]init];
        _bannerView.frame = CGRectMake(15, 5, SCREENWIDTH-30, 200*(SCREENWIDTH-30)/345);
    }
    return _bannerView;
}
-(void)setIconUI{
    NSArray*imageArr = @[@"yang_home",@"jia_home",@"xuan_home",@"niu_home",@"share_home"];
    NSArray*titleArr = @[@"洋品牌",@"美食家",@"壹严选",@"农场home",@"壹分享"];
    for (int i =0; i<5; i++) {
        UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        btn.frame = CGRectMake(-15+i*SCREENWIDTH/5-8, self.bannerView.ctBottom+25, SCREENWIDTH/3, SCREENWIDTH/5+26);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:DSColorFromHex(0x323232) forState:UIControlStateNormal];
        [btn setIconInTopWithSpacing:3];
        btn.tag = i;
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-0.5);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)pressBtn:(UIButton*)sender{
    self.selectedBlock(sender.tag);
}
@end

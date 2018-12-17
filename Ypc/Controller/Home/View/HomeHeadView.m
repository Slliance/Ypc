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
-(ZXBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[ZXBannerView alloc]init];
        _bannerView.frame = CGRectMake(15, 5, SCREENWIDTH-30, 200*(SCREENWIDTH-30)/345);
    }
    return _bannerView;
}
@end

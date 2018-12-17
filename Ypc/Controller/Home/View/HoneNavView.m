//
//  HoneNavView.m
//  Ypc
//
//  Created by zhangshu on 2018/12/13.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "HoneNavView.h"
static bool closeIntrinsic = false; //Intrinsic的影响
@implementation HoneNavView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DSColorFromHex(0x323232);
        [self addSubview:self.locBtn];
        [self addSubview:self.searchBtn];
        [self addSubview:self.saoBtn];
        [self addSubview:self.messageBtn];
        [self.locBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(30);
        }];
        [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(40);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(SCREENWIDTH-120);
            make.height.mas_equalTo(30);
        }];
        [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(self);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(30);
        }];
        [self.saoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.searchBtn.mas_right);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}

-(UIButton *)locBtn{
    if (!_locBtn) {
        _locBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_locBtn setImage:[UIImage imageNamed:@"address_home"] forState:UIControlStateNormal];
        [_locBtn addTarget:self action:@selector(pressLoc) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locBtn;
}
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"search_home"] forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(pressSearch) forControlEvents:UIControlEventTouchUpInside];
        [_searchBtn setTitle:@"阳澄湖大闸蟹" forState:UIControlStateNormal];
        _searchBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_searchBtn setTitleColor:DSColorFromHex(0xB4B4B4) forState:UIControlStateNormal];
        _searchBtn.backgroundColor = [UIColor whiteColor];
        [_searchBtn.layer setCornerRadius:14];
        [_searchBtn.layer setMasksToBounds:YES];
        _searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -SCREENWIDTH/2+50, 0, 0);
        _searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -SCREENWIDTH/2+60, 0, 0);
    }
    return _searchBtn;
}
-(UIButton *)saoBtn{
    if (!_saoBtn) {
        _saoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_saoBtn setImage:[UIImage imageNamed:@"saoma_home"] forState:UIControlStateNormal];
        [_saoBtn addTarget:self action:@selector(pressSao) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saoBtn;
}
-(UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@"message_home"] forState:UIControlStateNormal];
        [_messageBtn addTarget:self action:@selector(pressMes) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageBtn;
}
-(void)pressLoc{
    
}
-(void)pressSearch{
    
}
-(void)pressMes{
    
}
-(void)pressSao{
    
}
/**
 通过覆盖intrinsicContentSize函数修改自定义View的Intrinsic的大小
 @return CGSize
 */
-(CGSize)intrinsicContentSize
{
    if (closeIntrinsic) {
        return CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
    } else {
        return CGSizeMake(self.frame.size.width, self.frame.size.height);
    }
}


@end

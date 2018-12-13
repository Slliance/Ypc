//
//  HoneNavView.m
//  Ypc
//
//  Created by zhangshu on 2018/12/13.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "HoneNavView.h"

@implementation HoneNavView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DSColorFromHex(0x323232);
    }
    return self;
}

-(UIButton *)locBtn{
    if (!_locBtn) {
        _locBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_locBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_locBtn addTarget:self action:@selector(pressLoc) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locBtn;
}
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(pressSearch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}
-(UIButton *)saoBtn{
    if (!_saoBtn) {
        _saoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_saoBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_saoBtn addTarget:self action:@selector(pressSao) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saoBtn;
}
-(UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
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
@end

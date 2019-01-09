//
//  SortNavView.m
//  Ypc
//
//  Created by zhangshu on 2019/1/8.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "SortNavView.h"

@implementation SortNavView

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
        _searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -SCREENWIDTH/2-40, 0, 0);
        _searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -SCREENWIDTH/2-30, 0, 0);
    }
    return _searchBtn;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DSColorFromHex(0x323232);
        [self addSubview:self.searchBtn];
        [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-5);
            make.height.mas_equalTo(30);
        }];
        
    }
    return self;
}
-(void)pressSearch{
    
}
@end

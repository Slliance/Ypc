//
//  CircleListCell.m
//  Ypc
//
//  Created by zhangshu on 2019/1/8.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "CircleListCell.h"
#import "ZSConfig.h"
@implementation CircleListCell
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH/2-15, 200)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [_bgView.layer setCornerRadius:9];
        [_bgView.layer setMasksToBounds:YES];
    }
    return _bgView;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
//        _headImage.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImage;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.headImage];
        
        
    }
    return self;
}

-(void)setModel:(CircleListRes *)model{
    _model = model;
    NSString *url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.topicImagePath];
    WEAKSELF;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        weakSelf.headImage.frame = CGRectMake(0, 0, SCREENWIDTH/2-15, image.size.height*(SCREENWIDTH/2-15)/image.size.width);
    }];
}
+(CGFloat)getHeight:(CircleListRes *)model{
    CGFloat height = 100;
    NSString *url = [NSString stringWithFormat:@"%@%@",IMAGEHOST,model.topicImagePath];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    __block weakHeight = height;
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        weakHeight = weakHeight+ image.size.height*(SCREENWIDTH/2-15)/image.size.width;
    }];

   
    return weakHeight;
}
@end

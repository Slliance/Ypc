//
//  UIButton+Style.h
//  daner
//
//  Created by dnaer7 on 2018/10/31.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Style)
+ (void)changeTextBtn:(UIButton *)myBtn
          stringArray:(NSArray *)strArray
           colorArray:(NSArray *)colorArray
            fontArray:(NSArray *)fontArray ;

// mas 创建
+ (UIButton *)createWithType:(UIButtonType)type target:(id)target action:(SEL)action;

// frame 创建
+ (UIButton *)createWithFrame:(CGRect)frame type:(UIButtonType)type target:(id)target action:(SEL)action;
/*
 图片居左，文字在右，垂直居中显示，文字与图片没有间距为10
 */
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;

/*
 图片居右，文字在左，垂直居中显示，文字与图片没有间距为10
 */
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;

/*
 图片居上，文字在下，垂直居中显示，文字与图片没有间距为10
 */
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;

/*
 图片居下，文字在上，垂直居中显示，文字与图片没有间距为10
 */
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;
///根据内容获取宽度
+ (CGFloat )getButtonWidth:(UIButton*)btn;

@end

NS_ASSUME_NONNULL_END

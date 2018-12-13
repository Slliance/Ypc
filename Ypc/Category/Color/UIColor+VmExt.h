//
//  UIColor+VmExt.h
//  Vmessage
//
//  Created by vargo－mac on 16/7/29.
//  Copyright © 2016年 vargo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (VmExt)

/*! 16进制生成Color对象 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/* !16进制、alpha 生成Color对象*/
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/*! 随机颜色 */
+ (UIColor *)randomColor;

@end

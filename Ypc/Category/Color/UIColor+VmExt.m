//
//  UIColor+VmExt.m
//  Vmessage
//
//  Created by vargo－mac on 16/7/29.
//  Copyright © 2016年 vargo. All rights reserved.
//

#import "UIColor+VmExt.h"

@implementation UIColor (VmExt)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    return [self colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    // Bypass '#' character
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                           green:((rgbValue & 0xFF00) >> 8)/255.0
                            blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

+ (UIColor *)randomColor {
    static BOOL seed = NO;
    if (!seed) {
        seed = YES;
        srandom((unsigned int)time(NULL));
    }
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

@end

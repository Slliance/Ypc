//
//  ZSConfig.h
//  Shh
//
//  Created by 燕来秋mac9 on 2018/8/23.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#ifndef ZSConfig_h
#define ZSConfig_h
#define APPNAME @"Shh"
#define SUPPLIERAPIKEY @"ShhAppApiKey"
//#define DPHOST @"http://192.168.1.107:8088"// 测试环境
//#define DPHOST @"http://47.101.159.106:8088"// 测试环境
#define DPHOST  @"https://www.qimozxy.top"  //线上
#define IMAGEHOST  @"https://www.qimozxy.top"//图片地址

/**屏幕尺寸*/
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
/**封装颜色*/
#define DSColorMake(r, g, b)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define DSColorAlphaMake(r, g, b, a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define DSColorFromHex(rgb)     [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]
#define DSColorAlphaFromHex(rgb,a)     [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:a]
#define DSNavi  DSColorFromHex(0x323232) //navigation的颜色

#define DEFAULTColor DSColorAlphaFromHex(0x323232,1)// 主题色
// 创建一个weak变量
#define WEAKSELF __weak typeof(self) weakSelf = self;
// 实现一个单例
#define Create_Singleton_Imp(cls) \
+ (instancetype)shared \
{ \
static cls *_gs_cls = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (!_gs_cls) { \
_gs_cls = [cls new]; \
} \
}); \
return _gs_cls; \
} \
/**
*  自适应大小
*/
#define AUTOLAYOUTSIZE(size) (SCREENWIDTH / 375.0 * size)
/**
 *  弱引用
 */
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(self) __strong strongSelf = self;

#define TopStatuHeight        [[UIApplication sharedApplication] statusBarFrame].size.height
// 适配iPhone x 底栏高度
 #define TabbarHeight    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
// 适配iPhone x 导航高度
#define NavitionbarHeight    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64)
// 适配iPhone x 导航高度
#define BottomSafebarHeight    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)
// 声明一个单例
#define Create_Singleton_Def() + (instancetype)shared
#import <Masonry.h>
#import "UIView+CTExtensions.h"
#import <YYKit.h>
#import <MJExtension.h>
#import <SDImageCache.h>
#import <UIImageView+WebCache.h>
#import "UILabel+String.h"
#import "NSDate+Add.h"
#import "UIButton+Style.h"
#import "UserCacheBean.h"
#import "ZSNotification.h"
#import "UIView+VTUtility.h"

#endif /* ZSConfig_h */

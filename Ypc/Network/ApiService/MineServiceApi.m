//
//  MineServiceApi.m
//  Shh
//
//  Created by zhangshu on 2018/11/28.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "MineServiceApi.h"

@implementation MineServiceApi
+ (instancetype)share {
    static MineServiceApi *global;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (global == nil) {
            global = [[MineServiceApi alloc] init];
        }
    });
    return global;
}




@end

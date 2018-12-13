//
//  AppDelegate.h
//  Ypc
//
//  Created by zhangshu on 2018/12/11.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BaseTabBarController *mainTabController;

@end


//
//  AppDelegate.m
//  Ypc
//
//  Created by zhangshu on 2018/12/11.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
//#import <AlipaySDK/AlipaySDK.h>
#import "UserCacheBean.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ZSNotification.h"
@interface AppDelegate ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManagers;//定位管理
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _mainTabController = [[BaseTabBarController alloc] init];
    self.window.rootViewController = _mainTabController;
    [self.window makeKeyAndVisible];
    ///定位
    self.locationManagers = [[CLLocationManager alloc] init];
    self.locationManagers.delegate = self;
    self.locationManagers.desiredAccuracy = kCLLocationAccuracyBest;//选择定位经精确度
    self.locationManagers.distanceFilter = kCLDistanceFilterNone;
    //授权，定位功能必须得到用户的授权
    [self.locationManagers requestAlwaysAuthorization];
    [self.locationManagers requestWhenInUseAuthorization];
    [self.locationManagers startUpdatingLocation];
    [ZSNotification addRefreshLocationResultNotification:self action:@selector(refreshloc)];
    [UserCacheBean share].userInfo.latitude = @"0";
    [UserCacheBean share].userInfo.longitude = @"0";
    return YES;
}

-(void)refreshloc{
    [self.locationManagers startUpdatingLocation];
}

#pragma mark---定位
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *loc = [locations firstObject];
    
    //获得地理位置，把经纬度赋给我们定义的属性
    if ([NSString stringWithFormat:@"%f", loc.coordinate.latitude].length>0) {
        [UserCacheBean share].userInfo.latitude = [NSString stringWithFormat:@"%f", loc.coordinate.latitude];
    }else{
        [UserCacheBean share].userInfo.latitude = @"0";
    }
    if ([NSString stringWithFormat:@"%f", loc.coordinate.longitude].length>0) {
        [UserCacheBean share].userInfo.longitude = [NSString stringWithFormat:@"%f", loc.coordinate.longitude];
    }else{
        [UserCacheBean share].userInfo.longitude = @"0";
    }
    
    
    
    //根据获取的地理位置，获取位置信息
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    __weak typeof(self)weakself = self;
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> *_Nullable placemarks, NSError * _Nullable error) {
        
        for (CLPlacemark *place in placemarks) {
            
            NSLog(@"name,%@",place.name);                      // 位置名
            
            NSLog(@"thoroughfare,%@",place.thoroughfare);      // 街道
            
            NSLog(@"subThoroughfare,%@",place.subThoroughfare);// 子街道
            
            NSLog(@"locality,%@",place.locality);              // 市
            
            NSLog(@"subLocality,%@",place.subLocality);        // 区
            
            NSLog(@"country,%@",place.country);                // 国家
            
            [UserCacheBean share].userInfo.thoroughfare = place.thoroughfare;
            [UserCacheBean share].userInfo.city = place.locality;
            [UserCacheBean share].userInfo.area = place.subLocality;
            [UserCacheBean share].userInfo.address = place.name;
            [ZSNotification postLocationResultNotification:@{@"address":@""}
             ];
        }
        
    }];
    //    NSLog(@"纬度=%f，经度=%f",self.latitude,self.longitude);
    
    [self.locationManagers stopUpdatingLocation];
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

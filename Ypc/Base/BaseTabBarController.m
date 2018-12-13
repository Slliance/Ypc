//
//  BaseTabBarController.m
//  Ypc
//
//  Created by zhangshu on 2018/12/12.
//  Copyright © 2018 zhangshu. All rights reserved.
//

#import "BaseTabBarController.h"
#import "PsfTabBarItem.h"
#import "HomeController.h"
#import "CircleController.h"
#import "SortController.h"
#import "ShopController.h"
#import "MineController.h"
@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self configureTabBarController];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void) configureTabBarController
{
    self.tabBarController.tabBar.translucent = NO;//去掉透明
    PsfTabBarItem *homeItem;
    PsfTabBarItem *sortItem;
    PsfTabBarItem *circleItem;
    PsfTabBarItem *shopItem;
    PsfTabBarItem *mineItem;
    
    
    [[PsfTabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DSColorFromHex(0x464646), NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:10], NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    [[PsfTabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:10], NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.tabBar.tintColor = DSColorFromHex(0x464646);
    
    homeItem = [[PsfTabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"home_selected"] selectedImage:[UIImage imageNamed:@"home_selected"]];
    homeItem.image = [[UIImage imageNamed:@"home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    
    sortItem = [[PsfTabBarItem alloc]initWithTitle:@"分类" image:[UIImage imageNamed:@"sort_selected"] selectedImage:[UIImage imageNamed:@"sort_selected"]];
    sortItem.image = [[UIImage imageNamed:@"sort_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    sortItem.selectedImage = [UIImage imageNamed:@"sort_selected"];
    circleItem = [[PsfTabBarItem alloc]initWithTitle:@"圈子" image:[UIImage imageNamed:@"circle_selected"] selectedImage:[UIImage imageNamed:@"circle_selected"]];
    circleItem.image = [[UIImage imageNamed:@"circle_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    circleItem.selectedImage = [UIImage imageNamed:@"circle_selected"];
    
    shopItem = [[PsfTabBarItem alloc]initWithTitle:@"购物车" image:[UIImage imageNamed:@"shop_selected"] selectedImage:[UIImage imageNamed:@"shop_selected"]];
    shopItem.image = [[UIImage imageNamed:@"shop_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shopItem.selectedImage = [UIImage imageNamed:@"shop_selected"];
    mineItem = [[PsfTabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"mine_selected"] selectedImage:[UIImage imageNamed:@"mine_selected"]];
    mineItem.image = [[UIImage imageNamed:@"mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineItem.selectedImage = [UIImage imageNamed:@"mine_selected"];
    
    //次日达
    
    HomeController *nextController = [[HomeController alloc]init];
    UINavigationController *nextNavController = [[UINavigationController alloc] initWithRootViewController:nextController];
    nextController.navigationController.navigationBar.translucent = YES;
    nextNavController.tabBarItem = homeItem;
    [self adjustNavigationUI:nextNavController];
    //分类
    SortController *sortController = [[SortController alloc] init];
    UINavigationController *sortNavController = [[UINavigationController alloc] initWithRootViewController:sortController];
    sortController.navigationController.navigationBar.translucent = YES;
    sortNavController.tabBarItem = sortItem;
    [self adjustNavigationUI:sortNavController];
    //圈子
    CircleController *circleController = [[CircleController alloc] init];
    UINavigationController *circleNavController = [[UINavigationController alloc] initWithRootViewController:circleController];
    circleController.navigationController.navigationBar.translucent = YES;
    circleNavController.tabBarItem = circleItem;
    [self adjustNavigationUI:circleNavController];
    
    //购物车
    ShopController *shopController = [[ShopController alloc] init];
    
    UINavigationController *shopNavController = [[UINavigationController alloc] initWithRootViewController:shopController];
    shopController.navigationController.navigationBar.translucent = YES;
    shopNavController.tabBarItem = shopItem;
    [self adjustNavigationUI:shopNavController];
    
    //我
    MineController *myController = [[MineController alloc] init];
    UINavigationController *myNavController = [[UINavigationController alloc] initWithRootViewController:myController];
    myController.navigationController.navigationBar.translucent = YES;
    myNavController.tabBarItem = mineItem;
    [self adjustNavigationUI:myNavController];
    
    self.viewControllers = @[nextNavController,sortNavController,circleNavController,shopNavController, myNavController];
    [self.tabBar setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.selectedIndex = 0;
}
- (void)adjustNavigationUI:(UINavigationController *) nav {
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    nav.navigationBar.translucent = YES;
    [[UINavigationBar appearance] setTintColor:DSColorFromHex(0x464646)];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"icon_back"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_back"]];
    NSShadow *shadow = [[NSShadow alloc] init];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           DSColorFromHex(0x474747), NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    
    //去掉返回按钮上的字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    [UIBarButtonItem appearance].tintColor = [UIColor whiteColor];
    NSArray *viewControllerArray = [self.navigationController viewControllers];
    long previousViewControllerIndex = [viewControllerArray indexOfObject:self] - 1;
    UIViewController *previous;
    if (previousViewControllerIndex >= 0) {
        previous = [viewControllerArray objectAtIndex:previousViewControllerIndex];
        previous.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                     initWithTitle:@""
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:nil];
    }
}
#pragma mark - actions

#pragma mark - tabBarController delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == 0) {
        self.currentIndex = tabBarController.selectedIndex;
    } else if (tabBarController.selectedIndex == 1){
        self.currentIndex = tabBarController.selectedIndex;
    } else if (tabBarController.selectedIndex == 2) {
        self.currentIndex = tabBarController.selectedIndex;
    } else if (tabBarController.selectedIndex == 3) {
        self.currentIndex = tabBarController.selectedIndex;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

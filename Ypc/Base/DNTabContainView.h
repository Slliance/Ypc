//
//  DNTabContainView.h
//  DnaerApp
//
//  Created by 燕来秋 on 2018/11/28.
//  Copyright © 2018 燕来秋. All rights reserved.
//  翻页的view

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ TabSwitchBlock) (NSInteger index);

@protocol DNTabContainViewDelegate <NSObject>

@optional
- (void)willScroll;
- (void)didScrollSwitchIndex:(NSInteger)index;

@end

@interface DNTabContainView : UIView

// 使用pageController翻页
@property (nonatomic, strong) UIPageViewController *pageController;

// 内容页数组
@property (nonatomic, strong) NSArray<UIViewController*> *controllers;

// 当前页索引
@property (nonatomic, assign) NSInteger currentIndex;

// 滑动回调
@property (nonatomic, copy) TabSwitchBlock switchBlock;

// 禁止滑动
@property (nonatomic, assign) BOOL scrollEnabled;

- (void)setTabIndex:(NSInteger)index;
- (void)setTabIndex:(NSInteger)index animated:(BOOL)animated;

- (void)configControllers:(NSMutableArray<UIViewController*>*)controllers index:(NSInteger)index;
- (void)configControllers:(NSMutableArray<UIViewController*>*)controllers parentController:(UIViewController *)parentVC index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

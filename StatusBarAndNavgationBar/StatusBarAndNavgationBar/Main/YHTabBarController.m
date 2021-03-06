//
//  YHTabBarController.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//


#import "YHTabBarController.h"
#import "YHNavgationController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

// Four 文件夹
#import "FourNavigationController.h"
#import "FourOneViewController.h"


@interface YHTabBarController ()

@end

@implementation YHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubControllers];
}

#pragma mark - 设置子控制器
- (void)setupSubControllers {

    OneViewController *oneVC = [OneViewController new];
    oneVC.title = @"One";
    YHNavgationController *oneNav = [[YHNavgationController alloc] initWithRootViewController:oneVC];
    
    TwoViewController *twoVC = [TwoViewController new];
    twoVC.title = @"Two";
    YHNavgationController *twoNav = [[YHNavgationController alloc] initWithRootViewController:twoVC];
    
    ThreeViewController *threeVC = [ThreeViewController new];
    threeVC.title = @"Three";
    YHNavgationController *threeNav = [[YHNavgationController alloc] initWithRootViewController:threeVC];
    
    FourOneViewController *fourVC = [FourOneViewController new];
    fourVC.title = @"four";
    FourNavigationController *fourNav = [[FourNavigationController alloc] initWithRootViewController:fourVC];
    
    self.viewControllers = @[oneNav,twoNav, threeNav, fourNav];
    
}



@end

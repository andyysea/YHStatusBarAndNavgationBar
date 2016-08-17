//
//  YHTabBarController.m
//  UINavigationBarClearColor
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHTabBarController.h"
#import "YHNavigationController.h"
#import "YHViewController.h"
#import "YHSecondViewController.h"

@interface YHTabBarController ()

@end

@implementation YHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
    
}

- (void)addChildViewControllers {
    
    YHViewController *onevc = [[YHViewController alloc] init];
    YHNavigationController *oneNav = [[YHNavigationController alloc] initWithRootViewController:onevc];
    
    YHSecondViewController *twovc = [[YHSecondViewController alloc] init];
    YHNavigationController *twoNav = [[YHNavigationController alloc] initWithRootViewController:twovc];
    

    self.viewControllers = @[oneNav ,twoNav];
 
    onevc.title = @"试试就试试";
    
    twovc.title = @"升级版";
}


@end

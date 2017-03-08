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
    YHNavgationController *oneNav = [[YHNavgationController alloc] initWithRootViewController:oneVC];
    
    
    
    self.viewControllers = @[oneNav];
}



@end

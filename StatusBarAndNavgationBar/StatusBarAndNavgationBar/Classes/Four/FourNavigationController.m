//
//  FourNavigationController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/15.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "FourNavigationController.h"

@interface FourNavigationController ()

@end

@implementation FourNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self setNavigationBarHidden:YES animated:YES];
//    self.navigationBarHidden = YES;
    self.navigationBar.hidden = YES;

    // 当存在tabBarController的情况下,前两种方法隐藏系统导航条,没有拖拽返回功能了
}

@end

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
    // ******也就是说,无论有没有TabBar都遵循以下三点
//    1> 如果是全部使用自定义的导航条,系统的导航条都隐藏了,只有第三种方式支持拖拽返回手势
//    2> 如果当前控制器的系统导航条没有隐藏,不管上一级控制器系统导航条隐藏与否,三种方法都支持拖拽返回
//    3> 如果当前控制器导航条是系统的,上一级是隐藏的,第一种拖拽返回的时候不会出现导航条不会产生刚一拖动导航条就向上消失的情况,另外两种会产生这种情况

}

@end

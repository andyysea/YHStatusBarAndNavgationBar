//
//  YHNavgationController.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHNavgationController.h"

@interface YHNavgationController ()

@end

@implementation YHNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



/**
 *  1> 如果要设置在 push 的时候不需要再设置  hidesBottomBarWhenPushed 只需要实现下面的代码
 *
 *  2> 如果不想实现下面的代码,可以在 baseViewController 中写上一句代码即可 
 *       self.hidesBottomBarWhenPushed = YES;
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
   
    //导航开始初始化的跟控制器不在数组之列,因为初始化的时候还没有push,所以没有压栈
    NSLog(@"---> %zd", self.viewControllers.count);
    if (self.viewControllers.count) { //避免一开始就隐藏了
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

/**
 *  在继承的 NavgationController 中重写 此方法
 *  然后在需要修改状态栏字体颜色的各个控制器中重写下面的方法,如果不重写,那么还是默认的黑色

        - (UIStatusBarStyle)preferredStatusBarStyle {
            return UIStatusBarStyleLightContent;
        }
 */
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}



@end

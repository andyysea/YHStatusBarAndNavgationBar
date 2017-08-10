//
//  YHNavgationController.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHNavgationController.h"

@interface YHNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation YHNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.interactivePopGestureRecognizer.delegate = self;
}

/******** 如果不是自定义的导航栏,直接使用导航控制器的 leftBarButtonItem 改成统一的返回箭头按钮,则会导致左侧边缘拖拽不能反回
 
 解决办法:
    1> 导航控制器设置交互pop手势的代理
         self.interactivePopGestureRecognizer.delegate = self;
    2> 遵守协议
        <UIGestureRecognizerDelegate>
    3> 实现协议方法
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count > 1) {
        return YES;
    }
    return NO;
 }
 
 ************/
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count > 1) {
        return YES;
    }
    return NO;
}



/**
 *  1> 如果要设置在 push 的时候不需要再设置  hidesBottomBarWhenPushed 只需要实现下面的代码
 *
 *  2> 如果不想实现下面的代码,可以在 baseViewController 中写上一句代码即可 
 *       self.hidesBottomBarWhenPushed = YES;
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
   
    //导航开始初始化的跟控制器不在数组之列,因为判断的时候还没有 super,没有导航栏初始化的跟控制器
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

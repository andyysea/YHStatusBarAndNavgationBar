//
//  AppDelegate.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AppDelegate.h"
#import "YHTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YHTabBarController *tab = [[YHTabBarController alloc] init];
    _window.rootViewController = tab;
    [_window makeKeyAndVisible];
    
    /** 
      1.> 如果纯代码同意设置状态栏的前景颜色,需要在 plist中先设置
            View controller-based status bar appearance 设置为 NO
            否则下面这句代码没有用
      2>  但是,一般情况下我们只需要改变某个控制器的状态栏颜色,这种方式设置之后,再改变某个控制器的状态栏颜色之后,暂时还没找到方法
      3>  鉴于以上问题,所以还是直接在导航控制器的子类控制器中实现子控制器的状态栏样式的方法,返回为压栈的顶部控制器,
          再在需要需要改变状态栏前景样式的控制器中实现返回的样式的方法
     */
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
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

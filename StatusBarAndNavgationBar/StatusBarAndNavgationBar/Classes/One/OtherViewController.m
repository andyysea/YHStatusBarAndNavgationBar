//
//  OtherViewController.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()<UITableViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) UIToolbar *toolBar;

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - UIScrollViewDelegate
/**
 *  1> 一般在 push 的时候隐藏了底部的 tabBar
 *  2> 在一个控制器中,一个导航控制器只有一个工具栏和一个导航栏,其中工具栏默认隐藏
 *  3> 为了方便使用,并且Push 和 Pop 的时候跟其他控制器不相互干扰,会自定义添加一个工具栏,而不用导航栏本身的导航栏属性
 *  4> 在滚动隐藏的时候,加一个动画,修改Frame,或者直接平移就可以
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    
    CGPoint point = [pan translationInView:self.view];
    NSLog(@"point --> %@", NSStringFromCGPoint(point));
    
    if (point.y >= 0) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
        [UIView animateWithDuration:.25 animations:^{
            self.toolBar.frame = CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44);
        }];
        
        //        [self.navigationController setToolbarHidden:NO animated:YES];
        //        self.tabBarController.tabBar.hidden = NO;   //比较生硬没有动画
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        [UIView animateWithDuration:.25 animations:^{
            self.toolBar.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 44);
        }];
        
        //        [self.navigationController setToolbarHidden:YES animated:YES];
        //        self.tabBarController.tabBar.hidden = YES; // 比较生硬没有动画
    }
}

#pragma mark - 设置界面元素
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    
    // 添加工具栏--> 或者直接添加一个视图,在视图上面添加自己需要的东西,一般都是聊天框
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44)];
    [toolBar setBarTintColor:[UIColor redColor]];
    
    [self.view addSubview:toolBar];
    
    
    _scrollView = scrollView;
    _toolBar = toolBar;
}



#pragma mark - 呈现样式

/**
 该方法是改变状态栏的前景颜色 --> 具体看 AppDelegate.m 中的说明
 如果设置背景景色,只需要设置导航栏颜色即可.
 如果需要单独设置状态栏的颜色不变,也可以在导航栏上加一个高度为 20 的视图,设置视图的颜色为需要的颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)dealloc {
    NSLog(@"--- dealloc ---");
}


@end




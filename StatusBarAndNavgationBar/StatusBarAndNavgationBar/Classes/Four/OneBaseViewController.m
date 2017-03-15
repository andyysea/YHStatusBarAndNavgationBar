//
//  OneBaseViewController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/15.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "OneBaseViewController.h"

@interface OneBaseViewController ()

@end

@implementation OneBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    [self.view addSubview:navBar];
    
    navBar.barTintColor = [UIColor orangeColor];
    navBar.tintColor = [UIColor whiteColor];
    _navgationBar = navBar;
    
    if (self.navigationController.viewControllers.count > 1) {
        
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 15, 24, 40)];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        [self.navgationBar addSubview:backButton];
        
        _backButton = backButton;
    }
    
}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}


@end

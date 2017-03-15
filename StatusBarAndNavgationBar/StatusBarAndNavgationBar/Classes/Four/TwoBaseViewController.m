//
//  TwoBaseViewController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/15.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "TwoBaseViewController.h"

@interface TwoBaseViewController ()

@end

@implementation TwoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    [self.view addSubview:navBar];
    
    navBar.barTintColor = [UIColor blueColor];
    navBar.tintColor = [UIColor whiteColor];
    _navgationBar = navBar;
    
    
    if (self.navigationController.viewControllers.count > 1) {
        
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 15, 24, 40)];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        [self.navgationBar addSubview:backButton];
        
        _backButton = backButton;
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 30, self.view.bounds.size.width - 240 , 24)];
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    
    _titleLabel = label;
}


- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}



@end

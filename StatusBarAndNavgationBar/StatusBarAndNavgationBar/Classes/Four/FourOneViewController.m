//
//  FourOneViewController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/15.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "FourOneViewController.h"
#import "FourTwoViewController.h"

@interface FourOneViewController ()

@end

@implementation FourOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navgationBar.barTintColor = [UIColor redColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button {
    
    FourTwoViewController *vc = [FourTwoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

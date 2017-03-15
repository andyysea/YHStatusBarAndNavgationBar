//
//  FourTwoViewController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/15.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "FourTwoViewController.h"
#import "FourThreeViewController.h"

@interface FourTwoViewController ()

@end

@implementation FourTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navgationBar.barTintColor = [UIColor lightGrayColor];
    self.titleLabel.text = @"two";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button {
    
    FourThreeViewController *vc = [FourThreeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

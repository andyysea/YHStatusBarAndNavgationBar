//
//  FourThreeViewController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/15.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "FourThreeViewController.h"

@interface FourThreeViewController ()

@end

@implementation FourThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navgationBar.barTintColor = [UIColor darkGrayColor];
    self.titleLabel.text = @"three";
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.frame = CGRectMake(self.view.bounds.size.width - 30, 20, 20, 24);
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button {
    
    self.view.backgroundColor = [UIColor  blackColor];
}

@end

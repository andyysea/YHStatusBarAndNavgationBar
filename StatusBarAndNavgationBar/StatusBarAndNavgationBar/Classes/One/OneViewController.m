//
//  OneViewController.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//


#import "OneViewController.h"
#import "OtherViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - buttonClick
- (void)buttonClick {
    
    OtherViewController *VC = [OtherViewController new];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - 设置界面元素
- (void)setupUI {
    self.title = @"hehhe";
    self.view.backgroundColor = [UIColor blueColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}



@end

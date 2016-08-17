//
//  YHViewController.m
//  UINavigationBarClearColor
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHViewController.h"

#define SCWidth [UIScreen mainScreen].bounds.size.width
#define SCHight [UIScreen mainScreen].bounds.size.height

static NSString *cellId = @"cellId";

@interface YHViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIView *backgroudView;

@end

@implementation YHViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置界面 */
    [self setupUI];

    /** 设置导航条 */
    [self setNav];
    
}

#pragma mark - 设置导航栏
- (void)setNav {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"哈哈" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_changeCity_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    
    // 设置初始导航栏透明色
    [self setNavBarBackgroudColor:[UIColor clearColor]];
}

/**
    导航栏设置初始颜色方法
 */
- (void)setNavBarBackgroudColor:(UIColor *)backgroudColor {
    
    // 设置背景颜色为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCWidth, 64)];
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.navigationController.navigationBar insertSubview:v atIndex:0];
    
    // 取消导航栏下面的黑线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
    _backgroudView = v;
}









#pragma mark - 导航栏右边按钮监听方法
/** 点击右边item */
- (void)itemClick {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.view.backgroundColor = [UIColor blueColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - UITableViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIColor *color = [UIColor redColor];
    
//    CGFloat OFF = scrollView.contentInset.top;
//    CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"%f - %f", OFF, offsetY);   // 起点 -64
    
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    if (offset > 20) {
        CGFloat alpha = MIN(1,  (offset - 20) / 64);
        _backgroudView.backgroundColor = [color colorWithAlphaComponent:alpha];
    } else {
        
        _backgroudView.backgroundColor = [color colorWithAlphaComponent:0];
    }
    
//    CGFloat alpha = 1 - ((64 - offset) / 64);
 
//    NSLog(@"%f", alpha);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@", @(indexPath.section).description,@(indexPath.row).description];
                           
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
    return @(section).description;
}



#pragma mark - 设置界面
- (void)setupUI {
    
    UITableView *tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tabView];
    
    tabView.rowHeight = 100;
    [tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    tabView.dataSource = self;
    tabView.delegate = self;
    
    /** 设置表头视图 */
    UIView *hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCWidth, 190)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -64, SCWidth, 254)];
    imageView.image = [UIImage imageNamed:@"bg.jpg"];
    [hearView addSubview:imageView];
    
    tabView.tableHeaderView = hearView;
}





@end

//
//  TwoViewController.m
//  StatusBarAndNavgationBar
//
//  Created by 杨应海 on 16/8/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoOtherViewController.h"

static NSString *cellId = @"cellId";

@interface TwoViewController ()<UITableViewDataSource, UITableViewDelegate>

/** 状态栏添加背景视图 */
@property (nonatomic, weak) UIView *statusBgView;
/** 导航栏添加背景视图 */
@property (nonatomic, weak) UIView *navBgView;

/** 颜色设置 */
@property (nonatomic, strong) UIColor *statusBgViewColor;
@property (nonatomic, strong) UIColor *navBgViewColor;

/** 控制状态栏显示前景颜色 */
@property (nonatomic, assign) BOOL IsLight;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    [self setupUI];
    self.IsLight = NO;
    // 先走的返回导航栏前景颜色方法, 然后才进此方法,所以要调用这句代码
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - 返回导航栏的前景颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.IsLight ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}


#pragma mark - UITableViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.statusBgViewColor == nil || self.navBgViewColor == nil) {
        self.statusBgViewColor = [UIColor redColor];
        self.navBgViewColor = [UIColor whiteColor];
    }
    
    // 下面的两个加起来值 为 0
    CGFloat offsetY = scrollView.contentInset.top + scrollView.contentOffset.y;
    NSLog(@"%f,%f,%f",offsetY,scrollView.contentOffset.y,scrollView.contentInset.top);
    // 计算和设置透明度 --> 为了效果更好,在将要回到最初位置已经完全显示为透明,所以要设置上拉一定间距的时候在开始渐变,其他滚动范围都是透明的效果
    if (offsetY >= 20) {
        CGFloat alpha = MIN(1, (offsetY - 20) / 64);
        
        self.statusBgView.backgroundColor = [self.statusBgViewColor colorWithAlphaComponent:alpha];
        self.navBgView.backgroundColor = [self.navBgViewColor colorWithAlphaComponent:alpha];
     
        if (alpha == 1) {
            self.IsLight = YES;
            [self setNeedsStatusBarAppearanceUpdate];
        }
    } else {
        self.statusBgView.backgroundColor = [self.statusBgViewColor colorWithAlphaComponent:0];
        self.navBgView.backgroundColor = [self.navBgViewColor colorWithAlphaComponent:0];

        if (self.IsLight) {
            self.IsLight = NO;
            [self setNeedsStatusBarAppearanceUpdate];
        }
    }
    
    
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


#pragma mark - 导航栏右侧item点击方法
- (void)rightBarButtonItemClick {
    
    TwoOtherViewController *vc = [[TwoOtherViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 设置导航栏
- (void)setupNav {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"呵呵" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBarButtonItemClick)];
    
    // 1> 设置导航栏背景颜色为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    // 2> 设置导航栏下面的黑线图片为影藏状态,用下面一句代码
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    // 3> 在导航栏添加两个视图--> 作为 滚动动态改变 状态栏 和 导航栏的背景颜色的视图
    // 状态栏的视图可以直接添加,导航栏的视图必须插入,
    // ******** 这就只添加一个大图,全部覆盖背景面积
    // a. 状态栏视图可以直接添加
    UIView *statusBgView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, Width_Screen, 20)];
    [self.navigationController.navigationBar addSubview:statusBgView];
    // b.导航栏视图防止覆盖要插入最底部
    UIView *navBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width_Screen, 44)];
    [self.navigationController.navigationBar insertSubview:navBgView atIndex:0];
    
    
    // 属性记录
    _statusBgView = statusBgView;
    _navBgView = navBgView;
}

#pragma mark - 设置界面元素
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView *tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tabView];
    
    tabView.rowHeight = 100;
    [tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    tabView.dataSource = self;
    tabView.delegate = self;
    
    /** 设置表头视图 */
    UIView *hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width_Screen, 200)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width_Screen, 200)];
    imageView.image = [UIImage imageNamed:@"bg.jpg"];
    [hearView addSubview:imageView];
    
    tabView.tableHeaderView = hearView;

}






@end






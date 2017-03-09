//
//  ThreeViewController.m
//  StatusBarAndNavgationBar
//
//  Created by junde on 2017/3/9.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "ThreeViewController.h"
#import "UINavigationBar+YYH.h"

static NSString *cellId = @"cellId";

@interface ThreeViewController ()<UITableViewDelegate, UITableViewDataSource>

/** 表格视图 */
@property (nonatomic, weak) UITableView *tableView;
/**
 *  是否需要提示，默认yes
 */
@property (nonatomic, assign) BOOL isNeedTip;
/**
 *  提示内容视图
 */
@property (nonatomic, weak) UIView *contentView;
/** 提示视图 */
@property (nonatomic, weak) UIView *tipView;


@end

@implementation ThreeViewController
#pragma mark - 视图生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setNav];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 这里不能让直接设置透明色， 当下一级控制器返回的时候，如果这个控制器导航条是有颜色的，要跳转前后保持一致
    //    [self.navigationController.navigationBar yh_setNavBarTintColor:[UIColor clearColor]];
    // **** 解决办法，主动调用滚动视图的方法,, 这样就可以根据当时的 contentOffset.y 判断了
    [self scrollViewDidScroll:_tableView];
}
- (void)viewDidAppear:(BOOL)animated {
    // 这里重新设置的原因 --> 解决拖拽返回时，导航栏颜色没有变透明
        [self.navigationController.navigationBar yh_setNavBarTintColor:[UIColor clearColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 设置恢复导航栏的，下一个控制器导航栏不是透明的
    [self.navigationController.navigationBar yh_resetNavBarTintColor];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


#pragma mark - 设置导航条
- (void)setNav {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_changeCity_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemClick)];
    // 设置需要提示默认值
    _isNeedTip = YES;
    
    // 设置导航条初始的颜色为透明色
    [self.navigationController.navigationBar yh_setNavBarTintColor:[UIColor clearColor]];
    
}
/**
 *  导航条右边barbuttonItem 监听方法
 */
- (void)buttonItemClick {
    
    if (_isNeedTip) {
        /**
         ******* 这个分支里面的控件每次点的时候都会动态创建，不停的删除创建，
         最好使用懒加载******* 这里就暂时不用了
         */
        
        UIView *contentView = [[UIView alloc] initWithFrame:self.view.bounds];
        contentView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
        [self.view addSubview:contentView];
        
        // 给contentView 添加一个点按手势
        UITapGestureRecognizer *gestureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(recongnizerTap)];
        [contentView addGestureRecognizer:gestureTap];
        
        UIView *tipView = [[UIView alloc] init];
        tipView.frame = CGRectMake(0, 0, 200, 150);
        tipView.backgroundColor = [UIColor yellowColor];
        tipView.center = contentView.center;
        [contentView addSubview:tipView];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"哈哈";
        [label sizeToFit];
        label.center = CGPointMake(tipView.bounds.size.width * 0.5, tipView.bounds.size.height * 0.5);
        [tipView addSubview:label];
        
        tipView.transform = CGAffineTransformMakeScale(.01, 0.01);
        [UIView animateWithDuration:.25 animations:^{
            tipView.transform = CGAffineTransformIdentity;
        }];
        
        // 设置不是提示
        _isNeedTip = NO;
        _contentView = contentView;
        _tipView = tipView;
    } else {
        
        [self removeTipView];
    }
}

/**
 点按手势监听方法
 */
- (void)recongnizerTap {
    [self removeTipView];
}

/**
 删除提示视图
 */
- (void)removeTipView {
    [UIView animateWithDuration:.25 animations:^{
        self.tipView.transform = CGAffineTransformMakeScale(.01, .01);
    } completion:^(BOOL finished) {
        
        [_contentView removeFromSuperview];
        // 设置恢复提示
        _isNeedTip = YES;
    }];
}


#pragma mark - UITableViewDelegate

/**
 滚动设置导航条颜色
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 取消了控制器对tableView的缩进，所以从 0 开始
    //    NSLog(@"%f",    scrollView.contentOffset.y);
    
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 30) {
        // 上拉
        CGFloat alpha = (offsetY - 30) / 64;
        alpha = MIN(alpha, 1);
        [self.navigationController.navigationBar yh_setNavBarTintColor:[[UIColor greenColor] colorWithAlphaComponent:alpha]];
        
    } else {
        // 下拉
        [self.navigationController.navigationBar yh_setNavBarTintColor:[UIColor clearColor]];
    }
    
}


/**
 跳转控制器
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *VC = [[UIViewController alloc] init];
    VC.view.backgroundColor = [UIColor redColor];
    VC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:VC animated:YES];
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
    self.title = @"Three";
    // 禁用控制器对 Scrollview 的缩进
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.rowHeight = 100;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    /** 设置表头视图 */
    UIView *hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width_Screen, 254)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:hearView.bounds];
    imageView.image = [UIImage imageNamed:@"bg.jpg"];
    [hearView addSubview:imageView];
    
    tableView.tableHeaderView = hearView;
    
    _tableView = tableView;
}



@end

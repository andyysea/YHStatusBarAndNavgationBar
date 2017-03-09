//
//  UINavigationBar+YYH.m
//  UINavigationBarClearColor
//
//  Created by 杨应海 on 16/8/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "UINavigationBar+YYH.h"
#import <objc/runtime.h>

@implementation UINavigationBar (YYH)

#pragma mark - 关联属性的setter和getter方法
/**
 //利用静态变量地址唯一不变的特性
 1、static void *strKey = &strKey;
 2、static NSString *strKey = @"strKey";
 3、static char strKey;
 
 void * 相当于 id
 */
static void *overlayKey = @"overlayKey";

- (void)setOverlayView:(UIView *)overlayView {
    
    objc_setAssociatedObject(self, overlayKey, overlayView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)overlayView {
    return objc_getAssociatedObject(self, overlayKey);
}

#pragma mark - 设置导航条的透明色变化
/** 设置导航条背景颜色为透明色，并且可以根据滚动变化颜色 */
- (void)yh_setNavBarTintColor:(UIColor *)barTintColor {
    
    if (!self.overlayView) {
        // 设置导航条透明图片
        [self  setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        // 设置导航下的黑线为空
        [self setShadowImage:[UIImage new]];
        self.overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.overlayView.userInteractionEnabled = NO;
        self.overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlayView atIndex:0];
    }
    self.overlayView.backgroundColor = barTintColor;
}

#pragma mark 恢复导航条颜色
- (void)yh_resetNavBarTintColor {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlayView removeFromSuperview];
    self.overlayView = nil;
}






#pragma mark 设置导航条平移
/** tableView 滚动的时候可以让导航栏跟着滚 */
- (void)yh_setTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

#pragma mark 设置导航条滚动的时候标题和左右视图的透明渐变效果
/** 设置导航条中 ‘视图’的透明渐变效果 */
- (void)yh_setElementsAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}


@end

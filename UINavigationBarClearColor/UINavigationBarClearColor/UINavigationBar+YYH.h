//
//  UINavigationBar+YYH.h
//  UINavigationBarClearColor
//
//  Created by 杨应海 on 16/8/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (YYH)

/** 
 关联属性
 导航条底部的覆盖视图，用来调节变化的颜色
 */
@property (nonatomic, strong) UIView *overlayView;

/** 设置导航条背景颜色为透明色，并且可以根据滚动变化颜色 */
- (void)yh_setNavBarTintColor:(UIColor *)barTintColor;

/** 恢复导航条颜色 */
- (void)yh_resetNavBarTintColor;

/** 可以设置导航条偏移y */
- (void)yh_setTranslationY:(CGFloat)translationY;

/** 设置导航条滚动的时候标题和左右视图的透明渐变效果 */
- (void)yh_setElementsAlpha:(CGFloat)alpha;

@end

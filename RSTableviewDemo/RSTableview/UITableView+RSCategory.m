//
//  UITableView+RSCategory.m
//  RSTableviewDemo
//
//  Created by Resory on 15/12/27.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "UITableView+RSCategory.h"
#import <objc/runtime.h>

static char rsTipsViewKey;

@implementation UITableView (RSCategory)


#pragma mark -
#pragma mark - Setter
- (void)setRs_tipsView:(UIView *)rs_tipsView
{
    objc_setAssociatedObject(self, &rsTipsViewKey, rs_tipsView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    rs_tipsView.center = self.center;
    [self addSubview:rs_tipsView];
}

#pragma mark -
#pragma mark - Getter
- (UIView *)rs_tipsView
{
    return objc_getAssociatedObject(self, &rsTipsViewKey);
}

#pragma mark -
#pragma mark -  Action
- (void)showTipsView
{
    
}

- (void)hideTipsView
{
    
}



#pragma mark -
#pragma mark - Useful Function (常用方法)

// Tableview分割线偏移量
- (void)rs_setSeparatorInsetWithCell:(UITableViewCell *)cell andEdgeInsets:(UIEdgeInsets)insets
{
    if([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self setSeparatorInset:insets];
    }
    
    if([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self setLayoutMargins:insets];
    }

    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:insets];
    }
}



@end

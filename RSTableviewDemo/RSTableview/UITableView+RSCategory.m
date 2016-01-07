//
//  UITableView+RSCategory.m
//  RSTableviewDemo
//
//  Created by Resory on 15/12/27.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "UITableView+RSCategory.h"
#import <objc/runtime.h>

#define RS_SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                 //屏幕宽度
#define RS_SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                //屏幕长度

static char RSTipViewKey;

@implementation UITableView (RSCategory)

#pragma mark -
#pragma mark - Getter
- (UIView *)rs_tipView
{
    return objc_getAssociatedObject(self, &RSTipViewKey);
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

#pragma mark -
#pragma mark -  Note Action
// 显示提示页面(无数据，超时等等)
- (void)showTipsViewWithNote:(NSString *)note
{
    if(self.rs_tipView)
    {
        self.rs_tipView.rs_note = note;
    }
    else
    {
        UIView *tView = [[RSTipsView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        objc_setAssociatedObject(self, &RSTipViewKey, tView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.rs_tipView.center = self.center;
        self.rs_tipView.rs_note = note;
        [self addSubview:self.rs_tipView];
    }
}







@end

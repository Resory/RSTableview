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
static char RSTapTipViewBlockKey;

@implementation UITableView (RSCategory)

#pragma mark -
#pragma mark - Setter
- (void)setRs_tapTipViewBlock:(RSTapTipViewBlock)rs_tapTipViewBlock
{
    objc_setAssociatedObject(self, &RSTapTipViewBlockKey,
                             rs_tapTipViewBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -
#pragma mark - Getter
- (UIView *)rs_tipView
{
    return objc_getAssociatedObject(self, &RSTipViewKey);
}

- (RSTapTipViewBlock)rs_tapTipViewBlock
{
    return objc_getAssociatedObject(self, &RSTapTipViewBlockKey);
}


#pragma mark -
#pragma mark - Useful Function
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
#pragma mark -  Action
// 显示提示页面(无数据，超时等等)
- (void)rs_showTipViewWithNote:(NSString *)note
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
        self.rs_tipView.delegate = self;
        [self addSubview:self.rs_tipView];
    }
    
    self.rs_tipView.hidden = NO;
}

// 隐藏提示页面
- (void)rs_dimissTipView
{
    self.rs_tipView.hidden = YES;
}


#pragma mark -
#pragma mark - RSTipView Protocal
// 点击RSTipsView
- (void)rs_tapTipView
{
    [self rs_dimissTipView];
    
    self.rs_tapTipViewBlock(@"");
}






@end

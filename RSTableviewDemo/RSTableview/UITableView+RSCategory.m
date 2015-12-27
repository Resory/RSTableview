//
//  UITableView+RSCategory.m
//  RSTableviewDemo
//
//  Created by Resory on 15/12/27.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "UITableView+RSCategory.h"

@implementation UITableView (RSCategory)

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

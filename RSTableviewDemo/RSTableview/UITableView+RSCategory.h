//
//  UITableView+RSCategory.h
//  RSTableviewDemo
//
//  Created by Resory on 15/12/27.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (RSCategory)

@property (nonatomic, strong) UIView *rs_noteView;       // 提示页面

/**
 *  Tableview分割线偏移量
 *
 *  @param cell   cell
 *  @param insets 偏移量
 */
- (void)rs_setSeparatorInsetWithCell:(UITableViewCell *)cell andEdgeInsets:(UIEdgeInsets)insets;

@end
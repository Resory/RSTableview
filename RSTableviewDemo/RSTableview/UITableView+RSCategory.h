//
//  UITableView+RSCategory.h
//  RSTableviewDemo
//
//  Created by Resory on 15/12/27.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSTipsView.h"

@interface UITableView (RSCategory)

@property (nonatomic, strong, readonly) RSTipsView *rs_tipView;       // 提示页面

/**
 *  Tableview分割线偏移量
 *
 *  @param cell   cell
 *  @param insets 偏移量
 */
- (void)rs_setSeparatorInsetWithCell:(UITableViewCell *)cell andEdgeInsets:(UIEdgeInsets)insets;

/**
 *  显示提示页面(无数据，超时等等)
 *
 *  @param note 提示文字
 */
- (void)showTipsViewWithNote:(NSString *)note;

@end

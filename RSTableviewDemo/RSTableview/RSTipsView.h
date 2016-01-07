//
//  RSTipsView.h
//  RSTableviewDemo
//
//  Created by Resory on 16/1/3.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RSClickTipViewBlock)();       // 点击提示页面回调block

@interface RSTipsView : UIView

@property (nonatomic, strong) NSString *rs_note;                            // 提示文字
@property (nonatomic, assign) RSClickTipViewBlock rs_clickNoteViewBlock;

@end

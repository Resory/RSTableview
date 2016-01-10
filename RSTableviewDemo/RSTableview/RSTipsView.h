//
//  RSTipsView.h
//  RSTableviewDemo
//
//  Created by Resory on 16/1/3.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RSTipViewProtocal <NSObject>

- (void)rs_tapTipView;

@end

@interface RSTipsView : UIView

@property (nonatomic, strong) NSString *rs_note;                            // 提示文字
@property (nonatomic, assign) id<RSTipViewProtocal> delegate;               // 点击SelfView的代理方法

@end

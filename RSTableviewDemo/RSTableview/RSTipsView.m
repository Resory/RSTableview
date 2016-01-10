//
//  RSTipsView.m
//  RSTableviewDemo
//
//  Created by Resory on 16/1/3.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RSTipsView.h"

@interface RSTipsView ()

@property (nonatomic, strong) UILabel *rs_noteLable;     // 提示页面

@end

@implementation RSTipsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self configNoteLable];
        [self configSelfView];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Setter 
- (void)setRs_note:(NSString *)rs_note
{
    if(rs_note.length > 0)
    {
        self.rs_noteLable.text = rs_note;
    }
}

#pragma mark -
#pragma mark -  config

// 初始化 提示语句lable
- (void)configNoteLable
{
    self.rs_noteLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    self.rs_noteLable.center = self.center;
    self.rs_noteLable.backgroundColor = [UIColor orangeColor];
    self.rs_noteLable.font = [UIFont systemFontOfSize:14.0];
    self.rs_noteLable.textColor = [UIColor blackColor];
    self.rs_noteLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.rs_noteLable];
}

// 初始化 SelfView
- (void)configSelfView
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapSelfView)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

#pragma mark -
#pragma mark - Action
// 点击 SelfView
- (void)tapSelfView
{
    if([self.delegate respondsToSelector:@selector(rs_tapTipView)])
    {
        [self.delegate rs_tapTipView];
    }
}


@end

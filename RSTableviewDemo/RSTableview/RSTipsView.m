//
//  RSTipsView.m
//  RSTableviewDemo
//
//  Created by Resory on 16/1/3.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RSTipsView.h"

@interface RSTipsView ()

@property (nonatomic, strong) UIButton *rs_noteBtn;     // 提示页面

@end

@implementation RSTipsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.rs_noteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
        self.rs_noteBtn.center = self.center;
        self.rs_noteBtn.backgroundColor = [UIColor orangeColor];
        self.rs_noteBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.rs_noteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.rs_noteBtn addTarget:self action:@selector(clickNoteBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rs_noteBtn];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Setter 
- (void)setRs_note:(NSString *)rs_note
{
    if(rs_note.length > 0)
    {
        [self.rs_noteBtn setTitle:rs_note forState:UIControlStateNormal];
    }
}

#pragma mark -
#pragma mark - Action
- (void)clickNoteBtn
{
    self.rs_clickNoteViewBlock();
}

@end

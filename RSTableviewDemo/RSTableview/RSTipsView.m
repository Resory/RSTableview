//
//  RSTipsView.m
//  RSTableviewDemo
//
//  Created by Resory on 16/1/3.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RSTipsView.h"

@interface RSTipsView ()

@property (nonatomic, strong) UILabel *contentView;

@end

@implementation RSTipsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.contentView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        self.contentView.text = @"无网络状态";
        self.contentView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.contentView];
    }
    
    return self;
}

@end

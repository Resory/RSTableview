//
//  RSTableViewController.m
//  RSTableviewDemo
//
//  Created by billionsfinance-resory on 16/1/7.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RSTableViewController.h"
#import "UITableView+RSCategory.h"
#import <MJRefresh/MJRefresh.h>

@interface RSTableViewController ()

@property (nonatomic, strong) NSArray *serverData;

@end

@implementation RSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configTableview];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark -  Config
// 初始化 tableview
- (void)configTableview
{
    self.tableView.tableFooterView = [UIView new];
    [self.tableView addLegendHeaderWithRefreshingTarget:self
                                       refreshingAction:@selector(sendRequestToServer)];
    
    __weak RSTableViewController *weakself = self;
    self.tableView.rs_tapTipViewBlock = ^(id obj){
        [weakself.tableView.header beginRefreshing];
    };
}

// 初始化 serverData
- (void)configServerData
{
    self.serverData = @[@"test one",@"test two"];
}

#pragma mark -
#pragma mark - Tableview Func
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _serverData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView rs_setSeparatorInsetWithCell:cell andEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}


#pragma mark -
#pragma mark - Action
// 发起网络请求
- (void)sendRequestToServer
{
    [self performSelector:@selector(delayAction) withObject:nil afterDelay:2.0];
}

// 延迟操作
- (void)delayAction
{
    NSLog(@"delayation");
    
    if(self.serverData.count == 0 )
    {
        [self.tableView rs_showTipViewWithNote:@"无数据!"];
    }
    // tableView停止转动
    [self.tableView.header endRefreshing];
}

@end

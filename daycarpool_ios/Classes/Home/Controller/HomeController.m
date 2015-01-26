//
//  HomeController.m
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "HomeController.h"
#import "MJRefresh.h"
@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //如果未登录

    
    // 1.设置标题
    UIView *customTitleView = [[UIView alloc]init];
    NSInteger customTitleViewW = self.view.frame.size.width/2;
    NSInteger customTitleViewH = 40;
    customTitleView.frame = CGRectMake(0, 0, customTitleViewW, customTitleViewH);
//    customTitleView.backgroundColor = [UIColor redColor];
    UIButton *titleButton = [[UIButton alloc]init];
    [titleButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [titleButton setTitle:@"北京 ⇄ 香河" forState:UIControlStateNormal];
    UIFont *font = [UIFont boldSystemFontOfSize:20];//加粗
    [titleButton.titleLabel setFont:font];
    titleButton.frame = CGRectMake(customTitleViewW/2 - 120/2, customTitleViewH / 2 - 20, 120, customTitleViewH);
    [titleButton addTarget:self action:@selector(buttonTitleAction:) forControlEvents:UIControlEventTouchUpInside];
    [customTitleView addSubview:titleButton];
    self.navigationItem.titleView = customTitleView;
    //右面的按钮
    UIButton *rightButton = [[UIButton alloc]init];
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"shaixuan.png"] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    //添加下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //自动刷新一次
    [self.tableView headerBeginRefreshing];
    //上拉加载更多
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    //设置加载时的标题
    self.tableView.headerPullToRefreshText = @"继续下拉可刷新";
    self.tableView.headerReleaseToRefreshText = @"松开刷新";
    self.tableView.headerRefreshingText = @"正在刷新..";
    
    self.tableView.footerPullToRefreshText = @"继续上拉可刷新";
    self.tableView.footerReleaseToRefreshText = @"松开刷新";
    self.tableView.footerRefreshingText = @"正在刷新..";
}
-(void)buttonTitleAction:(UIButton *)sender{
    MyLog(@"点击了标题");
}
-(void)footerRereshing{
    double delayInSeconds = 3.0f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    });
}
-(void)headerRereshing{
    double delayInSeconds = 3.0f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView reloadData];
        [self.tableView headerEndRefreshing];
    });
}
- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 181;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *homeTableCellId = @"HomeTalCell";
    HomeTabCell *cell = (HomeTabCell *)[self.tableView dequeueReusableCellWithIdentifier:homeTableCellId];
    if(cell == nil){
        NSArray *marray = [[NSBundle mainBundle] loadNibNamed:@"HomeTabCell" owner:self options:nil];
        cell = [marray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}


@end

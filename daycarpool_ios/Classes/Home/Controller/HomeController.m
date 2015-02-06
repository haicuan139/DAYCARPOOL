//
//  HomeController.m

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
    //开启定位
    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = 1;
//    [self.view addSubview:self.mapView];
    self.title = @"首页";
    // 1.设置标题
    UIView *customTitleView = [[UIView alloc]init];
    NSInteger customTitleViewW = self.view.frame.size.width/2;
    NSInteger customTitleViewH = 40;
    customTitleView.frame = CGRectMake(0, 0, customTitleViewW, customTitleViewH);
    UIButton *titleButton = [[UIButton alloc]init];
    [titleButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [titleButton setTitle:@"北京 ⇄ 香河" forState:UIControlStateNormal];
    UIFont *font = [UIFont boldSystemFontOfSize:20];//加粗
    [titleButton.titleLabel setFont:font];
    titleButton.frame = CGRectMake(customTitleViewW/2 - 120/2, customTitleViewH / 2 - 20, 120, customTitleViewH);
    [titleButton addTarget:self action:@selector(buttonTitleAction:) forControlEvents:UIControlEventTouchUpInside];
    //向下的箭头
    UIButton *downArrowButton = [[UIButton alloc]init];
    [downArrowButton setImage:[UIImage imageNamed:@"arrowdown.png"] forState:UIControlStateNormal];
    downArrowButton.frame =CGRectMake(customTitleView.frame.size.width - 23, customTitleViewH / 2 - 12/2 , 12, 12);
    
    [customTitleView addSubview:titleButton];
    [customTitleView addSubview:downArrowButton];
    self.navigationItem.titleView = customTitleView;
    //右面的按钮
    UIButton *rightButton = [[UIButton alloc]init];
    [rightButton addTarget:self action:@selector(filtrateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0, 0, 21, 21);
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
-(void)filtrateButtonAction:(UIButton *)sender{
    //跳转筛选界面
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"shaixuan" bundle:nil];
    UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"FiltrateViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
-(void)buttonTitleAction:(UIButton *)sender{
    MyLog(@"点击了标题");
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"PinDao" bundle:nil];
    UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"PinDaoTableViewController"];
    [self.navigationController pushViewController:controller animated:YES];
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
    UIColor* color=[UIColor colorWithHexString:@"#E3E3E3"];
    HomeTabCell *cell = (HomeTabCell *)[self.tableView dequeueReusableCellWithIdentifier:homeTableCellId];
    if(cell == nil){
        NSArray *marray = [[NSBundle mainBundle] loadNibNamed:@"HomeTabCell" owner:self options:nil];
        cell = [marray objectAtIndex:0];
    }
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor=color;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了");
    // 取消选中状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma -mark 地图定位回调,刷新当前经纬度
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        self.mapView.showsUserLocation = NO;
    }
}
@end

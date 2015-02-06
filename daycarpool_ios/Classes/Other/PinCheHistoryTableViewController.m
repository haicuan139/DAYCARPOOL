//
//  PinCheHistoryTableViewController.m
//  daycarpool_ios
//
//  Created by haicuan139 on 15-2-6.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import "PinCheHistoryTableViewController.h"

@interface PinCheHistoryTableViewController ()

@end

@implementation PinCheHistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的发布";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"车找人去北京";
    UILabel *addrLable = [[UILabel alloc]init];
    addrLable.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width - 10, cell.frame.size.height);
    addrLable.text = @"2014年12月12日";
    [addrLable setFont:[UIFont fontWithName:nil size:13]];
     [addrLable setTextColor:[UIColor grayColor]];
    [addrLable setTextAlignment:NSTextAlignmentRight];
    [cell.contentView addSubview:addrLable];
    return cell;
//     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//     
//     return cell;
    
}




@end

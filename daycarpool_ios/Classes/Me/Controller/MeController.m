//
//  MeController.m
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MeController.h"
#import "MeHeaderCell.h"
@interface MeController ()

@end

@implementation MeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView setst]
    // 1.设置标题
    self.title = @"我是乘客";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (indexPath.section == 0) {
        return  100;
    }
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0) {
        return 1;
    }
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        static NSString *homeTableCellId = @"MeHeaderCell";
        MeHeaderCell *cell = (MeHeaderCell *)[self.tableView dequeueReusableCellWithIdentifier:homeTableCellId];
        if(cell == nil){
            NSArray *marray = [[NSBundle mainBundle] loadNibNamed:@"MeHeaderCell" owner:self options:nil];
            cell = [marray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
        
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        cell.textLabel.text = @"测试";
        return cell;
    }
}

@end

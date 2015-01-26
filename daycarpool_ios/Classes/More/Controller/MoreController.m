//
//  MoreController.m
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MoreController.h"

@interface MoreController ()

@end

@implementation MoreController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置标题
    self.title = @"更多";
    // 2.背景颜色
    self.view.backgroundColor = [UIColor brownColor];
    // 3.设置右上角按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
@end

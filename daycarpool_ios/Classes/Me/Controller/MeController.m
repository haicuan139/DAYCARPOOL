//
//  MeController.m

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
    // 1.设置标题
    self.title = @"我是乘客";
    //初始化tab数据
    SBJsonParser    *parser     = [[SBJsonParser alloc] init];
    NSString *typeJson = @"chengke_tableview_json";
    NSString *path = [[NSBundle mainBundle] pathForResource:typeJson ofType:@"json"];
    NSError *error=nil;
    NSString *str=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSDictionary    *rootDic = [parser objectWithString:str];
    _dataArray = [rootDic objectForKey:@"rows"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

    UIColor* color=[UIColor colorWithHexString:@"#E3E3E3"];
    if (indexPath.section == 0) {
        static NSString *homeTableCellId = @"MeHeaderCell";
        MeHeaderCell *cell = (MeHeaderCell *)[self.tableView dequeueReusableCellWithIdentifier:homeTableCellId];
        if(cell == nil){
            NSArray *marray = [[NSBundle mainBundle] loadNibNamed:@"MeHeaderCell" owner:self options:nil];
            cell = [marray objectAtIndex:0];
        }

        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor=color;
        return cell;
        
    } else {
        
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        UIView *selectedBgView = [[UIView alloc]initWithFrame:cell.frame];
        cell.selectedBackgroundView = selectedBgView;
        cell.selectedBackgroundView.backgroundColor=color;

        NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
        NSString *title = [dic objectForKey:@"title"];
        NSString *icon = [dic objectForKey:@"icon"];
        cell.textLabel.text = title;
        [cell.imageView setImage:[UIImage imageNamed:icon]];
        if (indexPath.section == 1 && indexPath.row == 1) {
            //如果有版本更新，添加一个红色的提示
            CGFloat w = 10;
            CGFloat h = 10;
            CGFloat x = cell.frame.size.width / 2 - (cell.frame.size.width / 8);
            CGFloat y = cell.frame.size.height/2 - w/3;
            UIView *uView = [[UIView alloc]init];
            uView.frame = CGRectMake(x,y , w, h);
            uView.layer.masksToBounds = YES;
            uView.layer.cornerRadius = 5;
            uView.backgroundColor = [UIColor redColor];
            uView.userInteractionEnabled = YES;
            [cell.contentView addSubview:uView];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 && indexPath.row == 0) {
        //个人信息编辑
        UIStoryboard* st = [UIStoryboard storyboardWithName:@"myinfo" bundle:nil];
        UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"MyInfoTableViewController"];

        [self.navigationController pushViewController:controller animated:YES];
        
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        //意见反馈
        [self presentModalViewController:[UMFeedback feedbackModalViewController]
                                animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 0){
        //我的发布
        UIStoryboard* st = [UIStoryboard storyboardWithName:@"pinchehistory" bundle:nil];
        UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"PinCheHistoryTableViewController"];
        
        [self.navigationController pushViewController:controller animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 3){
        //关于我们
        UIStoryboard* st = [UIStoryboard storyboardWithName:@"about" bundle:nil];
        UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"AboutViewController"];
        
        [self.navigationController pushViewController:controller animated:YES];
    }
}
@end

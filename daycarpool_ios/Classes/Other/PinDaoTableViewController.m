//
//  PinDaoTableViewController.m
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-27.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import "PinDaoTableViewController.h"

@interface PinDaoTableViewController ()

@end

@implementation PinDaoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"频道列表";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    UIBarButtonItem *rightIitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPathButtonAction:)];
//    self.navigationItem.rightBarButtonItem = rightIitem;

}
-(void)addPathButtonAction:(UIButton *)sender{
    NSLog(@"添加路线");
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"AddPath" bundle:nil];
    UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"AddPathViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}
- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 1) {
        return 100;
    }
    
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 1;
    }
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了");
    // 取消选中状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建分隔线

    if (indexPath.section == 0) {

        static NSString *homeTableCellId = @"PinDaoCell";
        UIColor* color=[UIColor colorWithHexString:@"#E3E3E3"];
        PinDaoCell *cell = (PinDaoCell *)[self.tableView dequeueReusableCellWithIdentifier:homeTableCellId];
        if(cell == nil){
            NSArray *marray = [[NSBundle mainBundle] loadNibNamed:@"PinDaoCell" owner:self options:nil];
            cell = [marray objectAtIndex:0];
        }
        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor=color;
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"#E0DFE2"];
        line.frame = CGRectMake(10, cell.frame.size.height - 0.5f, cell.frame.size.width, 0.5f);
        [cell addSubview:line];
        return cell;
    } else {

        UITableViewCell *cell = [[UITableViewCell alloc]init];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.backgroundColor = [UIColor colorWithHexString:@"#00000000"];
        //创加你添加路线的View
        UIView *backgroundView = [[UIView alloc]init];
        backgroundView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
        backgroundView.backgroundColor = [UIColor colorWithHexString:@"#00000000"];
        [self.tableView addSubview:backgroundView];
        //创建按钮和TEXT
        UILabel *hitLable = [[UILabel alloc]init];
        hitLable.text = @"没有您需求的路线?请联系程序员哥哥~";
        [hitLable setTextAlignment:NSTextAlignmentCenter];
        hitLable.frame = CGRectMake(0, 0, backgroundView.frame.size.width, 30);
        UIFont *font = [UIFont boldSystemFontOfSize:11];//加粗
        [hitLable setFont:font];
        hitLable.textColor = [UIColor grayColor];
        [backgroundView addSubview:hitLable];
        //创建添加路线按钮
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(addPathButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"添加路线" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        CGFloat bW = (backgroundView.frame.size.width / 2) + (backgroundView.frame.size.width / 8);
        CGFloat bH = (backgroundView.frame.size.height / 3) + (backgroundView.frame.size.height / 10);
        CGFloat bX = (backgroundView.frame.size.width / 2) - bW / 2;
        CGFloat bY = (backgroundView.frame.size.height) / 2 - bH / 3;
        button.frame = CGRectMake(bX, bY, bW, bH);
        button.backgroundColor = [UIColor colorWithHexString:@"#00CB1F"];
        [button setBackgroundImage:[UIImage imageNamed:@"button_bg.png"] forState:UIControlStateHighlighted];
        [backgroundView addSubview:button];
        [cell.contentView addSubview:backgroundView];
        return cell;
    }
    
}


@end

//
//  SingleEditFieldTableViewController.m
//  daycarpool_ios
//
//  Created by haicuan139 on 15-2-5.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import "SingleEditFieldTableViewController.h"

@interface SingleEditFieldTableViewController ()

@end

@implementation SingleEditFieldTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电话";
    UIButton *saveButton = [[UIButton alloc]init];
    [saveButton setTitle:@"完成" forState:UIControlStateNormal];
    saveButton.frame = CGRectMake(0, 0, 45, 20);
    [saveButton setTitleColor:[UIColor colorWithHexString:@"#00CB1F"] forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor colorWithHexString:@"#007E11"] forState:UIControlStateHighlighted];
    [saveButton addTarget:self action:@selector(saveText) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:saveButton];
    self.navigationItem.rightBarButtonItem = rightItem;

}
-(void)saveText{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    UITextField *text = [[UITextField alloc]init];
    text.frame = CGRectMake(cell.frame.origin.x + 10
                            , cell.frame.origin.y, cell.frame.size.width - 10, cell.frame.size.height);
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    text.borderStyle = UITextBorderStyleNone;
    text.text = @"大熊";
    [cell addSubview:text];
    return cell;
}




@end

//
//  AddPathViewController.m
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-27.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import "AddPathViewController.h"

@interface AddPathViewController ()

@end

@implementation AddPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加路线";
    _buttonAdd.layer.masksToBounds = YES;
    _buttonAdd.layer.cornerRadius = 4;
    _rootScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 1);
    [_buttonAdd setBackgroundImage:[UIImage imageNamed:@"button_bg.png"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonAddAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end

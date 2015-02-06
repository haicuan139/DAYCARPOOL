//
//  FiltrateViewController.m
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-30.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import "FiltrateViewController.h"

@interface FiltrateViewController ()

@end

@implementation FiltrateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选";
    _buttonCommit.layer.masksToBounds = YES;
    _buttonCommit.layer.cornerRadius = 4;
    [_buttonCommit setBackgroundImage:[UIImage imageNamed:@"button_bg.png"] forState:UIControlStateHighlighted];
    [_buttonCommit setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_buttonCommit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _segmentedControlAddress.selectedSegmentIndex = 0;
    _segmentedControlDis.selectedSegmentIndex = 0;
    _segmentedControlTime.selectedSegmentIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}


- (IBAction)buttonCommitAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sgementedAddressAction:(UISegmentedControl *)sender {
    NSLog(@"当前选择:%ld", (long)sender.selectedSegmentIndex);
}

- (IBAction)sgementedDisAction:(UISegmentedControl *)sender {
    NSLog(@"当前选择:%ld", (long)sender.selectedSegmentIndex);
}

- (IBAction)sgementedTimeAction:(UISegmentedControl *)sender {
     NSLog(@"当前选择:%ld", (long)sender.selectedSegmentIndex);
}
@end

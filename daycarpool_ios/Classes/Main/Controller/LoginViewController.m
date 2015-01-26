//
//  LoginViewController.m
//  新浪微博
//
//  Created by haicuan139 on 15-1-23.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)QQLoginAction:(id)sender {
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"completeinfo" bundle:nil];
    UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"CompleteInfoViewController"];
    self.navigationController.navigationBarHidden = NO;

    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)WBLoginAction:(id)sender {

}
@end

//
//  LoginViewController.h
//  新浪微博
//
//  Created by haicuan139 on 15-1-23.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *QQLoginButton;
- (IBAction)QQLoginAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *WBLoginButton;
- (IBAction)WBLoginAction:(id)sender;
@end

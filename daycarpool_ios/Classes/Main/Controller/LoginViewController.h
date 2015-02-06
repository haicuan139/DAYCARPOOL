//
//  LoginViewController.h

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
@property (weak, nonatomic) IBOutlet UIImageView *ImageViewHeader;
@property (weak, nonatomic) IBOutlet UIImageView *ImageViewTitle;

@end

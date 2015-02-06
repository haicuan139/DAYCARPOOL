//
//  LoginViewController.m

//
//  Created by haicuan139 on 15-1-23.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "LoginViewController.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSnsPlatformManager.h"
#import "UMSocialDataService.h"
#import "UMSocialAccountManager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.layer.contents = (id) [UIImage imageNamed:@"login_bg"].CGImage;
    _ImageViewHeader.layer.masksToBounds = YES;
    [_ImageViewHeader setImage:[UIImage imageNamed:@"test_header.png"]];
    _ImageViewHeader.layer.cornerRadius = _ImageViewHeader.frame.size.width / 2;
    [UIView animateWithDuration:1.0 animations:^{
        _ImageViewHeader.alpha = 1;
        _ImageViewTitle.alpha = 1 ;
        _QQLoginButton.alpha = 1 ;
        _WBLoginButton.alpha = 1 ;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)QQLoginAction:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToQQ  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
}
- (IBAction)WBLoginAction:(id)sender {
    UIStoryboard* st = [UIStoryboard storyboardWithName:@"completeinfo" bundle:nil];
    UIViewController *controller = [st instantiateViewControllerWithIdentifier:@"CompleteInfoViewController"];
    self.navigationController.navigationBarHidden = NO;
    
    [self.navigationController pushViewController:controller animated:YES];

}
@end

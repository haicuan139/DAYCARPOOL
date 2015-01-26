//
//  CompleteInfoViewController.m
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-25.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import "CompleteInfoViewController.h"
#import "MainController.h"
@interface CompleteInfoViewController ()

@end

@implementation CompleteInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏后退按钮
    UIBarButtonItem *hiddenItem = [[UIBarButtonItem alloc]init];
    hiddenItem.title = @"";
    self.navigationItem.leftBarButtonItem = hiddenItem;
    self.title = @"补全信息";

    //让按钮圆角
    _completeNextButton.layer.masksToBounds = YES;
    _completeNextButton.layer.cornerRadius = 4;
    [_completeNextButton setBackgroundImage:[UIImage imageNamed:@"button_bg.png"] forState:UIControlStateHighlighted];
    _lableName.delegate = self;
    _lablePhone.delegate = self;
    //添加触摸事件
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [_rootScrollView addGestureRecognizer:tapGestureRecognizer];
    _rootScrollView.contentSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height + 1);
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_lableName resignFirstResponder];
    [_lablePhone resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_lableName resignFirstResponder];
    [_lablePhone resignFirstResponder];
    //键盘点击回调
    return  YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma -mark 下一步按钮事件
- (IBAction)completeNextButtonAction:(id)sender {
    self.view.window.rootViewController = [[MainController alloc]init];
}
#pragma -mark 身份选择按钮事件
- (IBAction)buttonIdentityAction:(id)sender {
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"我是车主", @"我是乘客",nil];
    choiceSheet.tag = 2;
    [choiceSheet showInView:self.view];
}
#pragma -mark 性别选择按钮事件
- (IBAction)buttonGenderAction:(id)sender {
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"男", @"女",nil];
    choiceSheet.tag = 1;
    [choiceSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 1 && buttonIndex == 0) {
        //男
        [_buttonGender setTitle:@"男" forState:UIControlStateNormal];
    } else if (actionSheet.tag == 1 && buttonIndex == 1){
        // 女
        [_buttonGender setTitle:@"女" forState:UIControlStateNormal];
    } else if (actionSheet.tag == 2 && buttonIndex == 0){
        //车主
        [_ButtonIdentity setTitle:@"我是车主" forState:UIControlStateNormal];
    } else if (actionSheet.tag == 2 && buttonIndex == 1){
        //乘客
        [_ButtonIdentity setTitle:@"我是乘客" forState:UIControlStateNormal];
    }
}
@end

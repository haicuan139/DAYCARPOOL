//
//  CompleteInfoViewController.h
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-25.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteInfoViewController : UIViewController <UITextFieldDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *completeNextButton;
- (IBAction)completeNextButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *rootScrollView;

@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (weak, nonatomic) IBOutlet UITextField *lableName;
@property (weak, nonatomic) IBOutlet UITextField *lablePhone;
@property (weak, nonatomic) IBOutlet UIButton *buttonGender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonIdentity;
- (IBAction)buttonIdentityAction:(id)sender;
- (IBAction)buttonGenderAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonHeaderAction;

-(void)keyboardHide:(UITapGestureRecognizer*)tap;
@end

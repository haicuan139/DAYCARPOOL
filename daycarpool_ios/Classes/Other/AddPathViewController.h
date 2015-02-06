//
//  AddPathViewController.h
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-27.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPathViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *startLocation;
@property (weak, nonatomic) IBOutlet UITextField *endLocation;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
- (IBAction)buttonAddAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *rootScrollView;

@end

//
//  FiltrateViewController.h
//  daycarpool_ios
//
//  Created by haicuan139 on 15-1-30.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltrateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlAddress;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlDis;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlTime;
@property (weak, nonatomic) IBOutlet UIButton *buttonCommit;
- (IBAction)buttonCommitAction:(id)sender;
- (IBAction)sgementedAddressAction:(UISegmentedControl *)sender;
- (IBAction)sgementedDisAction:(UISegmentedControl *)sender;
- (IBAction)sgementedTimeAction:(UISegmentedControl *)sender;

@end

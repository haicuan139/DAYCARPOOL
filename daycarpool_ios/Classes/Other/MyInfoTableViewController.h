//
//  MyInfoTableViewController.h
//  daycarpool_ios
//
//  Created by haicuan139 on 15-2-3.
//  Copyright (c) 2015年 haicuan139. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyInfoHeaderCell.h"
#import "MyInfoOtherCell.h"
#import "VPImageCropperViewController.h"
#define ORIGINAL_MAX_WIDTH 640.0f 
@interface MyInfoTableViewController : UITableViewController <UIActionSheetDelegate,VPImageCropperDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    NSArray *_tabDataTitle;
}
-(void)selectedIdentityType;
-(void)selectedGender;
-(void)selectedHeaderImage;
-(void)exitAcount:(UIButton *)sender;
-(void)takePhoto;
-(void)selectedImages;
@end

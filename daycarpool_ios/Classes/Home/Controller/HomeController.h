//
//  HomeController.h
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  首页

#import <UIKit/UIKit.h>
#import "HomeTabCell.h"
@interface HomeController : UITableViewController
-(void)headerRereshing;
-(void)footerRereshing;
-(void)buttonTitleAction:(UIButton *)sender;
@end

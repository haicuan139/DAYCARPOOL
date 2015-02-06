//
//  HomeController.h

//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  首页

#import <UIKit/UIKit.h>
#import "HomeTabCell.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
@interface HomeController : UITableViewController <MAMapViewDelegate,AMapSearchDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;
-(void)headerRereshing;
-(void)footerRereshing;
-(void)buttonTitleAction:(UIButton *)sender;
-(void)filtrateButtonAction:(UIButton *)sender;
@end

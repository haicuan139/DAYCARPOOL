//
//  MainController.m
//  新浪微博
//
//  Created by apple on 13-10-26.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MainController.h"
#import "Dock.h"
#import "HomeController.h"
#import "MoreController.h"
#import "MeController.h"
#import "MessageController.h"
#import "SquareController.h"
#import "WBNavigationController.h"

#define kDockHeight 44

@interface MainController () <DockDelegate>
@end

@implementation MainController
- (void)viewDidLoad
{
    [super viewDidLoad];


    // 1.初始化所有的子控制器
    [self addAllChildControllers];
    
    // 2.初始化DockItems
    [self addDockItems];
}


#pragma mark 初始化所有的子控制器
- (void)addAllChildControllers
{
    // 1.首页
    HomeController *home = [[HomeController alloc] init];
    WBNavigationController *nav1 = [[WBNavigationController alloc] initWithRootViewController:home];
    // self在，添加的子控制器就存在
    [self addChildViewController:nav1];
    

    UIStoryboard* st = [UIStoryboard storyboardWithName:@"me" bundle:nil];
    MeController *me = [st instantiateViewControllerWithIdentifier:@"MeController"];
    // 3.我
    WBNavigationController *nav3 = [[WBNavigationController alloc] initWithRootViewController:me];
    [self addChildViewController:nav3];
}

#pragma mark 添加Dock
- (void)addDockItems
{
    // 1.设置Dock的背景图片
    _dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    NSInteger itemW = _dock.frame.size.width / 5;
    [_dock addItemWithIcon:@"tabbar_home.png" selectedIcon:@"tabbar_home_selected.png" title:@"首页" position:CGRectMake(10, 0, itemW,_dock.frame.size.height) tag:0];
    
    //创建发布拼车按钮
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:self action:@selector(buttonFBPCAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"发布拼车" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3;
    NSInteger w = _dock.frame.size.width / 2;
    button.frame = CGRectMake(_dock.frame.size.width/2 - w/2, _dock.frame.size.height/2 - ((_dock.frame.size.height - 5)/2 ), w, _dock.frame.size.height - 5);
    
    button.backgroundColor = [UIColor colorWithHexString:@"#00CB1F"];
    [button setBackgroundImage:[UIImage imageNamed:@"button_bg.png"] forState:UIControlStateHighlighted];
    [_dock addSubview:button];
    //创建我的
    [_dock addItemWithIcon:@"tabbar_profile.png" selectedIcon:@"tabbar_profile_selected.png" title:@"我" position:CGRectMake(    _dock.frame.size.width - (itemW + 10), 0, itemW,_dock.frame.size.height) tag:1];
    
}
-(void)buttonFBPCAction:(UIButton *)sender{
    MyLog(@"发布拼车");
}
@end

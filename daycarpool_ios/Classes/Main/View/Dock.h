//
//  Dock.h

//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  底部的工具条（选项卡条）

#import <UIKit/UIKit.h>

@class Dock;

@protocol DockDelegate <NSObject>
@optional
- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;
@end

@interface Dock : UIView
// 添加一个选项卡
- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title;
- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title position:(CGRect)rect tag:(NSInteger)tag;
// 代理
@property (nonatomic, weak) id<DockDelegate> delegate;
@end
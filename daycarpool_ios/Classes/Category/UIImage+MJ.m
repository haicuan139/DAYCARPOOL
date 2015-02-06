//
//  UIImage+MJ.m

//
//  Created by apple on 13-10-26.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UIImage+MJ.h"
#import "NSString+MJ.h"
@implementation UIImage (MJ)
#pragma mark 加载全屏的图片
// new_feature_1.png
+ (UIImage *)fullscrennImage:(NSString *)imgName
{
    // 1.如果是iPhone5，对文件名特殊处理
    if (iPhone5) {
        imgName = [imgName fileAppend:@"-568h@2x"];
    }
    
    // 2.加载图片
    return [self imageNamed:imgName];
}
@end

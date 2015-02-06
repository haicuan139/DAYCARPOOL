#import "header.h"
// 1.判断是否为iPhone5的宏
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)

// 2.日志输出宏定义
#ifdef DEBUG
// 调试状态
#define MyLog(...) NSLog(__VA_ARGS__)
#else
// 发布状态
#define MyLog(...)
#define STATIC_NOTIFICATION_TYPE_HIDDEN_BOTTOMBAR @"hidden_bottombar"

#endif
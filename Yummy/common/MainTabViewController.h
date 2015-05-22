/*!
 @header MainTabViewController
 @abstract 主界面
 @author Liutiecheng
 @version Copyright (c) 2014年 Liutiecheng. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface MainTabViewController : UITabBarController

/*!
 *  按钮集合
 */
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIView *slideBack;
@property (nonatomic) int gridWidth;

@end

//
//  NavigationViewController.h
//  OBDProj
//
//  Created by Liutiecheng on 14-4-2.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIBaseViewController.h"

@interface NavigationViewController : UINavigationController
{
    NSTimer *sessionTimer;
    double timeOut;
    double sessionTime;
}
@property (nonatomic, strong) UIBaseViewController *anchorVC;

@property (nonatomic, strong) UIBaseViewController *mainVC;

- (void)popToMainViewControllerWithAnimation:(BOOL)bAnimated;

- (void)startSession:(double)time;
- (void)activeSession;

+ (void) rewriteHeaderLabel: (UINavigationBar *)navigationBar item:(UINavigationItem*)item _alignment:(NSTextAlignment)alignment _xadjust:(int)x;

+ (void) rewriteHeaderLabel: (UINavigationBar *)navigationBar item:(UINavigationItem*)item;
@end

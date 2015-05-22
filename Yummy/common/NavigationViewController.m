//
//  NavigationViewController.m
//  OBDProj
//
//  Created by Liutiecheng on 14-4-2.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//


#import "NavigationViewController.h"
#import "UIBaseViewController.h"
#import "UIFont+Extensions.h"

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];   //set navigationcontroller background
    self.view.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置横竖屏
- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    NSLog(@"-------NavigationViewController viewWillAppear");
    
}
//设置status bar的文字颜色为白色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)popViewControllerWithAnimation{
    [self popViewControllerAnimated:YES];
}

- (void)popToMainViewControllerWithAnimation:(BOOL)bAnimated{
    [self popToViewController:self.mainVC animated:bAnimated];
}

+ (void) rewriteHeaderLabel: (UINavigationBar *)navigationBar item:(UINavigationItem*)item _alignment:(NSTextAlignment)alignment _xadjust:(int)x{
    CGRect frame = CGRectMake(0, 0, navigationBar.frame.size.width, navigationBar.frame.size.height);
    NSLog(@" navbar %f",navigationBar.frame.size.width);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, 0, 200, navigationBar.frame.size.height)];
    UILabel *holder = [[UILabel alloc] initWithFrame:frame];
    holder.text = item.title;
    holder.font = [UIFont homeHeader];
    holder.backgroundColor = [UIColor clearColor];
    holder.textAlignment = alignment;
    holder.clipsToBounds = YES;
    holder.adjustsFontSizeToFitWidth = YES;
    
    [view addSubview:holder];
    
    item.titleView = view;
}

+ (void) rewriteHeaderLabel: (UINavigationBar *)navigationBar item:(UINavigationItem*)item{
    CGRect frame = CGRectMake(0, 0, navigationBar.frame.size.width - 150, navigationBar.frame.size.height);
    UILabel *holder = [[UILabel alloc] initWithFrame:frame];
    holder.text = item.title;
    holder.font = [UIFont homeHeader];
    holder.backgroundColor = [UIColor clearColor];
    holder.textAlignment = NSTextAlignmentCenter;
    holder.clipsToBounds = YES;
    holder.adjustsFontSizeToFitWidth = YES;
    
    item.titleView = holder;
}

/**
 *  设置logout的时间
 *
 *  @param time logout时间，单位：分钟
 */
- (void)startSession:(double)time{
//    NSLog(@"====>startSession<====");
    if (time>0) {
        timeOut = time * 60;
        sessionTime = [NSDate timeIntervalSinceReferenceDate];
        sessionTimer = [NSTimer scheduledTimerWithTimeInterval:timeOut target:self selector:@selector(sessionRun) userInfo:Nil repeats:NO];
    }
}

- (void)activeSession{
//    NSLog(@"=============>active session<=============");
    if ([sessionTimer isValid]) {
        sessionTime = [NSDate timeIntervalSinceReferenceDate];
    }
}

- (void)sessionRun{
//    NSLog(@"----------->session out<-----------");
    double timeInterval = [NSDate timeIntervalSinceReferenceDate] - sessionTime;
    //超时情况
    if (timeInterval>=timeOut) {
        [sessionTimer invalidate];
        [self logout];
    }else{
        sessionTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(sessionRun) userInfo:nil repeats:NO];
    }
}

- (void)logout{
    NSLog(@"===>log out");
    [self popToRootViewControllerAnimated:YES];
}

- (BOOL) navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item{
    if (!item.leftBarButtonItem) {
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 51, 44)];
        [backButton addTarget:self action:@selector(popViewControllerWithAnimation) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *btnImage = nil;
        btnImage = [UIImage imageNamed:@"back"];
        
        [backButton setBackgroundImage:btnImage forState:UIControlStateNormal];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        item.leftBarButtonItem = backItem;
    }
//http://stackoverflow.com/questions/9866062/can-i-change-the-position-of-navigationbar-item
//change x of leftbarbuttonitems
    if ([item.leftBarButtonItems count] > 0) {
		UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
		if(SYSTEM_VERSION_LESS_THAN(@"7.0")) {
			space.width = -5.0;
		} else {
			space.width = -16.0;
		}
        NSLog(@"---- count=%lu",(unsigned long)item.leftBarButtonItems.count);
		item.leftBarButtonItems = [@[space] arrayByAddingObjectsFromArray:item.leftBarButtonItems];
	}
    
//    if ([item.rightBarButtonItems count] > 0) {
//		UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//		if(SYSTEM_VERSION_LESS_THAN(@"7.0")) {
//			space.width = -5.0;
//		} else {
//			space.width = -16.0;
//		}
//		item.rightBarButtonItems = [@[space] arrayByAddingObjectsFromArray:item.rightBarButtonItems];
//	}
    
    [NavigationViewController rewriteHeaderLabel:navigationBar item:item];
    
    return YES;
}

@end

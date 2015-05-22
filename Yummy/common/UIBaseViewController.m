//
//  UIBaseViewController.m
//  OBDProj
//
//  Created by Liutiecheng on 14-4-2.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import "UIBaseViewController.h"
#import "NavigationViewController.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController

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
    self.identifier = DEFAULT_VC_ID;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)clearAnchor{
    NavigationViewController *naviVC = (NavigationViewController *)self.navigationController;
    naviVC.anchorVC = nil;
}

- (void)startSession:(double)time{
    NavigationViewController *naviVC = (NavigationViewController *)self.navigationController;
    [naviVC startSession:time];
}

- (void)activeSession{
    NavigationViewController *naviVC = (NavigationViewController *)self.navigationController;
    [naviVC activeSession];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (IBAction)backToFront:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

//- (BOOL)prefersStatusBarHidden{
//    return NO;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

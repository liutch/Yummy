//
//  SplashViewController.h
//  edms
//
//  Created by Liutiecheng on 14-7-14.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBaseViewController.h"

@interface SplashViewController : UIBaseViewController

@property (nonatomic,weak) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UIImageView *windowImageBackground;

@end

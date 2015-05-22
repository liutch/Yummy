//
//  CustomHomeSegue.h
//  edms
//
//  Created by Liutiecheng on 14-7-14.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashViewController.h"

@interface CustomHomeSegue : UIStoryboardSegue

- (id) initWithIdentifier:(NSString *)identifier
				   source:(SplashViewController *)source
			  destination:(UIViewController *)destination;
@property (nonatomic, readonly) SplashViewController *sourceViewController;
@end

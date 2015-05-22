
//
//  CustomHomeSegue.m
//  edms
//
//  Created by Liutiecheng on 14-7-14.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import "CustomHomeSegue.h"

@implementation CustomHomeSegue


- (id) initWithIdentifier:(NSString *)identifier
				   source:(SplashViewController *)source
			  destination:(UIViewController *)destination {
	return [super initWithIdentifier:identifier source:source destination:destination];
}

- (void) perform {
	SplashViewController *sourceController;
//	if ( [self.sourceViewController isKindOfClass:[UndockedTutorialViewController class]] ) {
//		UINavigationController * nav = (UINavigationController*)self.sourceViewController.presentingViewController;
//		sourceController = [nav.viewControllers objectAtIndex:0]; //root controller wil be the UndockedSplashViewController
//		[self.sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//	} else {
		sourceController = self.sourceViewController;
//	}
	
	void (^showHomeScreen)(void) = ^{
		[sourceController.navigationController setViewControllers:@[self.destinationViewController]];
	};
    
	[sourceController setTitle:@"优惠"];
//	[sourceController.navigationController setNavigationBarHidden:NO animated:NO];
	
	[UIView transitionWithView:self.sourceViewController.navigationController.view duration:1.0
					   options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionLayoutSubviews
					animations:showHomeScreen
					completion:^(BOOL finished) {
						[sourceController.windowImageBackground removeFromSuperview];
						sourceController.windowImageBackground = nil;
					}];
	
}

@end

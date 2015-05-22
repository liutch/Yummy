//
//  SplashViewController.m
//  edms
//
//  Created by Liutiecheng on 14-7-14.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void) viewDidAppear:(BOOL)animated {
	dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 1.0f * NSEC_PER_SEC);
	
	dispatch_after(delay, dispatch_get_main_queue(), ^{
		if (self.view.window) {
			self.spinner.hidden = YES;
			[self.spinner stopAnimating];
            
//			Tutorial *t = [[Tutorial alloc] init];
//			if(t.hasTutorialsToShow) {
//				self.tutorial = t;
//				[self performSegueWithIdentifier:@"ShowUndockedTutorial" sender:self];
//				
//			} else {
				if (!self.windowImageBackground) {
					self.windowImageBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"undocked-transition-overlay"]];
					self.windowImageBackground.frame = CGRectMake(0, (self.view.window.frame.size.height - self.windowImageBackground.frame.size.height) / 2, 320, 568);
				}
				[self.view.window addSubview:self.windowImageBackground];
				[self.view.window sendSubviewToBack:self.windowImageBackground];
				
				[self performSegueWithIdentifier:@"showMainView" sender:self];
//			}
		}
	});
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

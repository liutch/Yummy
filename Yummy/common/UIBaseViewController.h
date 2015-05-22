//
//  UIBaseViewController.h
//  OBDProj
//
//  Created by Liutiecheng on 14-4-2.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEFAULT_VC_ID @"defaultviewcontroller"
#define ADDRESS_VC_ID @"addressviewcontroller"
#define EMERGENCY_VC_ID @"emergencyviewcontroller"

@interface UIBaseViewController : UIViewController

@property (nonatomic, strong) NSString *parentID;
@property (nonatomic, strong) NSString *identifier;



- (void)clearAnchor;

- (void)startSession:(double)time;
- (void)activeSession;

- (IBAction)backToFront:(id)sender;
@end

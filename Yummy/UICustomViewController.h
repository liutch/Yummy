//
//  UICustomViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UIBaseViewController.h"

@interface UICustomViewController : UIBaseViewController

//自定义navigationBar
@property (nonatomic,weak) IBOutlet UIView *topView;
//自定义toolbar
@property (nonatomic,weak) IBOutlet UIView *bottomView;

@end

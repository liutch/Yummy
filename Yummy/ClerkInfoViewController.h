//
//  ClerkInfoViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBaseViewController.h"

@interface ClerkInfoViewController : UIBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UIImageView *icon;
@property (nonatomic,weak) IBOutlet UILabel *name;
@property (nonatomic,weak) IBOutlet UILabel *location;
@property (nonatomic,weak) IBOutlet UILabel *signature;
@property (nonatomic,weak) IBOutlet UILabel *detailPos;

@property (nonatomic,weak) IBOutlet UIView *clerkView;
@property (nonatomic,weak) IBOutlet UIView *infoView;

@property (nonatomic,weak) IBOutlet UIImageView *backgroundImg;

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic,weak) IBOutlet NSLayoutConstraint *infoConstraint;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *tableConstraint;

- (IBAction)onClickRightBtn:(id)sender;

@end

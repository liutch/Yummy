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

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end

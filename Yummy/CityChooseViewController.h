//
//  CityChooseViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/22.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UIBaseViewController.h"

@interface CityChooseViewController : UIBaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end

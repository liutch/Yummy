//
//  HisMenuViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/20.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICustomViewController.h"

@interface HisMenuViewController : UICustomViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *tableView;

- (IBAction)onClickOrder:(id)sender;

- (IBAction)onClickAdd:(id)sender;

- (IBAction)onClickMinus:(id)sender;
@end

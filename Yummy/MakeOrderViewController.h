//
//  MakeOrderViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UICustomViewController.h"

@interface MakeOrderViewController : UICustomViewController<UITableViewDataSource,UITableViewDelegate>
{

}
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@property (nonatomic,weak) IBOutlet UITextField *dateField;

- (IBAction)onClickChangeBuyWay:(id)sender;

- (IBAction)onClickChangeDate:(id)sender;

- (IBAction)onClickAddComments:(id)sender;

- (void)setOrder:(NSMutableArray*)array;

- (IBAction)onClickAdd:(id)sender;

- (IBAction)onClickMinus:(id)sender;

@end

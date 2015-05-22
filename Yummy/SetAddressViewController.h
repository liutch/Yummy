//
//  SetAddressViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UIBaseViewController.h"

@interface SetAddressViewController : UIBaseViewController

@property (nonatomic,weak) IBOutlet UILabel *city;
@property (nonatomic,weak) IBOutlet UILabel *district;

@property (nonatomic,weak) IBOutlet UITextField *street;
@property (nonatomic,weak) IBOutlet UITextField *detailInfo;

- (IBAction)onClickChooseCity:(id)sender;
- (IBAction)onClickChooseDistrict:(id)sender;

@end

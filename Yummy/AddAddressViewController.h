//
//  AddAddressViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UIBaseViewController.h"

@interface AddAddressViewController : UIBaseViewController

@property (nonatomic,weak) IBOutlet UITextField *recipient;
@property (nonatomic,weak) IBOutlet UITextField *phoneNumber;
@property (nonatomic,weak) IBOutlet UITextField *address;

- (IBAction)onClickShowMap:(id)sender;
@end

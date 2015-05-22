//
//  ChooseExpressViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UIBaseViewController.h"

@interface ChooseExpressViewController : UIBaseViewController

@property (nonatomic,weak) IBOutlet UILabel *vender;

@property (nonatomic,weak) IBOutlet UILabel *deliveryAdd1;

@property (nonatomic,weak) IBOutlet UILabel *deliveryAdd2;

- (IBAction)onClickAdd1:(id)sender;

- (IBAction)onClickAdd2:(id)sender;
@end

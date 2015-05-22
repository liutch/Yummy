//
//  HisMenuTableViewCell.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HisMenuTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UIImageView *menuIcon;
@property (nonatomic,weak) IBOutlet UILabel *menuName;
@property (nonatomic,weak) IBOutlet UILabel *menuInfo;
@property (nonatomic,weak) IBOutlet UILabel *favNum;
@property (nonatomic,weak) IBOutlet UILabel *price;
@property (nonatomic,weak) IBOutlet UILabel *count;

@property (nonatomic,weak) IBOutlet UIButton *addBtn,*minusBtn;
@end

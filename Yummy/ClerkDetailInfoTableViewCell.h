//
//  ClerkDetailInfoTableViewCell.h
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClerkDetailInfoTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UIButton *btn1;
@property (nonatomic,weak) IBOutlet UIButton *btn2;

@property (nonatomic,weak) IBOutlet UIImageView *userIcon;
@property (nonatomic,weak) IBOutlet UILabel *label1;
@property (nonatomic,weak) IBOutlet UILabel *label2;
@property (nonatomic,weak) IBOutlet UILabel *label3;

@property (nonatomic,weak) IBOutlet UIImageView *backIcon;
@property (nonatomic,weak) IBOutlet UIView *infoView;
@property (nonatomic,weak) IBOutlet UILabel *posLabel;

@end

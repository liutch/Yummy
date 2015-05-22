//
//  ClerkTableViewCell.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClerkTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UIImageView *icon;
@property (nonatomic,weak) IBOutlet UILabel *name;
@property (nonatomic,weak) IBOutlet UILabel *signature;
@property (nonatomic,weak) IBOutlet UILabel *distance;

@property (nonatomic,weak) IBOutlet UIImageView *menu1;
@property (nonatomic,weak) IBOutlet UIImageView *menu2;
@property (nonatomic,weak) IBOutlet UIImageView *menu3;
@property (nonatomic,weak) IBOutlet UIImageView *menu4;

@end

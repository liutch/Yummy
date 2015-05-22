//
//  ClerkTableViewCell.m
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "ClerkTableViewCell.h"

@implementation ClerkTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.icon.layer.cornerRadius = 23;
    self.icon.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  ClerkDetailInfoTableViewCell.m
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "ClerkDetailInfoTableViewCell.h"

@implementation ClerkDetailInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.userIcon.layer.cornerRadius = 40;
    self.userIcon.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

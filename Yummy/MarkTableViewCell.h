//
//  MarkTableViewCell.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarkTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UIImageView *icon;
@property (nonatomic,weak) IBOutlet UILabel *name;
@property (nonatomic,weak) IBOutlet UILabel *date;
@property (nonatomic,weak) IBOutlet UITextView *words;

@end

//
//  SearchResultPersonViewCellTableViewCell.h
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultPersonTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *shopName;
@property (nonatomic,weak) IBOutlet UILabel *userName;
@property (nonatomic,weak) IBOutlet UILabel *address;

@property (nonatomic,weak) IBOutlet UIImageView *icon;
@end

@interface Result_Person : NSObject

@property (nonatomic,strong) NSString *shop;
@property (nonatomic,strong) NSString *user;
@property (nonatomic,strong) NSString *address;

@property (nonatomic,strong) UIImage *icon;

@end
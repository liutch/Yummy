//
//  SearchShopTableViewCell.h
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchShopTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UIImageView *icon;
@property (nonatomic,weak) IBOutlet UILabel *foodName;
@property (nonatomic,weak) IBOutlet UILabel *info;
@property (nonatomic,weak) IBOutlet UILabel *shopName;
@property (nonatomic,weak) IBOutlet UILabel *price;
@property (nonatomic,weak) IBOutlet UILabel *fav;
@end

@interface Result_Food : NSObject

@property (nonatomic,strong) NSString *foodName;
@property (nonatomic,strong) NSString *info;
@property (nonatomic,strong) NSString *shopName;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *fav;

@property (nonatomic,strong) UIImage *icon;

@end
//
//  MarkData.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarkData : NSObject

@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *words;

@property (nonatomic) BOOL isUp;

@end

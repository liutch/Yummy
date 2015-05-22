//
//  Clerk.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Clerk : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *signature;
@property (nonatomic) CGPoint point;
@property (nonatomic,strong) UIImage *icon;

@property (nonatomic,strong) NSString *identifer;

@property (nonatomic,strong) UIImage *menu1,*menu2,*menu3,*menu4;

@end

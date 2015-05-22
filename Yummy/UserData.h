//
//  UserData.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface UserData : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic) CGPoint *position;
@property (nonatomic,strong) NSString *signature;
@property (nonatomic,strong) UIImage *icon;

@end

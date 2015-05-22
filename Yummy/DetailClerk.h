//
//  DetailClerk.h
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "Clerk.h"

@interface DetailClerk : Clerk

@property (nonatomic,strong) NSString *location;
@property (nonatomic,strong) NSString *detailPos;

@property (nonatomic,strong) NSString *detailInfo;

@property (nonatomic,strong) NSMutableArray *marks;

@end

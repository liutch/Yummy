//
//  TableViewFullScreenController.h
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UICustomViewController.h"

@interface TableViewFullScreenController : NSObject<UIScrollViewDelegate>{
    float prevOffsetY;
}

@property (nonatomic) BOOL enabled;
@property (nonatomic,strong) UICustomViewController *viewController;

- (id)initWithViewController:(UICustomViewController*)controller;

@end

//
//  RefreshTableHeaderView.h
//  edms
//
//  Created by Liutiecheng on 14-7-25.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshTableHeaderView : UIView

@property (nonatomic,weak) IBOutlet UILabel *content;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView *indicator;

@end

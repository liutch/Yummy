//
//  UIScrollView+GifPullToRefresh.h
//  OBD_Navinfo
//
//  Created by Liutiecheng on 15/1/6.
//  Copyright (c) 2015年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GifRefreshControl.h"

@interface UIScrollView (GifPullToRefresh)

@property(nonatomic,strong)GifRefreshControl *refreshControl;

- (void)addPullToRefreshWithDrawingImgs:(NSArray*)drawingImgs andLoadingImgs:(NSArray*)loadingImgs andActionHandler:(void (^)(void))actionHandler;
- (void)didFinishPullToRefresh;

@end

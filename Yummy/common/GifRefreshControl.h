//
//  GifRefreshControl.h
//  OBD_Navinfo
//
//  Created by Liutiecheng on 15/1/6.
//  Copyright (c) 2015年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GifRefreshControlHeight 80

typedef enum
{
    GifPullToRefreshStateDrawing = 0,
    GifPullToRefreshStateLoading,
} GifPullToRefreshState;

@interface GifRefreshControl : UIView
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, copy) void (^pullToRefreshActionHandler)(void);
@property (nonatomic, strong) NSArray *drawingImgs;
@property (nonatomic, strong) NSArray *loadingImgs;
@property (nonatomic, assign) CGFloat originalContentInsectY;
- (void)endLoading;
@end

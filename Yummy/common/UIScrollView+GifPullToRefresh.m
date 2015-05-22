//
//  UIScrollView+GifPullToRefresh.m
//  OBD_Navinfo
//
//  Created by Liutiecheng on 15/1/6.
//  Copyright (c) 2015年 Liutiecheng. All rights reserved.
//

#import "UIScrollView+GifPullToRefresh.h"
#import <objc/runtime.h>

static char UIScrollViewGifPullToRefresh;

@implementation UIScrollView (GifPullToRefresh)

- (void)setRefreshControl:(GifRefreshControl *)pullToRefreshView {
    [self willChangeValueForKey:@"UIScrollViewGifPullToRefresh"];
    objc_setAssociatedObject(self, &UIScrollViewGifPullToRefresh,
                             pullToRefreshView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"UIScrollViewGifPullToRefresh"];
}

- (GifRefreshControl *)refreshControl {
    return objc_getAssociatedObject(self, &UIScrollViewGifPullToRefresh);
}

- (void)addPullToRefreshWithDrawingImgs:(NSArray*)drawingImgs andLoadingImgs:(NSArray*)loadingImgs andActionHandler:(void (^)(void))actionHandler
{
    
    GifRefreshControl *view = [[GifRefreshControl alloc] initWithFrame:CGRectMake(0, -GifRefreshControlHeight, self.bounds.size.width, GifRefreshControlHeight)];
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
//        view.originalContentInsectY = 64;
//    }
    
    view.scrollView = self;
    view.pullToRefreshActionHandler = actionHandler;
    view.drawingImgs = drawingImgs;
    view.loadingImgs = loadingImgs;
    [self addSubview:view];
    self.refreshControl = view;
}


- (void)didFinishPullToRefresh
{
    [self.refreshControl endLoading];
}

@end

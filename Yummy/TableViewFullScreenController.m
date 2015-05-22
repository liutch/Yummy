
//
//  TableViewFullScreenController.m
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "TableViewFullScreenController.h"
#import "UIView+Attribute.h"

@implementation TableViewFullScreenController

#define STATUS_BAR_HEIGHT 64

- (id)initWithViewController:(UICustomViewController*)controller{
    self = [super init];
    if (self) {
        self.enabled = YES;
        self.viewController = controller;
    }
    return self;
}

- (void)moveScrollView:(UIScrollView*)scrollView deltaY:(float)deltaY{
    if (!self.enabled) {
        return;
    }
    UIView* navBar = _viewController.topView;
    navBar.top = MIN(MAX(navBar.top-deltaY, -navBar.height), 20);
    
    // toolbar
    UIView* toolbar = _viewController.bottomView;

    CGFloat toolbarSuperviewHeight = toolbar.superview.height;
    
    toolbar.top = MIN(MAX(toolbar.top+deltaY, toolbarSuperviewHeight-toolbar.height), toolbarSuperviewHeight);
    
    // scrollIndicatorInsets
    UIEdgeInsets insets = scrollView.scrollIndicatorInsets;

    insets.top = navBar.bottom-STATUS_BAR_HEIGHT;
    
    insets.bottom = 0;
    insets.bottom += toolbarSuperviewHeight-toolbar.top;
    
    scrollView.scrollIndicatorInsets = insets;
    
    scrollView.top = navBar.top + navBar.height;
    scrollView.height = toolbar.top - navBar.bottom;
    scrollView.bottom = toolbar.top;
}

#pragma  mark UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    prevOffsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.dragging) {
        CGFloat deltaY = scrollView.contentOffset.y - prevOffsetY;
        
        [self moveScrollView:scrollView deltaY:deltaY];
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
}

@end

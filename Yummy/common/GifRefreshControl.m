//
//  GifRefreshControl.m
//  OBD_Navinfo
//
//  Created by Liutiecheng on 15/1/6.
//  Copyright (c) 2015年 Liutiecheng. All rights reserved.
//

#import "GifRefreshControl.h"

@implementation GifRefreshControl{
    GifPullToRefreshState _state;
    BOOL _isTrigged;
    UIImageView *_refreshView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:46/255.0 green:51/255.0 blue:57/255.0 alpha:1];
        _refreshView = [[UIImageView alloc] initWithFrame:self.bounds];
        _refreshView.contentMode = UIViewContentModeScaleAspectFit;
        _refreshView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_refreshView];
    }
    return self;
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [_scrollView removeObserver:self forKeyPath:@"pan.state"];
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [_scrollView removeObserver:self forKeyPath:@"pan.state"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [_scrollView addObserver:self forKeyPath:@"pan.state" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (self.scrollView.contentOffset.y + self.originalContentInsectY <= 0) {
        if ([keyPath isEqualToString:@"pan.state"]) {
            if (self.scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded && _isTrigged) {
                [self setState:GifPullToRefreshStateLoading];
                [UIView animateWithDuration:0.2
                                      delay:0
                                    options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     self.scrollView.contentOffset = CGPointMake(0, -GifRefreshControlHeight - self.originalContentInsectY);
                                     self.scrollView.contentInset = UIEdgeInsetsMake(GifRefreshControlHeight + self.originalContentInsectY, 0.0f, 0.0f, 0.0f);
                                     
                                 }
                                 completion:^(BOOL finished) {
                                     if (self.pullToRefreshActionHandler) {
                                         self.pullToRefreshActionHandler();
                                     }
                                 }];
            }
        }
        else if([keyPath isEqualToString:@"contentOffset"]){
            [self scrollViewContentOffsetChanged];
        }
        
    }
    
}

- (void)scrollViewContentOffsetChanged
{
    if (_state != GifPullToRefreshStateLoading) {
        if (self.scrollView.isDragging && self.scrollView.contentOffset.y + self.originalContentInsectY < -GifRefreshControlHeight && !_isTrigged) {
            _isTrigged = YES;
        }
        else {
            if (self.scrollView.isDragging && self.scrollView.contentOffset.y + self.originalContentInsectY > -GifRefreshControlHeight) {
                _isTrigged = NO;
            }
            [self setState:GifPullToRefreshStateDrawing];
        }
    }
}


- (void)setState:(GifPullToRefreshState)aState{
    
    CGFloat offset = -(self.scrollView.contentOffset.y + self.originalContentInsectY);
    CGFloat percent = 0;
    if (offset < 0) {
        offset = 0;
    }
    if (offset > GifRefreshControlHeight) {
        offset = GifRefreshControlHeight;
    }
    percent = (offset-20)<0?0:(offset-20) / (GifRefreshControlHeight-20);
    NSUInteger drawingIndex = percent * (self.drawingImgs.count - 1);
    switch (aState)
    {
            
        case GifPullToRefreshStateDrawing:
            [_refreshView stopAnimating];
            _refreshView.image = self.drawingImgs[drawingIndex];
            
            break;
            
        case GifPullToRefreshStateLoading:
            _refreshView.animationImages = self.loadingImgs;
            _refreshView.animationDuration = (CGFloat)self.loadingImgs.count/20.0;
            [_refreshView startAnimating];
            break;
        default:
            break;
    }
    
    _state = aState;
    
}

- (void)endLoading
{
    if (_state == GifPullToRefreshStateLoading) {
        _isTrigged = NO;
        
        [self setState:GifPullToRefreshStateDrawing];
        
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.scrollView.contentInset = UIEdgeInsetsMake(self.originalContentInsectY, 0.0f, 0.0f, 0.0f);
                         }
                         completion:nil];
    }
}

@end

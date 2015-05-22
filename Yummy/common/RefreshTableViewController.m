//
//  RefreshTableViewController.m
//  edms
//
//  Created by Liutiecheng on 14-7-25.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import "RefreshTableViewController.h"

#define REFRESH_START_FRAME 99
#define REFRESH_END_FRAME 128

@interface RefreshTableViewController ()

@end

@implementation RefreshTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.canLoadMore = YES;
    
    self.footer = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil] objectAtIndex:0];
    
    NSMutableArray *temp1 = [NSMutableArray array];
    NSMutableArray *temp2 = [NSMutableArray array];
    
    for (NSUInteger i  = 1; i <= REFRESH_START_FRAME; i++) {
        NSString *fileName = [NSString stringWithFormat:@"refresh%d",i];
        [temp1 addObject:[UIImage imageNamed:fileName]];
    }
    
    for (NSUInteger i  = REFRESH_START_FRAME+1; i <= REFRESH_END_FRAME; i++) {
        NSString *fileName = [NSString stringWithFormat:@"refresh%d",i];
        [temp2 addObject:[UIImage imageNamed:fileName]];
    }
    
    self.drawingImgs = temp1;
    self.loadingImgs = temp2;
    
    [self.tableView addPullToRefreshWithDrawingImgs:self.drawingImgs andLoadingImgs:self.loadingImgs andActionHandler:^{
        [self didBeginRefreshing_Up];
    }];

    self.tableView.tableFooterView = self.footer;
    self.tableView.tableFooterView.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didBeginRefreshing_Up{

}

- (void)didEndRefreshing_Up{
    
}

- (void)didBeginRefreshing_Down{
    self.canLoadMore = NO;
    [self.footer.indicator startAnimating];
}

- (void)startToRefresh
{
//    NSLog(@"=======> start to refresh");
    self.state = RefreshControlStateStopping;

    [self didBeginRefreshing_Down];
}

- (void)endRefresh_Down{
    [self.footer.indicator stopAnimating];
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint offset = self.tableView.contentOffset;
        offset.y = self.tableView.contentSize.height-self.tableView.frame.size.height-self.footer.frame.size.height;
//        NSLog(@"======================>%f",offset.y);
        self.tableView.contentOffset = offset;
    } completion:^(BOOL finished) {
//        NSLog(@" ----------> completion");
        self.state = RefreshControlStateHidden;
        self.tableView.tableFooterView.hidden = YES;
        self.canLoadMore = YES;
    }];
}

- (void)endRefresh_Up
{
    [self.tableView didFinishPullToRefresh];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.state == RefreshControlStateStopping) {
        return;
    }
    if (self.canLoadMore) {
        if ((scrollView.contentSize.height-scrollView.frame.size.height-self.footer.frame.size.height)<=scrollView.contentOffset.y &&
            scrollView.contentOffset.y>0 &&
            scrollView.contentSize.height>scrollView.frame.size.height) {
            self.tableView.tableFooterView.hidden = NO;
            
            CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height;
            if (scrollPosition < scrollView.contentOffset.y) {
                self.state = RefreshControlStateOverThreshold;//2
            }
        }else{
            self.state = RefreshControlStateHidden;
            self.tableView.tableFooterView.hidden = YES;
        }
//        NSLog(@"--------->hidden state=%d",self.state);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.state == RefreshControlStateStopping) {
        return;
    }
    if (self.state == RefreshControlStateOverThreshold) {
        [self startToRefresh];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (self.state == RefreshControlStateStopping) {
        return;
    }
//    NSLog(@"--------->%f,%f,%f",(scrollView.contentSize.height-scrollView.frame.size.height-self.footer.frame.size.height),scrollView.contentOffset.y,(scrollView.contentSize.height-scrollView.frame.size.height));
    if ((scrollView.contentSize.height-scrollView.frame.size.height-self.footer.frame.size.height)<scrollView.contentOffset.y &&
        scrollView.contentOffset.y<(scrollView.contentSize.height-scrollView.frame.size.height) &&
                                    scrollView.contentOffset.y>0 &&
            scrollView.contentSize.height>scrollView.frame.size.height) {
        
        [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            CGPoint offset = self.tableView.contentOffset;
            offset.y = scrollView.contentSize.height-scrollView.frame.size.height-self.footer.frame.size.height;
            self.tableView.contentOffset = offset;
        } completion:^(BOOL finished) {

        }];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

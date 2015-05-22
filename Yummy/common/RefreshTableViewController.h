//
//  RefreshTableViewController.h
//  edms
//
//  Created by Liutiecheng on 14-7-25.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBaseViewController.h"
#import "UIScrollView+GifPullToRefresh.h"
#import "RefreshTableHeaderView.h"
#import "RefreshTableFooterView.h"

@interface RefreshTableViewController : UIBaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) RefreshControlState state;

@property (nonatomic) BOOL canLoadMore;

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray *drawingImgs;
@property (nonatomic,strong) NSArray *loadingImgs;
//@property (nonatomic,strong) RefreshTableHeaderView *header;
@property (nonatomic,strong) RefreshTableFooterView *footer;

- (void)endRefresh_Up;
- (void)endRefresh_Down;
/*!
 *  header刷新时触发方法
 */
- (void)didBeginRefreshing_Up;
/*!
 *  footer刷新时触发方法
 */
- (void)didBeginRefreshing_Down;

@end

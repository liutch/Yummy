//
//  CityChooseViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/22.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "CityChooseViewController.h"

@implementation CityChooseViewController
{
    NSMutableArray *dataArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    dataArray = [NSMutableArray arrayWithCapacity:0];
}

#pragma  mark TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.backgroundColor = [UIColor grayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 15)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:10];
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    if (section==0) {
        label.text = @"定位到的位置";
    }else{
        label.text = @"全部";
    }
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 20;//dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"city_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
//    NSString *city = [dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"沈阳";
    
    if(!cell)
    {
        @throw ([NSException exceptionWithName:@"CellIsNilException" reason:@"Cell is nil!" userInfo:nil]);
    }
    
    return cell;
}

@end

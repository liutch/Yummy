//
//  MainSceneViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/10.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "MainSceneViewController.h"
#import "ClerkTableViewCell.h"
#import "Clerk.h"
#import "ClerkInfoViewController.h"

@interface MainSceneViewController ()
{
    NSMutableArray *data;
}
@end

@implementation MainSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *nibContacts = [UINib nibWithNibName:@"ClerkInfoNib" bundle:nil];
    [self.tableView registerNib:nibContacts forCellReuseIdentifier:@"clerk_table_cell"];
    
    data = [NSMutableArray arrayWithCapacity:0];
    [self makeDummy];
    
}

- (void)makeDummy{
    Clerk *clerk1 = [[Clerk alloc] init];
    clerk1.name = @"京东";
    clerk1.signature = @"吃货的老大";
    clerk1.icon = [UIImage imageNamed:@"1.jpg"];
    clerk1.menu1 = [UIImage imageNamed:@"m1.jpg"];
    clerk1.menu2 = [UIImage imageNamed:@"m2.jpg"];
    [data addObject:clerk1];
    
    Clerk *clerk2 = [[Clerk alloc] init];
    clerk2.name = @"京东";
    clerk2.icon = [UIImage imageNamed:@"2.jpg"];;
    clerk2.signature = @"吃货的老大";
    [data addObject:clerk2];
    
    Clerk *clerk3 = [[Clerk alloc] init];
    clerk3.name = @"京东";
    clerk3.signature = @"吃货的老大";
    clerk3.icon = [UIImage imageNamed:@"3.jpg"];
    clerk3.menu1 = [UIImage imageNamed:@"m3.jpg"];
    clerk3.menu2 = [UIImage imageNamed:@"m4.jpg"];
    clerk3.menu3 = [UIImage imageNamed:@"m5.jpg"];
    [data addObject:clerk3];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"clerk_table_cell";
    ClerkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Clerk *clerk = [data objectAtIndex:indexPath.row];
    
    cell.icon.image = clerk.icon;
    cell.name.text = clerk.name;
    cell.signature.text = clerk.signature;
    //TODO
    cell.distance.text = @"1.2km";
    
    if (clerk.menu1) {
        cell.menu1.image = clerk.menu1;
    }
    if (clerk.menu2) {
        cell.menu2.image = clerk.menu2;
    }
    if (clerk.menu3) {
        cell.menu3.image = clerk.menu3;
    }
    if (clerk.menu4) {
        cell.menu4.image = clerk.menu4;
    }
    
    if(!cell)
    {
        @throw ([NSException exceptionWithName:@"CellIsNilException" reason:@"Cell is nil!" userInfo:nil]);
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Clerk *clerk = [data objectAtIndex:indexPath.row];
    if (clerk.menu1) {
        return 160;
    }else{
        return 70;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"ClerkInfo" bundle:nil];
    ClerkInfoViewController *controller = (ClerkInfoViewController*)[board instantiateViewControllerWithIdentifier:@"clerkInfo"];
    [self.navigationController pushViewController:controller animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

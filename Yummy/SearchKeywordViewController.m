//
//  SearchKeywordViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "SearchKeywordViewController.h"
#import "SearchResultPersonTableViewCell.h"
#import "SearchShopTableViewCell.h"
#import "SingleFoodViewController.h"

@interface SearchKeywordViewController ()
{
    NSMutableArray *person_dataArray;
    NSMutableArray *food_dataArray;
    BOOL isPerson;
}
@end

@implementation SearchKeywordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    person_dataArray = [NSMutableArray arrayWithCapacity:0];
    food_dataArray = [NSMutableArray arrayWithCapacity:0];
    
    isPerson = false;
    
    UINib *cell1 = [UINib nibWithNibName:@"SearchResultPersonViewCell" bundle:nil];
    [self.tableView registerNib:cell1 forCellReuseIdentifier:@"search_result_user"];
    
    UINib *cell2 = [UINib nibWithNibName:@"SearchShopTableViewCell" bundle:nil];
    [self.tableView registerNib:cell2 forCellReuseIdentifier:@"search_result_food"];
    
    [self makeDummy];
}

- (void)makeDummy{
    Result_Food *food = [[Result_Food alloc] init];
    food.icon = [UIImage imageNamed:@"m2.jpg"];
    food.foodName = @"蒸饺";
    food.info = @"就阿克苏的积分卡洛斯";
    food.shopName = @"每家";
    food.price = @"21";
    food.fav = @"23";
    [food_dataArray addObject:food];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (isPerson) {
        return person_dataArray.count;
    }
    return food_dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isPerson) {
        return 50;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isPerson) {
        static NSString *cellIdentifier = @"search_result_user";
        SearchResultPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        Result_Person *md = [person_dataArray objectAtIndex:indexPath.row];
        
        cell.userName.text = md.user;
        cell.shopName.text = md.shop;
        cell.address.text = md.address;
        cell.icon.image = md.icon;
        
        if(!cell)
        {
            @throw ([NSException exceptionWithName:@"CellIsNilException" reason:@"Cell is nil!" userInfo:nil]);
        }
        
        return cell;
    }else{
        static NSString *cellIdentifier = @"search_result_food";
        SearchShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        Result_Food *md = [food_dataArray objectAtIndex:indexPath.row];
        
        cell.icon.image = md.icon;
        cell.foodName.text = md.foodName;
        cell.info.text = md.info;
        cell.shopName.text = md.shopName;
        cell.price.text = md.price;
        cell.fav.text = md.fav;
        
        if(!cell)
        {
            @throw ([NSException exceptionWithName:@"CellIsNilException" reason:@"Cell is nil!" userInfo:nil]);
        }
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isPerson) {
        
    }else{
        SingleFoodViewController *controller = [[SingleFoodViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end

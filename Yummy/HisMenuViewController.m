//
//  HisMenuViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/20.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "HisMenuViewController.h"
#import "TableViewFullScreenController.h"
#import "HisMenuTableViewCell.h"
#import "MenuDetailData.h"
#import "MakeOrderViewController.h"

@interface HisMenuViewController ()
{
    NSMutableArray *data;
    TableViewFullScreenController *fullScreenController;
    NSMutableArray *transferData;
}
@end

@implementation HisMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [NSMutableArray arrayWithCapacity:0];
    fullScreenController = [[TableViewFullScreenController alloc] initWithViewController:self];
    [self makeDummy];
}

- (void)makeDummy{
    for (int i=0; i<20; i++) {
        MenuDetailData *dd = [[MenuDetailData alloc] init];
        dd.pic = [UIImage imageNamed:@"m2.jpg"];
        dd.name = @"自制凤爪";
        dd.desc = @"拥有百年历史";
        dd.favNo = @"120";
        dd.price = @"35";
        dd.count = @"0";
        [data addObject:dd];
    }
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"fromMenuToOrder"]) {
        MakeOrderViewController *controller = segue.destinationViewController;
        [controller setOrder:transferData];
    }
}

- (IBAction)onClickOrder:(id)sender{
    if (transferData.count>0) {
        [transferData removeAllObjects];
        transferData = nil;
    }
    transferData = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<data.count; i++) {
        MenuDetailData *md = [data objectAtIndex:i];
        int count = [md.count intValue];
        if (count>0) {
            [transferData addObject:md];
        }
    }
    if (transferData.count==0) {
        //TODO
    }else{
        [self performSegueWithIdentifier:@"fromMenuToOrder" sender:self];
    }
}

- (IBAction)onClickAdd:(id)sender{
    UIButton *cell = (UIButton*)sender;
    MenuDetailData *md = [data objectAtIndex:cell.tag];
    
    int count = [md.count intValue];
    count++;
    md.count = [NSString stringWithFormat:@"%d",count];
    [self.tableView reloadData];
}

- (IBAction)onClickMinus:(id)sender{
    UIButton *cell = (UIButton*)sender;
    MenuDetailData *md = [data objectAtIndex:cell.tag];
    
    int count = [md.count intValue];
    count--;
    if (count<0) {
        count = 0;
    }
    md.count = [NSString stringWithFormat:@"%d",count];
    [self.tableView reloadData];
}

#pragma  mark TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"his_menu_cell";
    HisMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    MenuDetailData *md = [data objectAtIndex:indexPath.row];
    
    cell.menuIcon.image = md.pic;
    cell.menuName.text = md.name;
    cell.menuInfo.text = md.desc;
    cell.favNum.text = md.favNo;
    cell.price.text = md.price;
    cell.count.text = md.count;
    
    cell.addBtn.tag = indexPath.row;
    cell.minusBtn.tag = indexPath.row;
    
    if(!cell)
    {
        @throw ([NSException exceptionWithName:@"CellIsNilException" reason:@"Cell is nil!" userInfo:nil]);
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [fullScreenController scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [fullScreenController scrollViewDidScroll:scrollView];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"------should scroll to top");
    return [fullScreenController scrollViewShouldScrollToTop:scrollView];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"-------did scroll to top");
    [fullScreenController scrollViewDidScrollToTop:scrollView];
}
@end

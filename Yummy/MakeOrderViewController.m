//
//  MakeOrderViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/21.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "MakeOrderViewController.h"
#import "HisMenuTableViewCell.h"
#import "MenuDetailData.h"
#import "OrderFooterTableViewCell.h"

@implementation MakeOrderViewController{
    NSMutableArray *dataArray;
    NSString *countString;
    NSString *costString;
    UIDatePicker *datePicker;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    datePicker = [[UIDatePicker alloc] init];
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    datePicker.datePickerMode = UIDatePickerModeDate;

    NSDate* minDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDate* maxDate = [[NSDate alloc] initWithTimeIntervalSinceNow:60*60*24*30];

    [datePicker setMinimumDate:minDate];
    [datePicker setMaximumDate:maxDate];
    
    self.dateField.inputView = datePicker;
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                          action:@selector(onClickDate:)];
    toolBar.items = [NSArray arrayWithObject:right];
    self.dateField.inputAccessoryView = toolBar;
}

- (IBAction)onClickDate:(id)sender{
    [self.dateField resignFirstResponder];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:datePicker.locale];
    [formatter setDateFormat:dateFormat];
    [formatter setLocale:datePicker.locale];
    
    self.dateField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
}

- (void)setOrder:(NSMutableArray*)array{
    dataArray = [NSMutableArray arrayWithCapacity:0];
    dataArray = array;
    int count = 0;
    int cost = 0;
    for (int i=0; i<dataArray.count; i++) {
        MenuDetailData *data = [dataArray objectAtIndex:i];
        count += [data.count intValue];
        cost += [data.price intValue]*[data.count intValue];
    }
    
    countString = [NSString stringWithFormat:@"x %d",count];
    costString = [NSString stringWithFormat:@"%d",cost];
    [self.tableView reloadData];
}

- (IBAction)onClickChangeBuyWay:(id)sender{
    
}

- (IBAction)onClickChangeDate:(id)sender{
    
}

- (IBAction)onClickAddComments:(id)sender{
    
}

- (IBAction)onClickAdd:(id)sender{
    UIButton *cell = (UIButton*)sender;
    MenuDetailData *md = [dataArray objectAtIndex:cell.tag];
    
    int count = [md.count intValue];
    count++;
    md.count = [NSString stringWithFormat:@"%d",count];
    [self.tableView reloadData];
}

- (IBAction)onClickMinus:(id)sender{
    UIButton *cell = (UIButton*)sender;
    MenuDetailData *md = [dataArray objectAtIndex:cell.tag];
    
    int count = [md.count intValue];
    count--;
    if (count<0) {
        count = 0;
    }
    md.count = [NSString stringWithFormat:@"%d",count];
    [self.tableView reloadData];
}

- (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

#pragma mark UITableView delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"order_his_menu_cell";
    HisMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    MenuDetailData *md = [dataArray objectAtIndex:indexPath.row];
    
    cell.menuIcon.image = md.pic;
    cell.menuName.text = md.name;
    cell.menuInfo.text = md.desc;
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
    return dataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    OrderFooterTableViewCell *footer = [[[NSBundle mainBundle] loadNibNamed:@"OrderFooter" owner:self options:nil] objectAtIndex:0];
    
    if( footer ) {
        footer.count.text = countString;
        footer.price.text = costString;
        return footer;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}
@end

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
    UIPickerView *datePicker;
    
    NSMutableArray *dateArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    datePicker = [[UIPickerView alloc] init];
//    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
//    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.dataSource = self;
    datePicker.delegate = self;

//    NSDate* minDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
//    NSDate* maxDate = [[NSDate alloc] initWithTimeIntervalSinceNow:60*60*24*30];
//
//    [datePicker setMinimumDate:minDate];
//    [datePicker setMaximumDate:maxDate];
    
    self.dateField.inputView = datePicker;
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                          action:@selector(onClickDate:)];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                                                                          action:@selector(onClickCancel:)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    label.text = @"可选送达日期";
    label.textAlignment = NSTextAlignmentCenter;
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithCustomView:label];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];

    toolBar.items = [NSArray arrayWithObjects:left,flexSpace,title,flexSpace,right,nil];
    self.dateField.inputAccessoryView = toolBar;
    
    dateArray = [NSMutableArray arrayWithCapacity:0];
    
    for ( int i=0; i<31; i++) {
        NSDate*date = [NSDate dateWithTimeIntervalSinceNow:i*(24*60*60)];
        NSCalendar*calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps =[calendar components:(NSMonthCalendarUnit |NSDayCalendarUnit |NSWeekdayCalendarUnit)
                                  
                                             fromDate:date];
        
        NSInteger month = [comps month];
        
        NSInteger day = [comps day];
        
        NSInteger weekday = [comps weekday];
        
        NSString *time = [NSString stringWithFormat:@"%ld月%ld日",(long)month,(long)day];
        
        if (i==0) {
            [dateArray addObject:[NSString stringWithFormat:@"%@ 今天",time]];
        }else if(i==1){
            [dateArray addObject:[NSString stringWithFormat:@"%@ 明天",time]];
        }else{
            NSString *temp = @"";
            switch (weekday) {
                case 1:
                    temp = @"日";
                    break;
                case 2:
                    temp = @"一";
                    break;
                case 3:
                    temp = @"二";
                    break;
                case 4:
                    temp = @"三";
                    break;
                case 5:
                    temp = @"四";
                    break;
                case 6:
                    temp = @"五";
                    break;
                case 7:
                    temp = @"六";
                    break;
                case 8:
                    temp = @"日";
                    break;
                default:
                    temp = @"一";
                    break;
            }
             NSString *week = [NSString stringWithFormat:@"%@ 周%@",time,temp];
            [dateArray addObject:week];
        }
       
    }
}

- (IBAction)onClickCancel:(id)sender{
    [self.dateField resignFirstResponder];
}

- (IBAction)onClickDate:(id)sender{
    [self.dateField resignFirstResponder];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:datePicker.locale];
//    [formatter setDateFormat:dateFormat];
//    [formatter setLocale:datePicker.locale];
//    
//    self.dateField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
}

- (IBAction)onClickMakeOrder:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保障" message:@"交易" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
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

#pragma mark UIPickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 31;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [dateArray objectAtIndex:row];
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
#pragma mark UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        //TODO 支付宝
        
    }
}
@end

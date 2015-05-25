//
//  ClerkInfoViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/18.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "ClerkInfoViewController.h"
#import "MarkTableViewCell.h"
#import "DetailClerk.h"
#import "MarkData.h"
#import "UIImage+Blur.h"
#import "CommonUtils.h"
#import "TitleMarksOfClerk.h"
#import "ClerkDetailInfoTableViewCell.h"

@interface ClerkInfoViewController ()
{
    NSMutableArray *data;
    NSString *totalMarksNumber;
    UILabel *label;
    
    float cellHeight;
}

@end

@implementation ClerkInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [NSMutableArray arrayWithCapacity:0];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(40, 75, self.view.frame.size.width-50, 0)];
    [label setNumberOfLines:0];
    label.textColor = [UIColor redColor];
    label.font = [UIFont fontWithName:@"Arial" size:14.0f];
    label.text = @"阿斯顿福建拉设计的发送到了福建；撒娇的；法律按时；来得及发；阿拉斯加的链接发；老实交代；垃圾死了的激发了；时间地方就；阿斯顿记录阿里山的家里附近啊；" ;
    int height = [CommonUtils heightForLabel:label width:(self.view.frame.size.width-50)];
    
    CGRect frame = label.frame;
    frame.size.height = height;
    label.frame = frame;
    
    [self makeDummy];
}

- (void)makeDummy{
    for (int i=0; i<50; i++) {
        MarkData *md = [[MarkData alloc] init];
        md.name = @"东方朔";
        md.date = @"2015-05-11";
        md.words = @"阿什利的法律上看的减肥啦手机的；了房间爱死了";
        md.icon = [UIImage imageNamed:@"1.jpg"];
        [data addObject:md];
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

- (IBAction)onClickRightBtn:(id)sender{

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        static NSString *cellIdentifer = @"top_clerk_info_cell";
        ClerkDetailInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        
        cell.userIcon.image = [UIImage imageNamed:@"2.jpg"];
        
        UIImage *image = [UIImage imageNamed:@"2.jpg"];
        cell.backIcon.image = [image blurImageWithBlur:0.3 exclusionPath:nil];
        
        [cell.infoView addSubview:label];
        
        CGRect frame = cell.infoView.frame;
        frame.size.height = label.frame.origin.y + label.frame.size.height + 5;
        cell.infoView.frame = frame;
        
        frame = cell.frame;
        frame.size.height = cell.infoView.frame.origin.y + cell.infoView.frame.size.height;
        cell.frame = frame;
        
        cellHeight = frame.size.height;
        
        [cell.btn1 addTarget:self action:@selector(backToFront:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else{
        static NSString *cellIdentifier = @"marks_cell";
        MarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        MarkData *mark = [data objectAtIndex:indexPath.row];
        
        cell.icon.image = mark.icon;
        cell.name.text = mark.name;
        cell.date.text = mark.date;
        cell.words.text = mark.words;
        cell.icon.layer.cornerRadius = 20;
        cell.icon.layer.masksToBounds = YES;
        
        if(!cell)
        {
            @throw ([NSException exceptionWithName:@"CellIsNilException" reason:@"Cell is nil!" userInfo:nil]);
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        //UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cellHeight;
    }
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }
    TitleMarksOfClerk *header = [[[NSBundle mainBundle] loadNibNamed:@"MarksOfClerkNib" owner:self options:nil] objectAtIndex:0];
    
    if( header ) {
        header.numberOfComments.text = [NSString stringWithFormat:@"共%lu条",(unsigned long)data.count];
        
        return header;
    }
    return nil;
}

@end

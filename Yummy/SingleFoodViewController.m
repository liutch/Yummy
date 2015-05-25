//
//  SingleFoodViewController.m
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "SingleFoodViewController.h"
#import "SingleFoodCollectionViewCell.h"
#import "CommonUtils.h"

@interface SingleFoodViewController ()
{
    NSMutableArray *picArray;
}

@end

@implementation SingleFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    picArray = [NSMutableArray arrayWithCapacity:0];
}

- (void)addMoreDetail{
    UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(10, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 5, self.view.frame.size.width-15, 0)];
    [detail setNumberOfLines:0];
    detail.textColor = [UIColor redColor];
    detail.font = [UIFont fontWithName:@"Arial" size:14.0f];
    detail.text = @"阿斯顿福建拉设计的发送到了福建；撒娇的；法律按时；来得及发；阿拉斯加的链接发；老实交代；垃圾死了的激发了；时间地方就；阿斯顿记录阿里山的家里附近啊；" ;
    int height = [CommonUtils heightForLabel:detail width:(self.view.frame.size.width-25)];
    
    CGRect frame = detail.frame;
    frame.size.height = height;
    detail.frame = frame;
    
    [self.scrollView addSubview:detail];
    
    CGSize contentSize = self.scrollView.contentSize;
    contentSize.height = detail.frame.origin.y + detail.frame.size.height + 10;
    self.scrollView.contentSize = contentSize;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self addMoreDetail];
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [picArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SingleFoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"single_food_collection" forIndexPath:indexPath];
    
    UIImage *data = [picArray objectAtIndex:indexPath.row];
    cell.icon.image = data;
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}

@end

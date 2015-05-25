//
//  SingleFoodViewController.h
//  Yummy
//
//  Created by Tyler on 15/5/25.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "UIBaseViewController.h"

@interface SingleFoodViewController : UIBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic,weak) IBOutlet UILabel *foodName;
@property (nonatomic,weak) IBOutlet UILabel *express;
@property (nonatomic,weak) IBOutlet UILabel *price;
@property (nonatomic,weak) IBOutlet UILabel *unit;
@property (nonatomic,weak) IBOutlet UILabel *personNumber;
@property (nonatomic,weak) IBOutlet UIImageView *icon;

@property (nonatomic,weak) IBOutlet UILabel *titleLabel;
@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;
@end

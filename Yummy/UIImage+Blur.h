//
//  UIImage+Blur.h
//  Yummy
//
//  Created by Tyler on 15/5/19.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Blur)

-(UIImage *)blurImageWithBlur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath;

@end

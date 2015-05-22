//
//  UIFont+Extensions.m
//  BaseFrame
//
//  Created by Navinfo on 13-10-11.
//  Copyright (c) 2013年 Navinfo. All rights reserved.
//

#import "UIFont+Extensions.h"

@implementation UIFont (Extensions)

+ (UIFont *) homeHeader{
    return [self Type05];
}

+ (UIFont *) Type01 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:80];
}

+ (UIFont *) Type02 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:60];
}

+ (UIFont *) Type03 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:28];
}

+ (UIFont *) Type04 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:26];
}

+ (UIFont *) Type05 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:24];
}

+ (UIFont *) Type06 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:18];
}

+ (UIFont *) Type07 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:14];
}

+ (UIFont *) Type08 {
	return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:10];
}

// Bold
+ (UIFont *) Type09 {
	return [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];
}

+ (UIFont *) Type10 {
	return [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
}

// Medium
+ (UIFont *) Type11 {
	return [UIFont fontWithName:@"HelveticaNeue-Medium" size:14];
}

// Regular
+ (UIFont *) Type12 {
	return [UIFont fontWithName:@"HelveticaNeue" size:16];
}

@end

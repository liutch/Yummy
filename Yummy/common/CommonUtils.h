//
//  CommonUtils.h
//  OBDProj
//
//  Created by Liutiecheng on 14-4-15.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CommonUtils : NSObject

+ (UIImage *)resizeImage:(UIImage*)image toSize:(CGSize)newSize;

+ (void)saveImage:(UIImage*)image withName:(NSString*)name;

+ (UIImage*)loadImageWithName:(NSString*)name;

+ (void)addTextFieldAccessory:(UIViewController*)controller textField:(UITextField *)tv fun:(SEL)function;

+ (void)addTextViewAccessory:(UIViewController*)controller textView:(UITextView*)tv fun:(SEL)function;

+ (void)showSimpleAlert:(NSString*)title _message:(NSString*)message _cancelBtn:(NSString*)cancel _otherBtn:(NSString*)other;

+ (void)showSimpleDelegateAlert:(NSString*)title _message:(NSString*)message _cancelBtn:(NSString*)cancel _otherBtn:(NSString*)other _delegate:(id)delegate;

+ (NSString*)UTF8_To_GB2312:(NSString*)utf8string;

+ (NSString*)getCurrentFormatDate:(NSString*)dateFormate;

+ (void)saveUserDefault:(NSString*)value _key:(NSString*)key;

+ (NSString*)getUserDefaultWithKey:(NSString*)key;

+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;

+ (BOOL)checkDesignDirWithName:(NSString*)imageName;

+(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;

+ (BOOL)checkDir:(NSString*)directoryPath _name:(NSString*)imageName;

+(BOOL)checkNetwork;

+(void)makeTelPhone:(NSString*)number;

+ (void)expandMapView:(MKMapView*)mapView _lat:(float)lat _lon:(float)lon;

+ (CLLocationDistance)getDistanceBetween:(CLLocation*)start _end:(CLLocation*)end;

+ (NSString*)getDistanceFrom:(CLLocationCoordinate2D)from _to:(CLLocationCoordinate2D)to;

+ (NSString*)formatDate:(NSDate *)date;

+ (UIViewController *)getTopViewController;

+ (void)showLoginAlert;
+ (void)showNoCarAlert;
//匹配字母+数字
+ (BOOL)checkNumberABC:(NSString*)test;
//匹配电话号码
+ (BOOL)checkTelNumber:(NSString*)tel;
//匹配字母数字汉字
+ (BOOL)checkNumberAbcCN:(NSString*)string;
//是否是int
+ (BOOL)isPureInt:(NSString *)string;
//获取view中得截图
+ (UIImage *)getScreenshot:(UIView*)view;

+ (int) heightForLabel:(UILabel*)label width:(int)width;
@end

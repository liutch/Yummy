//
//  CommonUtils.m
//  OBDProj
//
//  Created by Liutiecheng on 14-4-15.
//  Copyright (c) 2014年 Liutiecheng. All rights reserved.
//

#import "CommonUtils.h"
#import "Reachability.h"

@implementation CommonUtils

+ (UIImage *)resizeImage:(UIImage*)image toSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (void)saveImage:(UIImage*)image withName:(NSString*)name{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:name];
    [imageData writeToFile:fullPath atomically:NO];
}

+ (UIImage*)loadImageWithName:(NSString*)name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:name];
    UIImage *result = [UIImage imageWithContentsOfFile:filePath];
    return result;
}

+ (BOOL)deleteImageWithName:(NSString*)name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:name];
    BOOL bExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (bExist) {
        BOOL bSuccess = [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        return bSuccess;
    }
    return NO;
}

+ (void)addTextFieldAccessory:(UIViewController*)controller textField:(UITextField *)tv fun:(SEL)function{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((320-85)/2, 0, 85, 25)];
    [btn setImage:[UIImage imageNamed:@"kb_top"] forState:UIControlStateNormal];
    [btn addTarget:controller action:function forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn];
    [tv setInputAccessoryView:topView];
}

+ (void)addTextViewAccessory:(UIViewController*)controller textView:(UITextView*)tv fun:(SEL)function{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((320-85)/2, 0, 85, 25)];
    [btn setImage:[UIImage imageNamed:@"kb_top"] forState:UIControlStateNormal];
    [btn addTarget:controller action:function forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn];
    [tv setInputAccessoryView:topView];
}

+ (void)showSimpleAlert:(NSString*)title _message:(NSString*)message _cancelBtn:(NSString*)cancel _otherBtn:(NSString*)other{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title  message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:other, nil];
    [alert show];
}

+ (void)showSimpleDelegateAlert:(NSString*)title _message:(NSString*)message _cancelBtn:(NSString*)cancel _otherBtn:(NSString*)other _delegate:(id)delegate{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title  message:message delegate:delegate cancelButtonTitle:cancel otherButtonTitles:other, nil];
    [alert show];
}

+ (NSString*)UTF8_To_GB2312:(NSString*)utf8string
{
    NSStringEncoding encoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* gb2312data = [utf8string dataUsingEncoding:encoding];
    return [[NSString alloc] initWithData:gb2312data encoding:encoding];
}

+ (NSString*)getCurrentFormatDate:(NSString*)dateFormate{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:dateFormate];
    return [dateformatter stringFromDate:senddate];
}

+ (void)saveUserDefault:(NSString*)value _key:(NSString*)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+ (NSString*)getUserDefaultWithKey:(NSString*)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults valueForKey:key];
}

+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString* documentsDirectory = [paths objectAtIndex:0];
    if ([self checkDir:documentsDirectory _name:imageName]) {
        //如果目录下有数据，则返回空路径
        return nil;
    }
    NSLog(@"-----> document = %@",paths);
    
    NSData* imageData;
    
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(tempImage)) {
        //返回为png图像。
        imageData = UIImagePNGRepresentation(tempImage);
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage, 1.0);
    }
   
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",imageName]];
    NSLog(@"---------->fullpath = %@",fullPathToFile);
//    NSArray *nameAry=[fullPathToFile componentsSeparatedByString:@"/"];
    
    [imageData writeToFile:fullPathToFile atomically:NO];
    return fullPathToFile;
}

+ (BOOL)checkDesignDirWithName:(NSString*)imageName{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString* documentsDirectory = [paths objectAtIndex:0];
    return [self checkDir:documentsDirectory _name:imageName];
}

+ (BOOL)checkDir:(NSString*)directoryPath _name:(NSString*)imageName{
    NSLog(@"-->check dir img=%@",imageName);
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL dirExisted = [fileManager fileExistsAtPath:directoryPath isDirectory:&isDir];
    if ( isDir==YES && dirExisted==YES ) {
        NSString *imagePath = [directoryPath stringByAppendingString:[NSString stringWithFormat:@"/%@",imageName]];
        NSLog(@"==========>imagePath = %@",imagePath);
        BOOL fileExisted = [fileManager fileExistsAtPath:imagePath];
        return fileExisted;
    }else{
        NSLog(@"---------->no image");
        return false;
    }
}

+(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    
    return result;
}

+(BOOL)checkNetwork{
    BOOL result = true;
    if(![Reachability isReachable]){
        [CommonUtils showSimpleAlert:@"警告" _message:@"信号飞走了，请再试一下吧！" _cancelBtn:@"确认" _otherBtn:nil];
        result = false;
    }
    return result;
}

+(void)makeTelPhone:(NSString*)number{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",number];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

+ (void)expandMapView:(MKMapView*)mapView _lat:(float)lat _lon:(float)lon{
    CLLocationCoordinate2D coord = {lat,lon};
    
    //设置显示范围
    MKCoordinateSpan span = MKCoordinateSpanMake(0.0045f, 0.0045f);
    
    //设置地图显示的中心和范围
    MKCoordinateRegion region = MKCoordinateRegionMake(coord,span);
    [mapView setRegion:region animated:YES];
}

+ (CLLocationDistance)getDistanceBetween:(CLLocation*)start _end:(CLLocation*)end{
    // 计算距离
    CLLocationDistance meters=[start distanceFromLocation:end];
    return meters;
}

+ (NSString*)getDistanceFrom:(CLLocationCoordinate2D)from _to:(CLLocationCoordinate2D)to{
    CLLocation *start = [[CLLocation alloc] initWithCoordinate:from altitude:0 horizontalAccuracy:0 verticalAccuracy:0 timestamp:0];
    CLLocation *end = [[CLLocation alloc] initWithCoordinate:to altitude:0 horizontalAccuracy:0 verticalAccuracy:0 timestamp:0];
    NSString *distance = [NSString stringWithFormat:@"%0.1f",[CommonUtils getDistanceBetween:start _end:end]];
    return distance;
}

+ (NSString*)formatDate:(NSDate *)date
{
    // A convenience method that formats the date in Month-Year format
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"y MMMM";
    return [formatter stringFromDate:date];
}

+ (UIViewController *)getTopViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
        NSLog(@"-------> %@",[topVC class]);
    }
    return topVC;
}

+ (void)showLoginAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"  message:@"请登录正式账号后再使用。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
+ (void)showNoCarAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"  message:@"绑定车辆后再使用。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

+ (BOOL)checkNumberABC:(NSString*)test{
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL ret=[pred evaluateWithObject:test];
  
    return ret;
}

+ (BOOL)checkTelNumber:(NSString*)tel{
    NSString *regex = @"1\\d{10}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:tel];
}

+ (BOOL)checkNumberAbcCN:(NSString*)string{
    NSString *regex = @"^[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}

+ (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (UIImage *)getScreenshot:(UIView*)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // helps w/ our colors when blurring
    // feel free to adjust jpeg quality (lower = higher perf)
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

+ (int) heightForLabel:(UILabel*)label width:(int)width
{
    if (label==nil || width==0) {
        return 0;
    }
    
    CGSize deSize = [label sizeThatFits:CGSizeMake(width,CGFLOAT_MAX)];
    
    return deSize.height;
}


@end

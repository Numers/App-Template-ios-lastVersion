//
//  UIColor+HexString.m
//  DigitalSense
//
//  Created by baolicheng on 16/7/20.
//  Copyright © 2016年 RenRenFenQi. All rights reserved.
//

#import "UIColor+HexString.h"

@implementation UIColor (HexString)
// Assumes input like "#00FF00" (#RRGGBB).
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end

//
//  UINavigationController+NavigationBar.m
//  GLPFinance
//
//  Created by 鲍利成 on 2016/11/23.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import "UINavigationController+NavigationBar.h"
#define TitleColor [UIColor whiteColor]
@implementation UINavigationController (NavigationBar)
-(void)setNavigationViewColor:(UIColor *)color;
{
    [self.navigationBar setBackgroundImage:[self imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.tintColor = TitleColor;
    self.navigationBar.translucent = YES;
    [self setStatusBarStyle:UIStatusBarStyleDefault];
    [self adaptTitle:TitleColor];
}

-(UIImage*) imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)setTranslucentView
{
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    [self adaptTitle:TitleColor];
    self.navigationBar.tintColor = TitleColor;
    [self setStatusBarStyle:UIStatusBarStyleDefault];
}

-(void)adaptTitle:(UIColor *)color
{
    UIFont *font;
    font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
    [self setTitleTextColor:color WithFont:font];
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

-(void)setTitleTextColor:(UIColor *)color WithFont:(UIFont *)font
{
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :color,NSFontAttributeName:font}];
}

-(void)setStatusBarStyle:(UIStatusBarStyle)style
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarStyle:style animated:NO];
}

@end

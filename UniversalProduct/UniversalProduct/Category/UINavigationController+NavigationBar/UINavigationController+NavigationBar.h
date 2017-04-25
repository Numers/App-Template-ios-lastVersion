//
//  UINavigationController+NavigationBar.h
//  GLPFinance
//
//  Created by 鲍利成 on 2016/11/23.
//  Copyright © 2016年 鲍利成. All rights reserved.
//



@interface UINavigationController (NavigationBar)
-(void)setNavigationViewColor:(UIColor *)color;
-(void)setTitleTextColor:(UIColor *)color WithFont:(UIFont *)font;
-(void)setStatusBarStyle:(UIStatusBarStyle)style;
-(void)setTranslucentView;
@end

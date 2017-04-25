//
//  UPLoginScrollViewController.m
//  UniversalProduct
//
//  Created by 鲍利成 on 2017/4/24.
//  Copyright © 2017年 鲍利成. All rights reserved.
//

#import "UPLoginScrollViewController.h"
#import "AppStartManager.h"
#import "UPLoginViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface UPLoginScrollViewController ()<UPLoginViewProtocol>
{
    UPLoginViewController *loginVC;
    TPKeyboardAvoidingScrollView *scrollView;
}

@end

@implementation UPLoginScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:ViewBackgroundMainColor];
    
    scrollView = [[TPKeyboardAvoidingScrollView alloc] init];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:scrollView];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    loginVC = [storyboard instantiateViewControllerWithIdentifier:@"UPLoginViewIdentify"];
    loginVC.delegate = self;
    [scrollView addSubview:loginVC.view];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"账户登录";
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [scrollView setFrame:CGRectMake(0, 0, GDeviceWidth, GDeviceHeight)];
    [loginVC.view setFrame:CGRectMake(0, 0, GDeviceWidth, GDeviceHeight)];
    [scrollView setContentSize:CGSizeMake(GDeviceWidth, GDeviceHeight)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark LoginViewProtocol
-(void)loginSuccess
{
    [[AppStartManager shareManager] pushHomeViewWithSelectIndex:0];
}
@end

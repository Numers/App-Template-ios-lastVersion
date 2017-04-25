//
//  UPUserCenterViewController.m
//  UniversalProduct
//
//  Created by 鲍利成 on 2017/4/24.
//  Copyright © 2017年 鲍利成. All rights reserved.
//

#import "UPUserCenterViewController.h"

#import "UPResetPasswordViewController.h"

@interface UPUserCenterViewController ()

@end

@implementation UPUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark IBAction
-(IBAction)clickPushBtn:(id)sender
{
    UPResetPasswordViewController *resetPasswordVC = [self.storyboard instantiateViewControllerWithIdentifier:@"UPResetPasswordViewIdentify"];
    [resetPasswordVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:resetPasswordVC animated:YES];
}
@end

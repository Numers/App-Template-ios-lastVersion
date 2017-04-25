//
//  UPResetPasswordViewController.m
//  UniversalProduct
//
//  Created by 鲍利成 on 2017/4/24.
//  Copyright © 2017年 鲍利成. All rights reserved.
//

#import "UPResetPasswordViewController.h"
#import "AppStartManager.h"

@interface UPResetPasswordViewController ()

@end

@implementation UPResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark IBAction
-(IBAction)clickLoginoutBtn:(id)sender
{
    [[AppStartManager shareManager] loginout];
}

@end

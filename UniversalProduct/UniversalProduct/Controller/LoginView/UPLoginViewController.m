//
//  UPLoginViewController.m
//  UniversalProduct
//
//  Created by 鲍利成 on 2017/4/24.
//  Copyright © 2017年 鲍利成. All rights reserved.
//

#import "UPLoginViewController.h"

@interface UPLoginViewController ()

@end

@implementation UPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark IBAction
-(IBAction)clickLoginBtn:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(loginSuccess)]) {
        [self.delegate loginSuccess];
    }
}
@end

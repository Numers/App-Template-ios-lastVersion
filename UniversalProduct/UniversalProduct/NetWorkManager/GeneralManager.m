//
//  GFGeneralManager.m
//  GLPFinance
//
//  Created by 鲍利成 on 16/10/28.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import "GeneralManager.h"
static GeneralManager *generalManager;
@implementation GeneralManager
+(id)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (generalManager == nil) {
            generalManager = [[GeneralManager alloc] init];
        }
    });
    
    return generalManager;
}

-(void)getGlovalVarWithVersion
{
    [AppUtils setUrlWithState:YES];
}
@end

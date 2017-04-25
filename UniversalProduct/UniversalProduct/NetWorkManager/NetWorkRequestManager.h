//
//  NetWorkRequestManager.h
//
//  Created by 鲍利成 on 2016/12/15.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkManager.h"

@interface NetWorkRequestManager : NSObject
+(instancetype)shareManager;
-(void)get:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify;
-(void)post:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify;
-(void)put:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify;
-(void)uploadImage:(UIImage *)image uri:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify;
@end

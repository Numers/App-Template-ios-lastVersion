//
//  NetWorkManager.h
//  GLPFinance
//
//  Created by 鲍利成 on 16/10/28.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkHelper.h"
@interface NetWorkManager : NSObject
+(id)defaultManager;
-(void)post:(NSString *)uri parameters:(id)parameters success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed;

-(void)get:(NSString *)uri parameters:(id)parameters success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed;

-(void)put:(NSString *)uri parameters:(id)parameters success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed;

- (void)downloadFileWithOption:(NSDictionary *)paramDic
                 withInferface:(NSString*)requestURL
                     savedPath:(NSString*)savedPath
               downloadSuccess:(ApiSuccessCallback)success
               downloadFailure:(ApiFailedCallback)failure
                      progress:(ApiDownloadFileProgress)progress;

-(void)uploadImage:(UIImage *)image uri:(NSString *)uri parameters:(id)parameters  success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed;
@end

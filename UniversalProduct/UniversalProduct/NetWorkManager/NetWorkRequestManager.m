//
//  NetWorkRequestManager.m
//  GLPFinance
//
//  Created by 鲍利成 on 2016/12/15.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import "NetWorkRequestManager.h"
#import "AppStartManager.h"
static NSDictionary *apiCodeDic;
@implementation NetWorkRequestManager
+(instancetype)shareManager
{
    static NetWorkRequestManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[NetWorkRequestManager alloc] init];
        }
        [self apiCodeDictionary];
    });
    return manager;
}

+(void)apiCodeDictionary
{
    apiCodeDic = @{
                   GF_Login_API         : @(69100),
                   GF_PasswordReset_API : @(69101),
                   GF_MessageSend_API   : @(69102),
                   GF_CheckList_API     : @(69106),
                   GF_CheckInfo_API     : @(69107),
                   GF_UploadMaterialInfo_API : @(69110),
                   GF_Audit_API         : @(69108),
                   GF_UploadPicture_API : @(69103),
                   GF_HeadImageSet_API  : @(69104),
                   GF_Feedback_API      : @(69105),
                   GF_LoanInfo_API      : @(69111)
                   };
}

-(NSDictionary *)generateRequestParameters:(NSDictionary *)parameters code:(NSNumber *)code
{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:code forKey:@"code"];
    [para setObject:@"ok" forKey:@"msg"];
    [para setObject:@(1) forKey:@"status"];
    if (parameters == nil) {
        parameters = [NSDictionary dictionary];
    }
    [para setObject:parameters forKey:@"data"];
    return para;
}

-(NSDictionary *)analyzedResponse:(NSDictionary *)responseObject code:(NSNumber *)code isNotify:(BOOL)isNotify
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (responseObject) {
        NSInteger c = [[responseObject objectForKey:@"code"] integerValue];
        if (c == [code integerValue]) {
            NSInteger status = [[responseObject objectForKey:@"status"] integerValue];
            [result setObject:@(status) forKey:@"status"];
            if (status == 1) {
                id dataDic = [responseObject objectForKey:@"data"];
                [result setObject:dataDic forKey:@"data"];
                return result;
            }else{
                if (isNotify) {
                    [AppUtils showInfo:[responseObject objectForKey:@"msg"]];
                }
                return result;
            }
        }else if(c == 208){
            [AppUtils showInfo:[responseObject objectForKey:@"msg"]];
            [[AppStartManager shareManager] loginout];
        }else{
            [AppUtils showInfo:@"请求返回的code码不一致"];
            return nil;
        }
    }
    return nil;
}

-(void)get:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify
{
    NSNumber *code = [apiCodeDic objectForKey:uri];
    if (code == nil) {
        [AppUtils showInfo:@"uri未发现"];
    }else{
        NSDictionary *para = [self generateRequestParameters:parameters code:code];
        [[NetWorkManager defaultManager] get:uri parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *resultDic = [self analyzedResponse:responseObject code:code isNotify:isNotify];
            if (resultDic) {
                id data = [resultDic objectForKey:@"data"];
                NSNumber *status = [resultDic objectForKey:@"status"];
                callback(status,data);
            }
        } failed:^(NSURLSessionDataTask *task, NSError *error) {
            if (isNotify) {
                [AppUtils showInfo:[error localizedDescription]];
            }
            callback(nil,nil);
        }];
    }
    
}

-(void)post:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify
{
    NSNumber *code = [apiCodeDic objectForKey:uri];
    if (code == nil) {
        [AppUtils showInfo:@"uri未发现"];
    }else{
        NSDictionary *para = [self generateRequestParameters:parameters code:code];
        [[NetWorkManager defaultManager] post:uri parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *resultDic = [self analyzedResponse:responseObject code:code isNotify:isNotify];
            if (resultDic) {
                id data = [resultDic objectForKey:@"data"];
                NSNumber *status = [resultDic objectForKey:@"status"];
                callback(status,data);
            }
        }failed:^(NSURLSessionDataTask *task, NSError *error) {
            if (isNotify) {
                [AppUtils showInfo:[error localizedDescription]];
            }
            callback(nil,nil);
        }];
    }
}

-(void)put:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify
{
    NSNumber *code = [apiCodeDic objectForKey:uri];
    if (code == nil) {
        [AppUtils showInfo:@"uri未发现"];
    }else{
        NSDictionary *para = [self generateRequestParameters:parameters code:code];
        [[NetWorkManager defaultManager] put:uri parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *resultDic = [self analyzedResponse:responseObject code:code isNotify:isNotify];
            if (resultDic) {
                id data = [resultDic objectForKey:@"data"];
                NSNumber *status = [resultDic objectForKey:@"status"];
                callback(status,data);
            }
        }failed:^(NSURLSessionDataTask *task, NSError *error) {
            if (isNotify) {
                [AppUtils showInfo:[error localizedDescription]];
            }
            callback(nil,nil);
        }];
    }
}

-(void)uploadImage:(UIImage *)image uri:(NSString *)uri parameters:(id)parameters callback:(APIRequstCallBack)callback isNotify:(BOOL)isNotify
{
    NSNumber *code = [apiCodeDic objectForKey:uri];
    if (code == nil) {
        [AppUtils showInfo:@"uri未发现"];
    }else{
        [[NetWorkManager defaultManager] uploadImage:image uri:uri parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *resultDic = [self analyzedResponse:responseObject code:code isNotify:isNotify];
            if (resultDic) {
                id data = [resultDic objectForKey:@"data"];
                NSNumber *status = [resultDic objectForKey:@"status"];
                callback(status,data);
            }
        } failed:^(NSURLSessionDataTask *task, NSError *error) {
            if (isNotify) {
                [AppUtils showInfo:[error localizedDescription]];
            }
            callback(nil,nil);
        }];
    }
}
@end

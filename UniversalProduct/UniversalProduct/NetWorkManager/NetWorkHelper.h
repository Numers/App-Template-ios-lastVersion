//
//  NetWorkHelper.h
//  GLPFinance
//
//  Created by 鲍利成 on 16/10/28.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#ifndef NetWorkHelper_h
#define NetWorkHelper_h
#import "AFNetworking.h"
#import "NetWorkGlobalVar.h"
typedef enum{
    SUCCESSREQUEST = 2000,
    NONEDATA,
    PARAMETERERROR,
    DATAEXCEPTION,
    ILLEGALREQUEST,
    UPDATEFAILED,
    WARNTYPE
}STATUSCODE;
#define TimeOut 15.0f
#define SignatureAPPKey @"RNIuYTzjt3oIDT_chVfxiUA.#B*9WYVA"
#define NetWorkConnectFailedDescription @"网络连接失败"

typedef void (^ApiSuccessCallback)(NSURLSessionDataTask *task, id responseObject);
typedef void (^ApiErrorCallback)(NSURLSessionDataTask *task, id responseObject);
typedef void (^ApiFailedCallback)(NSURLSessionDataTask *task, NSError *error);

typedef void (^ApiDownloadFileProgress)(float progress);

typedef void (^APIRequstCallBack)(NSNumber *status, id data);

#endif /* NetWorkHelper_h */

//
//  NetWorkManager.m
//  GLPFinance
//
//  Created by 鲍利成 on 16/10/28.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import "NetWorkManager.h"
#import "UIImage+FixImage.h"
static AFHTTPSessionManager *requestManager;
static NetWorkManager *scNetWorkManager;
@implementation NetWorkManager
+(id)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (scNetWorkManager == nil) {
            scNetWorkManager = [[NetWorkManager alloc] init];
            requestManager = [AFHTTPSessionManager manager];
            [requestManager.requestSerializer setTimeoutInterval:TimeOut];
        }
    });
    return scNetWorkManager;
}

-(void)post:(NSString *)uri parameters:(id)parameters success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@",API_BASE,uri];
    [requestManager.requestSerializer setValue:[AppUtils token] forHTTPHeaderField:@"Acc-Token"];
    [requestManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(task, error);
    }];
}

-(void)get:(NSString *)uri parameters:(id)parameters success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@",API_BASE,uri];
    [requestManager.requestSerializer setValue:[AppUtils token] forHTTPHeaderField:@"Acc-Token"];
    [requestManager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(task, error);
    }];
}

-(void)put:(NSString *)uri parameters:(id)parameters success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@",API_BASE,uri];
    [requestManager.requestSerializer setValue:[AppUtils token] forHTTPHeaderField:@"Acc-Token"];
    [requestManager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(task, error);
    }];
}


- (void)downloadFileWithOption:(NSDictionary *)paramDic
                 withInferface:(NSString*)requestURI
                     savedPath:(NSString*)savedPath
               downloadSuccess:(ApiSuccessCallback)success
               downloadFailure:(ApiFailedCallback)failure
                      progress:(ApiDownloadFileProgress)progress
{
    NSString *url = [NSString stringWithFormat:@"%@%@",API_BASE,requestURI];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}


-(void)uploadImage:(UIImage *)image uri:(NSString *)uri parameters:(id)parameters  success:(ApiSuccessCallback)success failed:(ApiFailedCallback)failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@",API_BASE,uri];
    [requestManager.requestSerializer setValue:[AppUtils token] forHTTPHeaderField:@"Acc-Token"];
    [requestManager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        UIImage *fixImage = [image fixOrientationWithSize:CGSizeMake(96.0f, 96.0f)];
        NSData *imageData = UIImagePNGRepresentation(fixImage);
        if (imageData == nil) {
            imageData = UIImageJPEGRepresentation(image, 1.0f);
        }
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"head.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(task,error);
    }];
}
@end

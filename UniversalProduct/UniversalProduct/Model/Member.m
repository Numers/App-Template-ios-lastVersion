//
//  Member.m
//  GLPFinance
//
//  Created by 鲍利成 on 2016/11/23.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import "Member.h"

@implementation Member
/**
 字典初始化对象
 
 @param dic 用户信息字典
 @return 用户对象
 */
-(instancetype)initWithDictionary:(NSDictionary *)dic;
{
    self = [super init];
    if (self) {
        if (dic) {
            self.memberId = [dic objectForKey:@"memberId"];
            self.name = [dic objectForKey:@"name"];
            self.company = [dic objectForKey:@"company"];
            self.phone = [dic objectForKey:@"phone"];
            self.token = [dic objectForKey:@"token"];
            self.headIcon = [dic objectForKey:@"headIcon"];
        }
    }
    return self;
}


/**
 将用户对象转义成字典
 
 @return 用户信息字典
 */
-(NSDictionary *)dictionaryInfo
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (_memberId) {
        [dic setObject:_memberId forKey:@"memberId"];
    }
    
    if (_name) {
        [dic setObject:_name forKey:@"name"];
    }
    
    if (_company) {
        [dic setObject:_company forKey:@"company"];
    }
    
    
    if (_phone) {
        [dic setObject:_phone forKey:@"phone"];
    }
    
    if (_token) {
        [dic setObject:_token forKey:@"token"];
    }
    
    if (_headIcon) {
        [dic setObject:_headIcon forKey:@"headIcon"];
    }
    return dic;
}
@end

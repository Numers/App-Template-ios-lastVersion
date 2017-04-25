//
//  Member.h
//  GLPFinance
//
//  Created by 鲍利成 on 2016/11/23.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Member : NSObject
@property(nonatomic, copy) NSString *memberId;
@property(nonatomic, copy) NSString *phone;
@property(nonatomic, copy) NSString *company;
@property(nonatomic, copy) NSString *headIcon;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *token;



/**
 字典初始化对象

 @param dic 用户信息字典
 @return 用户对象
 */
-(instancetype)initWithDictionary:(NSDictionary *)dic;


/**
 将用户对象转义成字典

 @return 用户信息字典
 */
-(NSDictionary *)dictionaryInfo;
@end

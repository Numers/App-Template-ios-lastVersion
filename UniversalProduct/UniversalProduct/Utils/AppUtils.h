//
//  AppUtils.h
//  GLPFinance
//
//  Created by 鲍利成 on 16/10/28.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define API_BASE  [AppUtils returnBaseUrl]
@interface AppUtils : NSObject

/**
 返回当前app版本号

 @return app版本号
 */
+ (NSString*) appVersion;


/**
 设置当前服务器环境

 @param state YES/正式环境  NO/测试环境
 */
+(void)setUrlWithState:(BOOL)state;


/**
 返回当前环境域名

 @return 域名
 */
+(NSString *)returnBaseUrl;


/**
 返回当前登录的用户token

 @return token
 */
+(NSString *)token;


/**
 生成签名字符串

 @param parameters 请求参数
 @param method 请求方法
 @param uri 相对路径
 @param subKey 自定义key
 @return 签名
 */
+(NSString *)generateSignatureString:(NSDictionary *)parameters Method:(NSString *)method URI:(NSString *)uri Key:(NSString *)subKey;

/**
 sha1加密

 @param text 字符串
 @return 加密后字符串
 */
+(NSString*) sha1:(NSString *)text;

/**
 生成attributedStr
 
 @param str 字符串
 @param color 颜色
 @param font 字体
 @return attributedStr
 */
+(NSMutableAttributedString *)generateAttriuteStringWithStr:(NSString *)str WithColor:(UIColor *)color WithFont:(UIFont *)font;


/**
 32位md5加密

 @param str 字符串
 @return 加密后字符串
 */
+(NSString *)getMd5_32Bit:(NSString *)str;

/**
 根据颜色值生成点状图片
 
 @param color 颜色
 @return 点状图片
 */
+(UIImage*) imageWithColor:(UIColor*)color;

/**
 提示控件

 @param text 提示文本
 */
+(void)showInfo:(NSString *)text;

/**
 加载动画控件
 
 @param title 说明
 @param view 当前加载的view
 */
+(void)showHudProgress:(NSString *)title ForView:(UIView *)view;


/**
 带小图标提示控件

 @param text 提示文本
 @param iconView 小图标
 @param view 当前提示的view
 */
+(void)showInfo:(NSString *)text WithIconView:(UIView *)iconView ForView:(UIView *)view;


/**
 判断字符串是否为空

 @param str 字符串
 @return YES/空  NO/不为空
 */
+ (BOOL)isNullStr:(NSString *)str;


/**
 判断是否是手机号码

 @param mobile 手机号
 @return YES/是 NO/否
 */
+ (BOOL)isMobile:(NSString *)mobile;


/**
 判断是否为邮箱

 @param email 邮箱
 @return YES/是 NO/否
 */
+ (BOOL)isEmail:(NSString *)email;


/**
 判断字符串是否是整形数字

 @param string 数字字符串
 @return YES/是 NO/否
 */
+ (BOOL)isPureInt:(NSString*)string;


/**
 判断字符串是否为浮点型数字

 @param string 数字字符串
 @return YES/是 NO/否
 */
+ (BOOL)isPureFloat:(NSString*)string;

/**
 判断字符串是否为合法数字

 @param string 数字字符串
 @return YES/是 NO/否
 */
+(BOOL)isValidateNumericalValue:(NSString *)string;


/**
 判断字符串是否是http链接

 @param url 链接字符串
 @return YES/是  NO/否
 */
+ (BOOL)isNetworkURL:(NSString *)url;

/**
 *  @author Baolicheng, 16-11-22 14:07:14
 *
 *  对float型数字四舍五入
 *
 *  @param value float型数字
 *
 *  @return 四舍五入后的整型
 */
+(NSInteger)floatToInt:(CGFloat)value;


/**
 隐藏加载动画控件

 @param view 当前加载的view
 */
+(void)hidenHudProgressForView:(UIView *)view;

/**
 存取缓存数据方法
 */
+(id)localUserDefaultsForKey:(NSString *)key;
+(void)localUserDefaultsValue:(id)value forKey:(NSString *)key;


/**
 字典转json字符串

 @param dict 字典
 @return json字符串
 */
+(NSString *)convertToJsonData:(NSDictionary *)dict;


/**
 json字符串转字典

 @param jsonString json字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end

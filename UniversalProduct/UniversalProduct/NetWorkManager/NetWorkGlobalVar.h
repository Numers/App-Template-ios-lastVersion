//
//  NetWorkGlobalVar.h
//  GLPFinance
//
//  Created by 鲍利成 on 16/10/28.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#ifndef NetWorkGlobalVar_h
#define NetWorkGlobalVar_h

/*********************API接口****************************/
/************************LoginAPI***********************/
#define GF_Login_API @"/api/v1/public/login"
/*******************************************************/

/************************PasswordResetAPI***********************/
#define GF_PasswordReset_API @"/api/v1/public/forget_password"
#define GF_MessageSend_API @"/api/v1/public/send_sms"
/*******************************************************/

/************************UserCenterAPI***********************/
#define GF_UploadPicture_API @"/api/v1/public/upload_pic"
#define GF_HeadImageSet_API @"/api/v1/user/set_head_image"
/*******************************************************/

/************************FeedbackAPI***********************/
#define GF_Feedback_API @"/api/v1/user/feedback"
/*******************************************************/

/************************CheckAPI***********************/
#define GF_CheckList_API @"/api/v1/check/get_list"
#define GF_CheckInfo_API @"/api/v1/check/get_info"
#define GF_Audit_API @"/api/v1/check/audit"
#define GF_UploadMaterialInfo_API @"/api/v1/check/get_upload_info"
#define GF_LoanInfo_API @"/api/v1/check/get_loan_detail"
/*******************************************************/
/*******************************************************/

#endif /* NetWorkGlobalVar_h */

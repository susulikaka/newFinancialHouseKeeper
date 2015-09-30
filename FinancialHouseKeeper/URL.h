//
//  URL.h
//  URLDemo
//
//  Created by 杨琴 on 15/9/28.
//  Copyright (c) 2015年 yangqin. All rights reserved.
//

#ifndef URLDemo_URL_h
#define URLDemo_URL_h

// 服务器接口
#define kBaseURL @"http://125.70.10.34:1234/icbc/"

// 登录接口
#define kLoginURL @"ipad/ipadLogin/ipad_login.action?"
// 首页接口
#define kHomePageURL @"ipad/show/show_findModel.action?"


/*——————————————————登录————————————————————*/
//登录
#define LOGIN_URL @"ipad/ipadLogin/ipad_login.action"
//首次登录修改用户名和密码
#define CHANGE_N_S_URL @"ipad/ipadLogin/ipad_updateNameAndPass.action"
//修改密码
#define CHANGE_SEC_URL @"ipad/ipadLogin/ipad_updatePass.action"
//修改用户名
#define CHANGE_USER_NAME @"ipad/ipadLogin/ipad_updateUserName.action"
//忘记密码时获取验证码
#define GET_SIGN_URL @"ipad/ipadLogin/ipad_getUnlockCode.action"
//用户修改密码时获取验证码
#define GET_SIGN_C_URL @"ipad/ipadLogin/ipad_getValidCode.action"
//短信验证 修改udid
#define SIGN_URL @"ipad/ipadLogin/ipad_unlock.action"   //@"ipad/ipadLogin/ipad_unlock2.action"

//取回用户名
#define RETRIEVE_USER_NAME @"ipad/ipadLogin/ipad_getCustomerName.action"

//用户单独验证短信是否正确
#define SIGN_FORORDER_URL @"ipad/ipadLogin/ipad_valid.action"
//UDID变动请求解锁
#define SIGN_URL_C_UDID @"ipad/ipadLogin/ipad_getUnlockCode.action"

//获取用户信息
#define SEARCH_PERSON_INFO @"ipad/ipadLogin/cust_findCustData.action"
/*—————————————————————————————————---—————*/

/*——————————————————栏目————————————————————*/
//栏目管理
#define LIST_URL @"ipad/titleIPad/titleIPad_titlelist.action"
/*—————————————————————————————————---—————*/
//
/*——————————————————产品信息—————————————————*/
//产品列表
#define PRODUCT_LIST_URL @"ipad/ipadProduct/ipad_findbyProByUser.action"
//查询产品详情 -- ID查询
#define PRODUCT_INFO_ID_URL @"ipad/ipadProduct/ipad_findById.action"
//查询产品详情 -- 名称查询
#define PRODUCT_INFO_NAME_URL @"ipad/ipadProduct/ipad_findByName.action"
//查询产品详情 -- code查询
#define PRODUCT_INFO_CODE_URL @"ipad/ipadProduct/ipad_findByCode.action"

//查询基金购买详情 -- code查询
#define PRODUCT_INFO_FUNDINFO @"ipad/ipadProduct/found_queryOwnFundType.action"
/*—————————————————————————————————---—————*/
//上传
#define UPLOAD_DATA @"ipad/ipadUpload/f_fileUpload.action"

//查询畅通卡
#define SEARCH_C_CARD_URL  @"ipad/trafficPenalty/trafficPenalty_queryCTCardNumber.action"
//查询借记卡
#define SEARCH_J_CARD_URL  @"ipad/barCodeBill/barCodeBill_cardlist.action"

/*————————————————业务办理-—————————---—————*/

/****** 信用卡 *****/
#define GET_PERSONINFO_FILL @"ipad/creditCard/creditCard_query.action"
//
#define GET_PRO_LIMIT @"ipad/ipadProduct/ipad_getCustLastAmount.action"
//开启工作流
#define OPEN_WORK_URL @"ipad/workflow/workflow_start.action"

//获取订单号
#define GET_ORDER_URL @"ipad/ipadProduct/ipad_findOrderNum.action"
//条形码缴费
#define PAY_FOR_CODE @"ipad/barCodeBill/barCodeBill_payBarCodeBill.action"
/*——————————————————————-—————————---—————*/


/*————————————————业务咨询-—————————---—————*/
//业务咨询
#define OPEN_WORK_URL1 @"consultIpad/quest_findList.action"//问题列表
#define OPEN_WORK_URL2 @"consultIpad/quest_saveReply.action"//提问
#define OPEN_WORK_URL3 @"consultIpad/quest_getAnswerList.action"//回复
/*——————————————————————-—————————---—————*/


/*————————————————畅通卡缴费-—————————---—————*/
//根据条码查询
#define C_GET_FORCODE @"ipad/trafficPenalty/trafficPenalty_queryByNotice.action"
//根据车牌号查询
#define C_GET_FORPLATE @"ipad/trafficPenalty/trafficPenalty_queryByPlateNumber.action"
//根据驾档编号查询
#define C_GET_FORNUMBER @"ipad/trafficPenalty/trafficPenalty_queryByFileNumber.action"
//缴纳罚款
#define C_FOR_PAY @"ipad/trafficPenalty/trafficPenalty_penalty.action"
/*——————————————————————-—————————---—————*/

/*————————————————首页模板—-———————---—————*/
//首页模板
#define MAIN_URL @"ipad/show/show_findModel.action"
/*——————————————————————-—————————---—————*/

/*————————————————附近网点—————————---—————*/
//附近网点
#define SEARCH_NEARBY @"ipad/branchQuery/branchQuery_nearly.action"
#define NEARBY_MORE_INFO @"ipad/branchQuery/branchQuery_branch.action"
/*——————————————————————-—————————---—————*/

/*————————————————活动交流—————————---—————*/
//活动交流历史列表
#define EINLADUNGENLIST @"ipad/acty/ipadActy_actyList.action"//请求列表
#define EINLADUNGENINFOMATION @"ipad/acty/ipadActy_actyInfo.action"//请求某一活动信息
#define EINLADUNGENFORM @"ipad/acty/ipadActy_actyForm.action"//请求活动表单
#define EINLADUNGENFORMSUBMIT @"ipad/acty/ipadActy_infoAdd.action"//提交表单信息
/*——————————————————————-—————————---—————*/

/*————————————————我的预约——————-———————————*/
#define MY_APPOINTMENT @"ipad/ipadProduct/buyready_findBuyreadyByUser.action"
/*——————————————————————-—————————---—————*/

/*————————————————代理产品—————————---—————*/
#define D_PRO @"ipad/ipadProduct/ipad_findbyProByUser.action"
#define D_MOREINFO @"ipad/ipadProduct/ipad_findById.action"//与其他产品的接口相同，金融代理产品类型上送11
#define D_TOBUY @"ipad/ipadProduct/proxy_buy.action"
/*————————————————代理产品—————————---—————*/

/*————————————————风险评估—————————---—————*/
//查询用户的风险评估等级
#define GET_RISK_URL @"ipad/ipadProduct/ipad_riskResult.action"
#define SET_RISK_URL @"ipad/ipadProduct/ipad_riskMaintenance.action"
/*————————————————风险评估—————————---—————*/

/*————————————————设置—————————---—————*/
//修改用户头像
#define CHANGE_USER_HEAD @"ipad/ipadCust/headPic_fileUpload.action"

//修改用户昵称
#define CHANGE_USER_NICKNAME @"ipad/ipadCust/cust_updateNickName.action"
/*————————————————风险评估—————————---—————*/

#endif

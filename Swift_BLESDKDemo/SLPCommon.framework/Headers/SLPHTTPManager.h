//
//  SLPHTTPManager.h
//  SDK
//
//  Created by Michael on 2020/5/28.
//  Copyright © 2020 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLPAidInfo.h"
#import "SLPClockDormancyBean.h"
#import "SLPDataTransferDef.h"
#import "SLPAlarmInfo.h"
NS_ASSUME_NONNULL_BEGIN

#define SLPSharedHTTPManager [SLPHTTPManager sharedInstance]

@interface SLPHTTPManager : NSObject

@property (nonatomic,readonly) NSString *httpIP;
@property (nonatomic,readonly) NSString *sid;

@property (nonatomic,readonly) NSString *urlString;
@property (nonatomic,readonly) NSString *channelID;

+(SLPHTTPManager*)sharedInstance;

- (void)installSDKWithToken:(NSString *)token ip:(NSString *)ip channelID:(NSInteger)channelID timeout:(CGFloat)timeoutInterval completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)bindDevice:(NSString *)deviceID leftRight:(NSInteger)leftRight  timeout:(CGFloat)timeoutInterval completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)unBindDevice:(NSString *)deviceID leftRight:(NSInteger)leftRight  timeout:(CGFloat)timeoutInterval completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)getBindDevice:(NSString *)deviceID  timeout:(CGFloat)timeoutInterval completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)getDeviceVersionWithChannelId:(NSString *)channelId lan:(NSString *)lan  timeout:(CGFloat)timeoutInterval completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)configAidInfo:(SLPAidInfo *)aidInfo deviceInfo:(NSString *)deviceName deviceType:(SLPDeviceTypes)deviceType  timeout:(CGFloat)timeout completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)getAidInfoWithDeviceInfo:(NSString *)deviceName  timeOut:(CGFloat)timeout completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)configClockDormancy:(SLPClockDormancyBean *)clockDormancyBean deviceInfo:(NSString *)deviceName  timeOut:(CGFloat)timeout completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)getClockDormancyWithDeviceInfo:(NSString *)deviceName  timeOut:(CGFloat)timeout completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)getAlarmListWithDeviceInfo:(NSString *)deviceName  timeOut:(CGFloat)timeout completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;

- (void)alarmConfig:(SLPAlarmInfo *)alarmInfo deviceInfo:(NSString *)deviceName deviceType:(SLPDeviceTypes)deviceType  timeOut:(CGFloat)timeout completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;



/*******************************************************************************************************************************
 *******************************************************************************************************************************
/*
 *
 *初始化HTTP信息
 * @parameters 参数
 * {
 * url : @"HTTP地址,类型：String",
 * channelID : @"channelID值，类型：String"
 * }
 */
- (void)initHttpServiceInfo:(NSDictionary *)parameters;

/*
*授权
*@token
*@timeoutInterval
*@completion
*/
- (void)authorize:(NSString *)token
          timeout:(CGFloat)timeoutInterval
       completion:(void (^)(BOOL result,id responseObject, NSString *error))completion;


/*
 *获取当前设备信息
 *@param
 */
- (void)getBindedDeviceInformationWithUserID:(NSString *)userID
                                     timeout:(CGFloat)timeoutInterval
                                   completion:(void (^)(NSInteger status,id responseObject, NSString *error))completion;

/**
 *  绑定设备
 *
 */
- (void)bindDeviceWithParameters:(NSDictionary *)parameters
                                 userID:(NSString *)userID
                                timeOut:(CGFloat)timeoutInterval
                             completion:(void (^)(BOOL result, NSDictionary *dict,NSString *error))completion;

/*
 *  解绑设备
 *
 */

- (void)unBindDeviceWithParameters:(NSDictionary *)parameters
                                userID:(NSString *)userID
                               timeOut:(CGFloat)timeoutInterval
                            completion:(void (^)(BOOL result, NSString *error))completion;


@end

NS_ASSUME_NONNULL_END

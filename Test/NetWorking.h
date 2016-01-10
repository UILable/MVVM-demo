//
//  NetWorking.h
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef void(^NetWorkingBlock)(BOOL isConnect);
//typedef void(^SuccessBlock)(id result);
//typedef void(^FailBlock)();
//typedef void(^ErrorBlock)(id error);


@interface NetWorking : NSObject

#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;


#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (SuccessBlock) successBlock
                   WithErrorCodeBlock: (ErrorBlock) errorBlock
                     WithFailureBlock: (FailBlock) failureBlock;


#pragma GET请求
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (SuccessBlock) successBlock
                  WithErrorCodeBlock: (ErrorBlock) errorBlock
                    WithFailureBlock: (FailBlock) failureBlock;


+(void)httpJsonRequestNetWorkingWithUrlStr:(NSString *)urlStr
                              successBlock:(void(^)(id result))successBlock
                                failBlock :(void(^)())failBlock;
@end

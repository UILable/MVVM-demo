//
//  BaseViewModel.m
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
-(void)netWorkStateWithNetConnectBlock:(NetWorkingBlock)netConnectBlock
                                urlStr: (NSString *) urlStr
{
    BOOL netState = [NetWorking netWorkReachabilityWithURLString:urlStr];
    netConnectBlock(netState);
}
-(void)setBlockWithSuccessBlock:(SuccessBlock)successBlock
                  FailBlock:(FailBlock)failBlock
                 ErrorBlock:(ErrorBlock)errorBlock
{
    _successBlock = successBlock;
    _failBlock = failBlock;
    _errorBlock = errorBlock;
}
@end

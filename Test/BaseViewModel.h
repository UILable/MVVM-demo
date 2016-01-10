//
//  BaseViewModel.h
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorking.h"
#import "SongInfoModel.h"
#import "SingerModel.h"

@interface BaseViewModel : NSObject

@property(nonatomic,copy)SuccessBlock successBlock;
@property(nonatomic,copy)FailBlock failBlock;
@property(nonatomic,copy)ErrorBlock errorBlock;


//获取网络的链接状态
-(void)netWorkStateWithNetConnectBlock:(NetWorkingBlock )netConnectBlock
                                urlStr: (NSString *) urlStr;
// 传入交互的Block块
-(void)setBlockWithSuccessBlock:(SuccessBlock)successBlock
                      FailBlock:(FailBlock)failBlock
                     ErrorBlock:(ErrorBlock)errorBlock;

@end

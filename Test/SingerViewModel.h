//
//  SingerViewModel.h
//  Test
//
//  Created by admin on 16/1/10.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "BaseViewModel.h"

@interface SingerViewModel : BaseViewModel

//获取数据
//-(void)getSingerData;

//
-(void)getSingersFromArea:(NSString *)area
                      Sex:(NSString *)sex
                    Group:(NSString *)group
                   Offset:(NSInteger)offset;

@end

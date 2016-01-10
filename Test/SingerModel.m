
//
//  SingerModel.m
//  Test
//
//  Created by admin on 16/1/10.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "SingerModel.h"

@implementation SingerModel
-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
}
-(void)setValueFromDict:(NSDictionary *)dic
{
    self.name = dic[@"name"];
    self.avatar_mini = dic[@"avatar_mini"];
}
@end

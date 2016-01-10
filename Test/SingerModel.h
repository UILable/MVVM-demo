//
//  SingerModel.h
//  Test
//
//  Created by admin on 16/1/10.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingerModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *avatar_mini;

-(void)setValueFromDict:(NSDictionary *)dic;
@end

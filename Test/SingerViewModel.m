//
//  SingerViewModel.m
//  Test
//
//  Created by admin on 16/1/10.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "SingerViewModel.h"

@implementation SingerViewModel

//-(void)getSingerData
//{
//    [NetWorking NetRequestGETWithRequestURL:Hot_Singers WithParameter:nil WithReturnValeuBlock:^(id result) {
//        [self dataProcess:result];
//        
//    } WithErrorCodeBlock:^(id error) {
//        self.errorBlock(error);
//    } WithFailureBlock:^{
//        self.failBlock();
//    }];
//}

-(void)getSingersFromArea:(NSString *)area
                      Sex:(NSString *)sex
                    Group:(NSString *)group
                   Offset:(NSInteger)offset
{
//    NSString *urlStr = [NSString stringWithFormat:Singer_Group,(long)offset,area,sex,group];
//    NSLog(@"----%@",[NSString stringWithFormat:Singer_Group,(long)offset,area,sex,group]);
//    [NetWorking NetRequestGETWithRequestURL:urlStr WithParameter:nil WithReturnValeuBlock:^(id result) {
//        [self dataProcess:result];
//    } WithErrorCodeBlock:^(id error) {
//        self.errorBlock(error);
//    } WithFailureBlock:^{
//        self.failBlock();
//    }];
    
    
    //&offset=%ld&area=%@&sex=%@&abc=%@
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@(offset) forKey:@"offset"];
    [parameter setValue:area forKey:@"area"];
    [parameter setValue:sex forKey:@"sex"];
    [parameter setValue:group forKey:@"abc"];

    [NetWorking NetRequestPOSTWithRequestURL:Singer_Url WithParameter:parameter WithReturnValeuBlock:^(id result) {
        [self dataProcess:result];
    } WithErrorCodeBlock:^(id error) {
        self.errorBlock(error);
    } WithFailureBlock:^{
        self.failBlock();
    }];
    
 
}
-(void)dataProcess:(id )data
{
    NSMutableArray *returnArr=[NSMutableArray array];
    if ([[data objectForKey:@"artist"] isKindOfClass:[NSArray class]]) {
        NSArray *array=[data objectForKey:@"artist"];
        for (NSDictionary *dic in array) {
            SingerModel *model=[[SingerModel alloc] init];
//kvc赋值不行了，好奇怪
//            [model setValuesForKeysWithDictionary:dic];
            [model setValueFromDict:dic];
//            NSLog(@"---%@",dic[@"name"]);
//            NSLog(@"===%@",model.name);
            [returnArr addObject:model];
        }
    }
    self.successBlock(returnArr);
}
@end

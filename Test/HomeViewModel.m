//
//  HomeViewModel.m
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "HomeViewModel.h"

@implementation HomeViewModel
-(void)getHomeData
{
    [NetWorking httpJsonRequestNetWorkingWithUrlStr:Home_Url successBlock:^(id result) {
        
//        NSLog(@"%@",result);
        
        NSArray *array = result[@"result"][@"list"];
        NSMutableArray *dataArr=[[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            SongInfoModel *model = [[SongInfoModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [dataArr addObject:model];
        }
        self.successBlock(dataArr);
        
    } failBlock:^{
        
    }];
}
-(void)tableViewDidSelectedPlaySongWithDataArr:(NSMutableArray *)dataArr AndIndex:(NSInteger)index
{
}

@end

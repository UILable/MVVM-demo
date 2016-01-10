//
//  HomeViewModel.h
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeViewModel : BaseViewModel

//获取数据
-(void)getHomeData;
//点击事件
-(void)tableViewDidSelectedPlaySongWithDataArr:(NSMutableArray *)dataArr AndIndex:(NSInteger)index;

@end

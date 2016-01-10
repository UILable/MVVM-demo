//
//  SingersViewController.h
//  Test
//
//  Created by admin on 16/1/10.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingerViewModel.h"
@interface SingersViewController : UIViewController
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *area;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *group;
@property (nonatomic, assign)NSInteger offset;

@property (nonatomic,retain)SingerViewModel *viewModel;


@end

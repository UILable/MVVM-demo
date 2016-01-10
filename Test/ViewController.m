//
//  ViewController.m
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "HomeViewModel.h"
#import "SingersViewController.h"

//http://www.jianshu.com/p/6e24f6b6a1a6
//http://www.jianshu.com/p/e01e2fe8f4ba
/*
 MVVM = Model + View + ViewModel
 
 看上去和MVC差不多，就是把ViewController替换成了ViewModel。如果是这样的话，MVVM压根就没有存在的必要了。所以并不是进行了简单的替换。MVVM由3部分组成：Model ， View ， ViewModel。

 Model: 作为数据的容器
 View: 负责界面的展示以及用户交互的处理
 ViewModel: 负责业务逻辑处理
 */

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor cyanColor];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTableViewCellid"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self initData];
}
-(void)initData
{
    //MVVM 其实就是将请求放到ViewModel中，减少控制器的东西
    _dataArr = [NSMutableArray array];
    HomeViewModel *viewModel = [[HomeViewModel alloc]init];
    [viewModel setBlockWithSuccessBlock:^(id result) {
//        NSLog(@"%@",result);
        _dataArr = result;
        [_tableView reloadData];
    } FailBlock:^{
        
    } ErrorBlock:^(id error) {
        NSLog(@"error- %@",error);
    }];
    
    [viewModel getHomeData];//请求数据并解析
    /*
     这里的代码是将请求封装到ViewModel即HomeViewModel中，因为这是个Block，也就是个闭包，所以程序先执行[viewModel getHomeData];,在ViewModel中进行数据请求，并进行解析，解析完成之后将含有model的数组回调        self.successBlock(dataArr);,回调之后，最后执行这个block闭包，也就是把回调的数据赋给数据源_dataArr，刷新单元格
     */
}
#pragma mark - delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCellid"];
    [cell setModel:_dataArr[indexPath.row ]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SongInfoModel *model  = _dataArr[indexPath.row];
    NSLog(@"---%@",model.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toChineseManSinglerAction:(id)sender {
//    SingersViewController *vc=[[SingersViewController alloc]init];
//    [vc setModalPresentationStyle:UIModalPresentationCurrentContext];
//    [self presentViewController:vc animated:YES completion:nil];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SingersViewController *vc =[storyBoard instantiateViewControllerWithIdentifier:@"singer"];
    [self presentViewController:vc animated:YES completion:nil];
}

@end

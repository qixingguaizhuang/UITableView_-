//
//  SecondController.m
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import "SecondController.h"
#import "Cellforimage.h"

@interface SecondController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, retain)UITableView *tableView;
@property(nonatomic, retain)NSArray *arrImage;

@end

@implementation SecondController


- (void)dealloc{

    [_tableView release];
    [_arrImage release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self handleDate];
    
    [self createTableView];
    
    
    
}

/** 数据处理 */

- (void)handleDate{

    self.arrImage = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    
}

/** tableview */

- (void)createTableView{

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[Cellforimage class] forCellReuseIdentifier:@"pool2"];
    
    
}

#pragma mark -- UITableViewDateSource 代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrImage.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    Cellforimage *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
    
    cell.imageViewForPic.image = [UIImage imageNamed:[self.arrImage objectAtIndex:indexPath.row]];
    
    return cell;

}

#pragma mark -- delegate 方法

/** 返回每行的高度*/


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    /** 从相册数组中取出 相册名称的字符串 */
    
    NSString *name = [self.arrImage objectAtIndex:indexPath.row];
    
    /** 调用 cell 方法 计算法 ___//>>> 详见 cell .m*/
    
    return [[Cellforimage class] heightForCellWithName:name];


}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

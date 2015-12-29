//
//  ViewController.m
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import "ViewController.h"
#import "CellOfNews.h"
#import "ModenOfNew.h"
#import "SecondController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *arrModel;

@end

@implementation ViewController


- (void)dealloc{

    [_tableView release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    [self handleDate];
}

/** 创建 TableView **/

- (void)createTableView{

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    [_tableView release];
    
    /** 指定 vc 为代理人*/

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    /** 注册重用池 ,自动创建重用池 **/
    
    [self.tableView registerClass:[CellOfNews class] forCellReuseIdentifier:@"pool1"];
}


/** 处理数据 */

- (void)handleDate{
    
    /** 初始化数组,数组用于存放 model 对象 */

    self.arrModel = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"R" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    /** 取出数组 */
    
    NSArray *arr = [result objectForKey:@"news"];
    
    /** 遍历数组,将数组中的字典转换成 model */
    
    for (NSDictionary *dic in arr) {
        
        /** 取出了小字典中 key 对应的 Value 值 存到 model 对象中 */
        ModenOfNew *model = [[ModenOfNew alloc] init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        /** 将model 添加到 model 数组中 @[@"model",@"model",@"model"] */
        [self.arrModel addObject:model];
        [model release];
    }

}


#pragma mark --- UITableViewDateSource 两个协议方法

/** 返回每个分区的行数 *  N0.1 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModel.count;
}


/** 返回每个行的 cell   * N0.2 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /** 自定义cell类的指针指向 一个重用池 N0.3 */
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    /** 通过每行的 row 找到在 model 数组中的 model 对象 */
    ModenOfNew *model = [self.arrModel objectAtIndex:indexPath.row];
    
    /** 调用传值方法,从 自定义 cell 中获取 N0.5 */
    
    [cell passModel:model];//cell 赋值方法为什么写到 cell.m 中??????
    
    
    /* 返回 cell  N0.7 **/
    return cell;


}


/** 返回每行的高度  N0.8 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ModenOfNew *model = [self.arrModel objectAtIndex:indexPath.row];
    
    /** 通过 cell 的计算高度方法,返回高度值 --->>> cell.m 中*/
    
    return [CellOfNews heightForCell:model];

}


/** 添加点击事件 点击 cell 之后调用此方法,进行跳转,这个方法会在 pag.2 调用 */


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    SecondController *second = [[SecondController alloc]init];
    
    [self.navigationController pushViewController:second animated:YES];
    
    [second release];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

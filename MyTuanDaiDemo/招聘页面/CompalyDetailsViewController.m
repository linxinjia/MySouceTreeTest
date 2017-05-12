//
//  CompalyDetailsViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/5/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CompalyDetailsViewController.h"

@interface CompalyDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGSize size;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CompalyDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    size = [UIScreen mainScreen].bounds.size;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, size.width, size.height-64-50) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

#pragma mark-- setup
- (void)setupData{
    
}
- (void)setupView{
    
}

#pragma mark - UITableViewDelegate
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellReuse = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuse];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellReuse];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    switch (indexPath.row) {
        case 0:{
            cell.textLabel.text = @"招聘";
            break;
        }
            
            
        default:
            cell.textLabel.text = @"cell";
            break;
    }
    
    return cell;
}


#pragma mark - getters



@end

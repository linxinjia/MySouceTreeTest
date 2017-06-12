//
//  TDFeedBackViewController.m
//  MyTuanDaiDemo
//
//  Created by Apple on 17/6/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TDAdviceViewController.h"

@interface TDAdviceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TDAdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = UIColorFromRGB(0xf2f2f0);
    self.title = @"意见反馈";
    
//    self.navigationController.navigationBar.translucent = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;    
}

- (void)setupData{
    
}

- (void)setupView{
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 44;
    }else{
        return 0.01;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellResuse = @"resuseCell";

    UITableViewCell *resuseCell = [tableView dequeueReusableCellWithIdentifier:cellResuse];
    if (!resuseCell) {
        resuseCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellResuse];
    }
    
    return resuseCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = UIColorFromRGB(0xf2f2f0);
    UILabel *titleLabel = [[UILabel alloc] init];
    [headerView addSubview:titleLabel];
    
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)]];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [UIView new];
    footerView.backgroundColor = UIColorFromRGB(0xf2f2f0);
    
    

    return footerView;
}

#pragma mark - getter
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"请选择您反馈内容的类型",@"详情描述",@"联系方式(可选)"];
    }
    return _titleArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorFromRGB(0xf2f2f0);
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_tableView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
    }
    return _tableView;
}

@end

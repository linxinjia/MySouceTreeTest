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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    size = [UIScreen mainScreen].bounds.size;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
    [self setupData];
}

#pragma mark-- setup

- (void)setupView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 100, 40)];
    [self.view addSubview:backButton];
    [backButton setImage:[UIImage imageNamed:@"back_red"] forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 80)];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupData{
    
}

#pragma mark - action
- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
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

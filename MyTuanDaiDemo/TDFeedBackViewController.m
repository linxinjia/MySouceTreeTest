//
//  TDFeedBackViewController.m
//  MyTuanDaiDemo
//
//  Created by Apple on 17/6/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TDFeedBackViewController.h"

@interface TDFeedBackViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TDFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;
    
    
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellResuse = @"resuseCell";

    UITableViewCell *resuseCell = [tableView dequeueReusableCellWithIdentifier:cellResuse];
    
    return resuseCell;
}


#pragma mark - getter
- (UITableView *)tableView{
    if (!_tableView ) {
//        _tableView
    }
    return _tableView;
}
@end

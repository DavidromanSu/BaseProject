//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
@interface TuWanListViewController()
@property (nonatomic,strong)TuWanViewModel *tuwanVM;

@end
@implementation TuWanListViewController
-(TuWanViewModel *)tuwanVM{
    if (_tuwanVM == nil) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
              [self.tableView reloadData];
        }];
      
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tuwanVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"a4814049"]
     ];
    cell.titleLB.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLB.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clickNumLB.text = [self.tuwanVM clickForRowInList:indexPath.row];
    return cell;
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

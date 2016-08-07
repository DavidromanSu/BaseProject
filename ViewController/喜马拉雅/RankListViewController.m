//
//  RankListViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryViewModel.h"
#import "XiMaCategoryCell.h"
#import "MusicListViewController.h"
@interface RankListViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XiMaCategoryViewModel *XiMaVM;
@end
@implementation RankListViewController
-(XiMaCategoryViewModel *)XiMaVM{
    if (!_XiMaVM) {
        _XiMaVM = [[XiMaCategoryViewModel alloc]init];
    }
    return _XiMaVM;
}
+(UINavigationController *)defaultNavi{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
          RankListViewController *vc = [RankListViewController new];
  navi = [[UINavigationController alloc]initWithRootViewController:vc];
       
            });
    
    return navi;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_tableView];
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.XiMaVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView.header endRefreshing];
                [_tableView reloadData];
            }];
        }];
        _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            [self.XiMaVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.footer endRefreshing];
                [_tableView reloadData];
            }];
            
        }];
    }
    [_tableView.header beginRefreshing];
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.XiMaVM rowNum];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLb.text = [self.XiMaVM titleForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.XiMaVM albumCoverURLForRow:indexPath.row]];
    cell.numberLb.text = [self.XiMaVM tracksForRow:indexPath.row];
    cell.orderLb.text = @(indexPath.row+1).stringValue;
    cell.descLb.text = [self.XiMaVM introForRow:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170/2;
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MusicListViewController *vc = [[MusicListViewController alloc]initWithAlbumId:[self.XiMaVM albumIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"音乐排行榜";
    [self.tableView reloadData];
    
}
@end

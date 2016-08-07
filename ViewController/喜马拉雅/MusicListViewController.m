//
//  MusicListViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MusicListViewController.h"
#import "ximalaya.h"
#import "MusicDetailCell.h"
#import "XiMaAlbumViewModel.h"
#import "playView.h"
@interface MusicListViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)XiMaAlbumViewModel *VM;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic)NSInteger albumId;
@end
@implementation MusicListViewController
-(XiMaAlbumViewModel *)VM{
    if (!_VM) {
        _VM =[[XiMaAlbumViewModel alloc]initWithAlbumId:self.albumId];
    }
    return _VM;
}
-(UITableView *)tableView{
    _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"cell"];
    _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"cell"];
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.VM refreshDataCompletionHandle:^(NSError *error) {
           [_tableView reloadData];
           [_tableView.header endRefreshing];
           [_tableView.footer resetNoMoreData];
       }];
    }];
    _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        if ([self.VM isHasMore]) {
            [self.VM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.footer endRefreshing];
                [_tableView reloadData];
            }];
            
        }else{
            [_tableView.footer endRefreshingWithNoMoreData];}
    }];
    return  _tableView;
}
-(id)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.VM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.coverIV.imageView setImageWithURL:[self.VM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text=[self.VM titleForRow:indexPath.row];
    cell.timeLb.text = [self.VM timeForRow:indexPath.row];
    cell.sourceLb.text=[self.VM sourceForRow:indexPath.row];
    cell.playCountLb.text=[self.VM playCountForRow:indexPath.row];
    cell.favorCountLb.text=[self.VM favorCountForRow:indexPath.row];
    cell.commentCountLb.text=[self.VM commentCountForRow:indexPath.row];
    cell.durationLb.text = [self.VM durationForRow:indexPath.row];
    return cell;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
    [Factory addBackItemToVC:self];
    [self.view addSubview:[playView shareInstance]];
    [[playView shareInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];

}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[playView shareInstance]playWithURL:[self.VM musicURLForRow:indexPath.row]];
    
}
@end

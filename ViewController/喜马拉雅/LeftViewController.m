//
//  LeftViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "TuWanViewController.h"
#import "RankListViewController.h"
#import "DuoWanTabBarController.h"
@interface LeftViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *items;

@end
@implementation LeftViewController
-(NSArray *)items{
    if (!_items) {
        _items = @[@"游戏资讯", @"喜马拉雅", @"英雄联盟", @"个人设置"];
    }return _items;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
           
        }];
       _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = 1;
    cell.textLabel.text = self.items[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
   // cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            [self.sideMenuViewController setContentViewController:[TuWanViewController standardTuWanNavi]animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
            break;
        case 1:{
            [self.sideMenuViewController setContentViewController:[RankListViewController defaultNavi]animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
        case 2:{
            [self.sideMenuViewController setContentViewController:[DuoWanTabBarController standardInstance]animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        default:
            break;
    }
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView reloadData];
}
@end

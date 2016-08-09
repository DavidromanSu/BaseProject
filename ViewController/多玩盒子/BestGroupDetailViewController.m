//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupDetailCell.h"
#import "BestGroupIntroCell.h"

@interface BestGroupDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation BestGroupDetailViewController

- (id)initWithTitle:(NSString *)title desc:(NSString *)desc icons:(NSArray *)icons decs:(NSArray *)descs{
    if (self = [super init]) {
        self.title0 = title;
        self.desc = desc;
        self.icons = icons;
        self.descs = descs;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"阵容详情";
    [self.tableView reloadData];
    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return _descs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        BestGroupIntroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IntroCell"];
        cell.titleLb.text = _title0;
        cell.desLb.text = _desc;
        NSArray *arr = @[cell.icon1, cell.icon2,cell.icon3,cell.icon4,cell.icon5];
        [arr enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj setImageWithURL:_icons[idx] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        }];
        return cell;
    }else{
        BestGroupDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroCell"];
        [cell.icon setImageWithURL:_icons[indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        cell.desLb.text = _descs[indexPath.row];
        return cell;
    }
}
kRemoveCellSeparator
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //去掉头部的section和脚步section的显示范围
        _tableView.contentInset=UIEdgeInsetsMake(-1, 0, -10, 0);
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[BestGroupIntroCell class] forCellReuseIdentifier:@"IntroCell"];
        [_tableView registerClass:[BestGroupDetailCell class] forCellReuseIdentifier:@"HeroCell"];
    }
    return _tableView;
}

@end

//
//  BaikeViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaikeViewController.h"
#import "ToolMenuViewModel.h"
#import "ToolMenuModel.h"
#import "TuWanHTMLViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategoryViewController.h"
@interface BaiKeCell :UITableViewCell
@property(strong,nonatomic)UIImageView *iconIV;
@property(strong,nonatomic)UILabel *titleLb;

@end
@implementation BaiKeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(0);
        }];
        _titleLb.font = [UIFont systemFontOfSize:17];
        
    }
    return _titleLb;
}

@end



@interface BaikeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)ToolMenuViewModel *vm;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BaikeViewController
- (ToolMenuViewModel *)vm {
    if(_vm == nil) {
        _vm = [[ToolMenuViewModel alloc] init];
     
    }
    return _vm;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [self.vm getDataFromNetCompleteHandle:^(NSError *error) {
            [_tableView reloadData];
        }];
        [_tableView registerClass:[BaiKeCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [UIView new];
        
        
    }return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.vm rowNumber];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiKeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.iconIV setImageWithURL:[self.vm iconURLForRow:indexPath.row]];
    cell.titleLb.text = [self.vm titleForRow:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 51;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.vm itemTypeForRow:indexPath.row] ==ToolMenuItemTypeWeb) {
        TuWanHTMLViewController *vc = [[TuWanHTMLViewController alloc]initWithURL:[self.vm webURLForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
        vc.hidesBottomBarWhenPushed = YES;
    }
    if ([[self.vm tagForRow:indexPath.row] isEqual:@"best_group"]) {
        BestGroupViewController *vc = [BestGroupViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        vc.hidesBottomBarWhenPushed = YES;
    }
    if ([[self.vm tagForRow:indexPath.row]isEqualToString:@"item"]) {
        ZBCategoryViewController *VC = [ZBCategoryViewController new];
        [self.navigationController pushViewController:VC animated:YES];
        VC.hidesBottomBarWhenPushed = YES;
    }
}
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"游戏百科";
    }return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView reloadData];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

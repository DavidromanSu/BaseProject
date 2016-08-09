//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupModel.h"
#import "BestGroupViewModel.h"
#import "BestGroupCell.h"
#import "BestGroupDetailViewController.h"
@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)BestGroupViewModel *vm;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BestGroupViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:_tableView];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [self.vm getDataFromNetCompleteHandle:^(NSError *error) {
            [_tableView reloadData];
        }];
        
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.vm rowNum];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLb.text = [self.vm titleForRow:indexPath.row];
    [cell.icon1 setImageWithURL:[self.vm heroIconsForRow:indexPath.row][0]];
    [cell.icon2 setImageWithURL:[self.vm heroIconsForRow:indexPath.row][1]];
    [cell.icon3 setImageWithURL:[self.vm heroIconsForRow:indexPath.row][2]];
    [cell.icon4 setImageWithURL:[self.vm heroIconsForRow:indexPath.row][3]];
    [cell.icon5 setImageWithURL:[self.vm heroIconsForRow:indexPath.row][4]];
    cell.desLb.text =[self.vm descForRow:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BestGroupDetailViewController *vc = [[BestGroupDetailViewController alloc]initWithTitle:[self.vm titleForRow:indexPath.row] desc:[self.vm descForRow:indexPath.row] icons:[self.vm heroIconsForRow:indexPath.row] decs:[self.vm descsForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最佳阵容";
    [Factory addBackItemToVC:self];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BestGroupViewModel *)vm {
	if(_vm == nil) {
		_vm = [[BestGroupViewModel alloc] init];
	}
	return _vm;
}

@end

//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//
@interface ZBCategoryCell :UITableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
@implementation ZBCategoryCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

@end
#import "ZBCategoryViewController.h"
#import "ZBCategoryViewModel.h"
#import "ZBDetailViewController.h"
@interface ZBCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)ZBCategoryViewModel *VM;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ZBCategoryViewController
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [self.VM getDataFromNetCompleteHandle:^(NSError *error) {
            [_tableView reloadData];
        }];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[ZBCategoryCell class] forCellReuseIdentifier:@"Cell"];

    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.VM rowNum];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.VM titleForRow:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZBDetailViewController *VC = [[ZBDetailViewController alloc]initWithTag:[self.VM tagForRow:indexPath.row] name:[self.VM titleForRow:indexPath.row]];
    [self.navigationController pushViewController:VC animated:YES];
    VC.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"装备分类";
    [self.tableView reloadData];
    [Factory addBackItemToVC:self];
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

- (ZBCategoryViewModel *)VM {
	if(_VM == nil) {
		_VM = [[ZBCategoryViewModel alloc] init];
	}
	return _VM;
}

@end
